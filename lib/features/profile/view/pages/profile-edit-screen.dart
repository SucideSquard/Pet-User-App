import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:user_app/common/widgets/avatar.dart';

class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  late File image;
  Future<File?> pickImage() async {
    File? image;
    try {
      var file = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (file != null && file.files.isNotEmpty) {
        image = File(file.files[0].path!);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return image;
  }

  void selectImage() async {
    try {
      var res = await pickImage();
      if (res != null) {
        setState(() {
          image = res;
          // LoggerHelper.info(images.length.toString());
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Avatar(
                      path:
                          'https://image.petmd.com/files/styles/978x550/public/2023-09/how-smart-are-cats.jpg',
                      pathType: AvatarPathType.network,
                      size: AvatarSizes.lg,
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: selectImage,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Hi I'm Ranjith",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Joined in 20th",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      "Identity verification",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.safety_check_sharp,
                      size: 30,
                      color: Color.fromARGB(255, 5, 133, 10),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Show others you're really you with the identity verification badge",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 160.0, // Adjust width as needed
                  height: 50.0, // Adjust height as needed
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        side: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                    ),
                    child: const Text(
                      "Get the badge",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Exile confirmed",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.check_sharp,
                      color: Color.fromARGB(255, 2, 61, 4),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Phone number",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
