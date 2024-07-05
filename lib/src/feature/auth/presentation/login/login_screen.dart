import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/common/services/navigation_services.dart';
import 'package:prueba_tecnica/src/common/theme/colors.dart';
import 'package:prueba_tecnica/src/feature/auth/presentation/register/register_screen.dart';
import 'package:prueba_tecnica/src/feature/auth/state/login/login_cubit.dart';
import 'package:prueba_tecnica/src/feature/home/presentation/home/home_screen.dart';
import 'package:prueba_tecnica/src/feature/widgets/alerts/custom_alerts.dart';
import 'package:prueba_tecnica/src/feature/widgets/buttons/custom_elevated_button.dart';
import 'package:prueba_tecnica/src/feature/widgets/buttons/custom_text_button.dart';
import 'package:prueba_tecnica/src/feature/widgets/custom_loading.dart';
import 'package:prueba_tecnica/src/feature/widgets/custom_text_field.dart';
import 'package:prueba_tecnica/src/utils/type_validator.dart';
import 'package:prueba_tecnica/src/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit cubit = LoginCubit();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: defaultPadding,
                ),
                child: _content(context),
              ),
            ),
          ),
        ),
        BlocConsumer<LoginCubit, LoginState>(
          bloc: cubit,
          listener: (context, state) {
            if (state is LoginSuccessState) {
              NavigationServices.pushAndRemoveUntil(
                context,
                screen: const HomeScreen(),
                routeName: HomeScreen.routeName,
              );
            } else if (state is LoginErrorState) {
              CustomAlert.alertDialog(
                context,
                type: AlertType.error,
                title: 'Error',
                message: 'Error al iniciar sesion',
                textButton: 'Aceptar',
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            }
          },
          builder: (_, state) {
            if (state is LoginLoadingState) {
              return const CustomLoading();
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _content(BuildContext context) => Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Iniciar Sesion',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            CustomTextField(
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => cubit.changeEmail(value),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo requerido';
                } else if (!ValidatorText.email.hasMatch(value)) {
                  return 'Ingresa un email valido';
                } else {
                  return null;
                }
              },
            ),
            // FormEmailLogin(model: model),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'Password',
              onChanged: (value) => cubit.changeEmail(value),
            ),
            const SizedBox(height: 30),
            CustomElevatedButton(
              text: 'Iniciar Sesion',
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (formKey.currentState!.validate()) {
                  cubit.submit();
                }
              },
            ),

            const SizedBox(height: 30),
            // forgot password customTextButton
            CustomTextButton(
              text: 'Registrate',
              textStyle: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              onPressed: () => NavigationServices.push(
                context,
                screen: const RegisterScreen(),
                routeName: RegisterScreen.routeName,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
}
