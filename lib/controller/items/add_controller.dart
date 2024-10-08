import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:exfai/controller/items/view_controller.dart';
import 'package:exfai/core/functions/uploadfile.dart';
import 'package:exfai/data/datasource/remote/categories_data.dart';
import 'package:exfai/data/datasource/remote/items_data.dart';

import '../../all_export.dart';
import 'package:drop_down_list/model/selected_list_item.dart';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<SelectedListItem> dropdownlist=[];
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
StatusRequest? statusRequest=StatusRequest.none;




File?  file;
showOptionImage(){
  showbottonmenu(chooseImageCamera,chooseImageGallery);

}
chooseImageCamera()async{
 
   file= await imageUploadCamera();
   update();
}
chooseImageGallery()async{
 
   file= await fileUploadGallery( );
   update();
}
  addData() async {
     if (formState.currentState!.validate()){
       if(file == null) Get.snackbar("Warning","Please Choose Image ");

    statusRequest = StatusRequest.loading;
    update();
    Map data ={
      "name":name.text
,
"namear": 
 namear.text ,"desc":
 desc.text, "descar":
 descar.text
 ,"price":price.text,
 "count":
 count.text,"discount":
 discount.text,"catid":
 catid!.text,"datenow":
 DateTime.now().toString()};

    var response = await itemsData.add(data,file!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
 Get.offNamed(AppRoute.itemsview);
  ItemsController c= Get.find();
  c.getData()
;      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
    
  }
   
  }
  getCategories() async {
    CategoriesData categoriesData=CategoriesData(Get.find())
 
;    statusRequest = StatusRequest.loading;
update();

    var response = await categoriesData.get();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List<CategoriesModel>data=[];
  List datalist=response['data'];
 data.addAll(datalist.map((e) =>CategoriesModel.fromJson(e)));
 for(int i =0;i<data.length;i++){
  dropdownlist.add(SelectedListItem(name: data[i].categoriesName!,value: data[i].categoriesId));
 }

      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    name=TextEditingController();
    namear=TextEditingController();
     desc=TextEditingController();
    descar=TextEditingController();
     price=TextEditingController();
    count=TextEditingController();
    discount=TextEditingController();
      catname=TextEditingController();
    catid=TextEditingController();
    dropdownname=TextEditingController();
    dropdownid=TextEditingController();
   
    super.onInit();
  }
  showDropdown(context){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
         "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data:  [SelectedListItem(name:"a"),SelectedListItem(name:"b")],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem =selectedList[0];
          dropdownname.text=selectedListItem.name;
         
          },
         // showSnackBar(list.toString());
       
       
      ),
    ).showModal(context);
  }
}
