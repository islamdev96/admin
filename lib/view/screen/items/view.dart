import 'package:exfai/all_export.dart';
import 'package:exfai/controller/items/view_controller.dart';
import 'package:exfai/controller/items/view_controller.dart';
import 'package:flutter/material.dart';

class  ItemsView  extends StatelessWidget {
  const ItemsView ({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Items'),

      ),
      floatingActionButton:FloatingActionButton(onPressed:(){
        Get.toNamed(AppRoute.itemsadd);
      } ,child: Icon(Icons.add),),
      body: GetBuilder<ItemsController>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget 
      :WillPopScope( onWillPop: (){
      return controller. myback();
      },
     child: Center(
        child: Container(padding:EdgeInsets.symmetric(horizontal:10),
        child:ListView.builder(
          itemCount: controller.data.length,
          itemBuilder:(context,index){ 
          return InkWell(
            onTap: (){
              controller.goToPageEdit(controller.data[index]);
            },
            child: Card(child: Row(children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: CachedNetworkImage(
                    height:80,
                 imageUrl  : "${AppLink.imagestItems}/${controller.data[index].itemsImage}",),
                )),
              Expanded(
                flex: 3,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: Icon(Icons.delete_outline),onPressed:(){
                        Get.defaultDialog(title: "تحذير",middleText: "هل أنت متأكد من عملية الحذف",onCancel: (){},onConfirm: (){
          
                        
                       controller.deleteItems(controller.data[index].itemsId!, controller.data[index].itemsImage!);
                       Get.back();
                
                } ); }),
                    //  IconButton(icon: Icon(Icons.edit),onPressed:(){
                       
          
                        
                      // controller.goToPageEdit(controller.data[index]);
                      
                
                //}
               // ),
          
                    ],
                  ),
                  subtitle: Text(
                    controller.data[index].categoriesName!
                  ),
                  title:Text(controller.data[index].itemsName!),))
            ])),
          );},)
     )),
      ))),
    );
  }
}