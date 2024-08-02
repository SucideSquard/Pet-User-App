import 'package:flutter/material.dart';
import 'package:user_app/common/constants/sizes.dart';
import 'package:user_app/features/auth/widgets/back-button.dart';
import 'package:user_app/features/auth/widgets/login-form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
        children: [
          const Text(
            'Dear Comrade',
            style: TextStyle(
              fontSize: Sizes.fontSizexl,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Find your Pet',
            style: TextStyle(
              fontSize: Sizes.fontSizeLg,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              // Image.asset()
              const SizedBox(
                height: Sizes.defaultSpace,
              ),
              const Text(
                'Welcome Again',
                style: TextStyle(
                  fontSize: Sizes.fontSizexl,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const LoginForm(),
              const SizedBox(
                height: Sizes.defaultSpace,
              ),
              BackButtonWidget(
                text: 'Don\'t Have an Account ? ',
                buttonName: 'Sign Up',
                onTap: () {
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, Routes.register, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthHeader {
  const AuthHeader();
}
