import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:exfai/controller/items/view_controller.dart';
import 'package:exfai/core/functions/uploadfile.dart';
import 'package:exfai/data/datasource/remote/items_data.dart';

import '../../all_export.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<SelectedListItem> dropdownlist = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  TextEditingController? catname;
  TextEditingController? catid;
  StatusRequest? statusRequest = StatusRequest.none;

  File? file;
  String? active;
  ItemsModel? itemsModel;
  changeStatusActive(val) {
    active = val;
    update();
  }

  chooseImage() async {
    file = await fileUploadGallery( );
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      //  if(file == null) Get.snackbar("Warning","Please Choose Image SVG");

      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel!.itemsId,
        "imageold": itemsModel!.itemsImage,
        "active": active,
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "price": price.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString()
      };

      var response = await itemsData.edit(data, file);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemsview);
          ItemsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }
  }

  @override
  void onInit() {
    itemsModel = Get.arguments['ItemsModel'];
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    catname = TextEditingController();
    catid = TextEditingController();
    dropdownname = TextEditingController();
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;

    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsNameAr!;

    price.text = itemsModel!.itemsPrice!;
    count.text = itemsModel!.itemsCount!;
    discount.text = itemsModel!.itemsDiscount!;
    catid!.text = itemsModel!.categoriesId!;
    catname!.text = itemsModel!.categoriesName!;
    active = itemsModel!.itemsActive;

    super.onInit();
  }
}
