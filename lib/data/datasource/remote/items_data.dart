

import 'dart:io';

import '../../../../all_export.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  get() async {
    var response = await crud.postData(AppLink.itemsview, {});
    return response.fold((l) => l, (r) => r);
  }
   add(Map data,File file) async {
    var response = await crud.addRequestWithImageOne(AppLink.itemsadd, data,file);
    return response.fold((l) => l, (r) => r);
  }
   delete(Map data) async {
    var response = await crud.postData(AppLink.itemsdelete, data);
    return response.fold((l) => l, (r) => r);
  }
   edit(Map data,[File? file]) async {
    var response;
    if (file==null){
     response = await crud.postData(AppLink.itemsedit, data);
    }else{
       response = await crud.addRequestWithImageOne(AppLink.categoriesedit, data,file);
    }
    return response.fold((l) => l, (r) => r);
  }
}
