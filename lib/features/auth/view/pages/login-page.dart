import 'package:flutter/material.dart';
import 'package:user_app/core/constants/sizes.dart';
import 'package:user_app/features/auth/view/pages/register-page.dart';
import 'package:user_app/features/auth/view/widgets/back-button.dart';
import 'package:user_app/features/auth/view/widgets/login-form.dart';

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
          title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dear Comrade',
            style: TextStyle(
              fontSize: Sizes.fontSize2xl,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              Center(
                child: Image.asset(
                  'assets/images/file.png',
                  height: 250,
                ),
              ),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              const Text(
                'Welcome Again',
                style: TextStyle(
                  fontSize: Sizes.fontSize2xl,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: Sizes.defaultSpace,
              ),
              const LoginForm(),
              const SizedBox(
                height: Sizes.defaultSpace,
              ),
              Center(
                child: BackButtonWidget(
                  text: 'Don\'t Have an Account ? ',
                  buttonName: 'Sign Up',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                ),
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
