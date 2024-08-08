import 'package:flutter/material.dart';
import 'package:user_app/common/constants/colors.dart';
import 'package:user_app/common/constants/sizes.dart';
import 'package:user_app/common/widgets/button.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class LoginSecurity extends StatefulWidget {
  LoginSecurity({super.key});

  @override
  State<LoginSecurity> createState() => _LoginSecurityState();
}

class _LoginSecurityState extends State<LoginSecurity> {
  final TextEditingController _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pageIndexNotifier = ValueNotifier(0);

    SliverWoltModalSheetPage page1(
        BuildContext modalSheetContext, TextTheme textTheme) {
      return WoltModalSheetPage(
          hasSabGradient: false,
          topBarTitle: const Text(
            'Change password',
            style: TextStyle(
                fontSize: Sizes.fontSizeLg, fontWeight: FontWeight.w500),
          ),
          isTopBarLayerAlwaysVisible: true,
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(16),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(modalSheetContext).pop,
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                16,
                16,
                150,
              ),
              child: Column(children: [
                const Text(
                  "Enter the email address associated with your account. we will send you the password reset link to your email.",
                  style: TextStyle(fontSize: Sizes.fontSizeMd),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: "abc@gmail.com",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: ThemeColors.secondary, width: 2)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: ThemeColors.grey, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Button(
                  text: "Send link",
                  onPressed: () => Navigator.of(modalSheetContext).pop(),
                ),
              ])));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login & Security',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Efficiently manage your login and security setting for enhanced protection",
                style: TextStyle(
                  fontSize: Sizes.fontSizeMd,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: Sizes.fontSizeLg),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Password",
                style: TextStyle(
                    fontSize: Sizes.fontSizeMd, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Keep your account secure by updating your password regularly",
                      maxLines: 2,
                      style: TextStyle(fontSize: Sizes.fontSizeMd),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      WoltModalSheet.show<void>(
                        pageIndexNotifier: pageIndexNotifier,
                        context: context,
                        pageListBuilder: (modalSheetContext) {
                          final textTheme = Theme.of(context).textTheme;
                          return [
                            page1(modalSheetContext, textTheme),
                          ];
                        },
                        // modalTypeBuilder: (context) {
                        //   final size = MediaQuery.of(context).size.width;
                        //   if (size < 768) {
                        //     return WoltModalType.bottomSheet;
                        //   } else {
                        //     return WoltModalType.dialog;
                        //   }
                        // },
                        onModalDismissedWithBarrierTap: () {
                          debugPrint('Closed modal sheet with barrier tap');
                          Navigator.of(context).pop();
                          pageIndexNotifier.value = 0;
                        },
                      );
                    },
                    child: const SizedBox(
                      height: 30,
                      width: 100,
                      child: Center(
                        child: Text(
                          'Change',
                          style: TextStyle(
                              color: ThemeColors.primary,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
