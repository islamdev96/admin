import 'dart:io';
import 'package:exfai/all_export.dart';
import 'package:exfai/controller/categories/view_controller.dart';
import 'package:exfai/core/functions/uploadfile.dart';
import 'package:exfai/data/datasource/remote/categories_data.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;
  StatusRequest? statusRequest = StatusRequest.none;

  File? file;
  chooseImage() async { 
    file = await fileUploadGallery();
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Choose an Image");

      statusRequest = StatusRequest.loading;
      update();
      Map data = {"name": name.text, "namear": namear.text};

      var response = await categoriesData.add(data, file!);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.categoriesview);
          CategoriesController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
          print(response / 'status');
        }
                  print(response/ 'status');

      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();

    super.onInit();
  }
}
