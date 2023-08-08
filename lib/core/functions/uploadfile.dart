import 'dart:io';
import 'package:exfai/all_export.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> imageUploadCamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

Future<File?> fileUploadGallery() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image, // Allow only image files, regardless of the extension.
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

void showbottonmenu(Function() imageUploadCamera, Function() fileUploadGallery) {
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: const Text(
                "اختيار صورة",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                File? file = await imageUploadCamera();
                if (file != null) {
                  Get.back();
                  // Do something with the selected camera image.
                }
              },
              leading: const Icon(
                Icons.camera_alt,
                size: 40,
              ),
              title: const Text(
                "صورة من الكاميرا",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () async {
                File? file = await fileUploadGallery();
                if (file != null) {
                  Get.back();
                  // Do something with the selected gallery image.
                }
              },
              leading: const Icon(
                Icons.image,
                size: 40,
              ),
              title: const Text(
                "صورة من الاستوديو",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Colors.white,
  );
}
