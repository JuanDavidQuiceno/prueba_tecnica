import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/common/services/local_storage.dart';
import 'package:prueba_tecnica/src/common/services/navigation_services.dart';
import 'package:prueba_tecnica/src/feature/auth/presentation/login/login_screen.dart';
import 'package:prueba_tecnica/src/feature/widgets/buttons/custom_elevated_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: 'Profile',
          child: Text(
            'Profile',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: Center(
        child: CustomElevatedButton(
          onPressed: () {
            LocalStorage.token = '';
            NavigationServices.pushAndRemoveUntil(
              context,
              screen: const LoginScreen(),
              routeName: LoginScreen.routeName,
            );
          },
          text: 'Cerrar sesión',
        ),
      ),
    );
  }
}
