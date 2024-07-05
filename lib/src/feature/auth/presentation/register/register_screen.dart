import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_tecnica/src/common/theme/colors.dart';
import 'package:prueba_tecnica/src/feature/auth/state/login/login_cubit.dart';
import 'package:prueba_tecnica/src/feature/auth/state/register/register_cubit.dart';
import 'package:prueba_tecnica/src/feature/widgets/buttons/custom_elevated_button.dart';
import 'package:prueba_tecnica/src/feature/widgets/buttons/custom_text_button.dart';
import 'package:prueba_tecnica/src/feature/widgets/custom_loading.dart';
import 'package:prueba_tecnica/src/feature/widgets/custom_text_field.dart';
import 'package:prueba_tecnica/src/utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit cubit = RegisterCubit();
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
          //_content(context),
        ),
        BlocBuilder<RegisterCubit, RegisterState>(
          bloc: cubit,
          builder: (_, state) {
            if (state is RegisterLoadingState) {
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
                'Registrate',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            CustomTextField(
              labelText: 'Nombre',
              onChanged: (value) => cubit.changeName(value),
            ),
            // FormEmailLogin(model: model),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'Apellido',
              onChanged: (value) => cubit.changeLastName(value),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'Telefono',
              onChanged: (value) => cubit.changePhone(value),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'Correo',
              onChanged: (value) => cubit.changePhone(value),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'Contraseña',
              onChanged: (value) => cubit.changePassword(value),
            ),

            const SizedBox(height: 20),
            CustomElevatedButton(
              text: 'Registrarse',
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (formKey.currentState!.validate()) {
                  cubit.submit();
                }
              },
            ),
            const SizedBox(height: 30),
            // ButtonLogin(formKey: formKey, model: model),
          ],
        ),
      );
}
