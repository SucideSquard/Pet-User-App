import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:user_app/common/constants/sizes.dart';
import 'package:user_app/features/auth/widgets/auth-button.dart';
import 'package:user_app/features/auth/widgets/auth-text-field.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final form = FormGroup({
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.pattern(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
    ]),
  });

  @override
  Widget build(BuildContext context) {
    //   void handleSubmit() async {
    //     ref.watch(authControllerProvider.notifier).login(
    //           context: context,
    //           email: form.control('email').value,
    //           password: form.control('password').value,
    //         );
    //   }
    // }
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: <Widget>[
          ReactiveCustomTextField(
            formControlName: 'email',
            hinttext: 'Email',
            prefixIcon: const Icon(Icons.email),
            validationMessages: {
              'required': (error) => 'The password must not be empty',
            },
          ),
          const SizedBox(
            height: Sizes.spaceBtwInputFields,
          ),
          ReactiveCustomTextField(
            formControlName: 'password',
            hinttext: 'Password',
            prefixIcon: const Icon(Icons.lock),
            obsecureText: true,
            validationMessages: {
              'required': (error) => 'The password must not be empty',
              'minLength': (error) =>
                  'The password must have at least 8 characters'
            },
          ),
          const SizedBox(
            height: 16,
          ),
          AuthButton(
            text: 'Sign in',
            onTap: form.valid ? () {} : () {},
          ),
        ],
      ),
    );
  }
}
