// ignore_for_file: unused_local_variable

import 'package:exfai/all_export.dart';
import 'package:exfai/controller/categories/edit_controller.dart';
import 'package:exfai/core/shared/customtextformglobal.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesEditController controller = Get.put(CategoriesEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Category'),
      ),
      body: GetBuilder<CategoriesEditController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: controller.formState,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: MaterialButton(
                                color: AppColor.thirdColor,
                                textColor: AppColor.secondColor,
                                onPressed: () {
                                  controller.chooseImage();
                                },
                                child: const Text("choose category image "),
                              )),
                          if (controller.file != null)
                            SvgPicture.file(controller.file!),
                          CustomButton(
                            text: " SAVE",
                            onPressed: () {
                              controller.editData();
                            },
                          )
                        ],
                      ),
                    )),
              )),
    );
  }
}
