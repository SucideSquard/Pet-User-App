import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:user_app/core/constants/sizes.dart';
import 'package:user_app/core/widgets/custom-button.dart';
import 'package:user_app/core/widgets/custom-text-field.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final form = FormGroup({
    'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'phone': FormControl<int>(validators: [
      Validators.required,
      Validators.pattern("^[0-9]*"),
      Validators.minLength(10)
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.pattern(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
    ]),
  });
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: <Widget>[
          ReactiveCustomTextField(
            formControlName: 'name',
            hinttext: 'Name',
            prefixIcon: const Icon(Icons.person),
            validationMessages: {
              'required': (error) => 'The Name must not be empty',
              'minLength': (error) =>
                  'The Name must have at least 3 characters',
            },
          ),
          const SizedBox(
            height: Sizes.spaceBtwInputFields,
          ),
          ReactiveCustomTextField(
            formControlName: 'phone',
            hinttext: 'Phone',
            prefixIcon: const Icon(Icons.phone),
            validationMessages: {
              'required': (error) => 'The Phone number must not be empty',
              'minLength': (error) => 'The Phone Number must have 10 Numbers'
            },
            keyBoardtype: TextInputType.number,
          ),
          const SizedBox(
            height: Sizes.spaceBtwInputFields,
          ),
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
            text: 'Sign Up',
            onTap: form.valid ? () {} : () {},
          ),
        ],
      ),
    );
  }
}
