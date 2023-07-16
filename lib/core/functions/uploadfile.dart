// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';
import 'package:exfai/all_export.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "jpeg", "gif"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showbottonmenu(Function() imageUploadCamera, Function() fileUploadGallery) {
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
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                  onTap: () {
                    imageUploadCamera();
                  },
                  leading: const Icon(
                    Icons.camera_alt,
                    size: 40,
                  ),
                  title: const Text(
                    "صورة من الكاميرا",
                    style: TextStyle(fontSize: 20),
                  )),
              ListTile(
                onTap: () {
                  fileUploadGallery();
                  Get.back();
                },
                leading: const Icon(
                  Icons.image,
                  size: 40,
                ),
                title: const Text(
                  "صورة من الاستوديو",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white);
}
