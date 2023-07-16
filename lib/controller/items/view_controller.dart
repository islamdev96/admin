import 'package:exfai/data/datasource/remote/items_data.dart';

import '../../all_export.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear()
;    statusRequest = StatusRequest.loading;
update();

    var response = await itemsData.get();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
  List datalist=response['data'];
 data.addAll(datalist.map((e) =>ItemsModel.fromJson(e)));

      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  deleteItems(String id,String imagename){
    itemsData.delete({
      "id":id,
      "imagename":imagename
   } );
   data.removeWhere((element) =>element.itemsId==id);
   update();
  }
goToPageEdit(ItemsModel itemsModel){
  Get.toNamed(AppRoute.itemsedit,
  arguments: {"ItemsModel:itemsModel"});

}
  @override
  void onInit() {
    getData();
    super.onInit();
  }
  myback()
  {
    Get.offAllNamed(AppRoute.homepage);
  return Future.value(false);
  }
}
