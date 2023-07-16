import 'package:exfai/all_export.dart';
import 'package:exfai/controller/categories/add_controller.dart';
import 'package:exfai/core/functions/uploadfile.dart';
import 'package:exfai/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesAddController controller = Get.put(CategoriesAddController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: GetBuilder<CategoriesAddController>(builder:(controller)=> HandlingDataView(statusRequest: controller.statusRequest!, widget: 
        
           Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key:controller.formState,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                      hinttext: " اخل اسم القسم",
                      labeltext: "category name",
                      iconData: Icons.category,
                      mycontroller: controller.name,
                      valid: (val) {
                        return validInput(val!, 1, 30, "");
                      },
                      isNumber: false),
                  CustomTextFormGlobal(
                      hinttext: " category name ( Arabic)",
                      labeltext: "category name (Arabic)",
                      iconData: Icons.category,
                      mycontroller: controller.namear,
                      valid: (val) {
                        return validInput(val!, 1, 30, "");
                      },
                      isNumber: false),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MaterialButton(
                        color: AppColor.thirdColor,
                        textColor: AppColor.secondColor,
                        onPressed: () {
                        controller.chooseImage();
                        },
                        child: Text("choose category image "),
                      )),
                      if(controller.file != null)
                      SvgPicture.file(controller.file!),
                  CustomButton(
                    text: " اضافة",
                    onPressed: () {
                      controller.addData();
                    },
                  )
                ],
              ),
            ) ),
          )
        
      ),
    );
  }
}
