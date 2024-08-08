import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/common/constants/colors.dart';
import 'package:user_app/common/constants/sizes.dart';
import 'package:user_app/common/widgets/avatar.dart';
import 'package:user_app/common/widgets/button.dart';
import 'package:user_app/features/profile/view/pages/login-security.dart';
import 'package:user_app/features/profile/view/pages/personal_info.dart';
import 'package:user_app/features/profile/view/pages/profile-edit-screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 6),
                          child: Avatar(
                              pathType: AvatarPathType.network,
                              path:
                                  'https://image.petmd.com/files/styles/978x550/public/2023-09/how-smart-are-cats.jpg')),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ranjithkumar",
                            style: const TextStyle(
                                fontSize: Sizes.fontSizeMd,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Show Profile",
                            style: TextStyle(fontSize: Sizes.fontSizesm),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileEditScreen()),
                      );
                    },
                    icon: Icon(Icons.keyboard_arrow_right_outlined),
                    variant: ButtonVariant.link,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Account settings',
                style: TextStyle(
                  fontSize: Sizes.fontSizeLg + 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              ListTile(
                leading: const Icon(Icons.person_outlined),
                title: const Text(
                  'Personal information',
                  style: TextStyle(fontSize: Sizes.fontSizeMd),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalInfo()),
                  ),
                },
              ),
              ListTile(
                leading: const Icon(Icons.security),
                title: const Text(
                  'Login and Security',
                  style: TextStyle(fontSize: Sizes.fontSizeMd),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginSecurity()),
                  ),
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Hosting',
                style: TextStyle(
                  fontSize: Sizes.fontSizeLg + 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              ListTile(
                leading: const Icon(Icons.house_rounded),
                title: const Text(
                  'View your list',
                  style: TextStyle(fontSize: Sizes.fontSizeMd),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                onTap: () => {},
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Legal',
                style: TextStyle(
                  fontSize: Sizes.fontSizeLg + 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              ListTile(
                leading: const Icon(Icons.shield_moon_outlined),
                title: const Text(
                  'Terms of service',
                  style: TextStyle(fontSize: Sizes.fontSizeMd),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                onTap: () => {},
              ),
              ListTile(
                leading: const Icon(Icons.shield_moon_outlined),
                title: const Text(
                  'Privacy policy',
                  style: TextStyle(fontSize: Sizes.fontSizeMd),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                onTap: () => {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  // Add your logout logic here
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      color: ThemeColors.primary,
                      decoration: TextDecoration.underline,
                      fontSize: Sizes.fontSizeMd),
                ),
                child: const Text(
                  'Logout',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
