import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/common/constants/sizes.dart';
import 'package:user_app/common/widgets/snackbar.dart';
import 'package:user_app/features/profile/view/widgets/editable-field.dart';

class PersonalInfo extends ConsumerStatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  ConsumerState<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends ConsumerState<PersonalInfo> {
  final editlabel = "Edit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Information',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.fontSizeLg,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Manage your account settings and set e-mail preferences',
                style: TextStyle(
                  fontSize: Sizes.fontSizesm,
                ),
              ),
              const SizedBox(height: 20.0),
              EditableField(
                label: "Name",
                value: "ranjith",
                type: "name",
                onSavePressed: (String newValue) {},
              ),
              const SizedBox(
                height: 15,
              ),
              EditableField(
                label: "Email",
                value: "srk30052004@gmail.com",
                type: "email",
                onSavePressed: (String newValue) {},
              ),
              const SizedBox(
                height: 15,
              ),
              EditableField(
                label: "Phone number",
                value: "8438877682",
                type: "phone",
                onSavePressed: (String newValue) {
                  if (newValue.length == 10) {
                  } else {
                    showSnackbar(context,
                        message: "Phone number must be 10 digits",
                        title: "Invalid number",
                        contentType: ContentType.failure);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
