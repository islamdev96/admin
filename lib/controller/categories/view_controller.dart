import 'package:exfai/data/datasource/remote/categories_data.dart';

import '../../all_export.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear()
;    statusRequest = StatusRequest.loading;
update();

    var response = await categoriesData.get();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
  List datalist=response['data'];
 data.addAll(datalist.map((e) =>CategoriesModel.fromJson(e)));

      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  deleteCategory(String id,String imagename){
    categoriesData.delete({
      "id":id,
      "imagename":imagename
   } );
   data.removeWhere((element) =>element.categoriesId==id);
   update();
  }
goToPageEdit(CategoriesModel categoriesModel){
  Get.toNamed(AppRoute.categoriesedit,
  arguments: {"CategoriesModel:categoriesModel"});

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
