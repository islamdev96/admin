// ignore_for_file: unused_local_variable

import 'package:exfai/all_export.dart';
import 'package:exfai/controller/items/edit_controller.dart';
import 'package:exfai/core/shared/customdropdownsearch.dart';
import 'package:exfai/core/shared/customtextformglobal.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsEditController controller = Get.put(ItemsEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Item'),
      ),
      body: GetBuilder<ItemsEditController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                              hinttext: "item name",
                              labeltext: "item name",
                              iconData: Icons.category,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: " item name ( Arabic)",
                              labeltext: "item name (Arabic)",
                              iconData: Icons.category,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: " description name",
                              labeltext: "description name",
                              iconData: Icons.category,
                              mycontroller: controller.desc,
                              valid: (val) {
                                return validInput(val!, 1, 200, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: " description name ( Arabic)",
                              labeltext: "description name (Arabic)",
                              iconData: Icons.category,
                              mycontroller: controller.descar,
                              valid: (val) {
                                return validInput(val!, 1, 200, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "count",
                              labeltext: "count",
                              iconData: Icons.category,
                              mycontroller: controller.count,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hinttext: " price",
                              labeltext: " price",
                              iconData: Icons.category,
                              mycontroller: controller.price,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hinttext: " discount",
                              labeltext: " discount",
                              iconData: Icons.category,
                              mycontroller: controller.discount,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomDropdownSearch(
                              title: "Choose Category",
                              listdata: controller.dropdownlist,
                              dropdownSelectedName: controller.catname!,
                              dropdownSelectedID: controller.catid!),
                          const SizedBox(
                            height: 10,
                          ),
                          RadioListTile(
                              title: const Text("hide"),
                              value: "0",
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.changeStatusActive(val);
                              }),
                          RadioListTile(
                              title: const Text("active"),
                              value: "1",
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.changeStatusActive(val);
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: MaterialButton(
                                color: AppColor.thirdColor,
                                textColor: AppColor.secondColor,
                                onPressed: () {
                                  // controller.showOptionImage();
                                },
                                child: const Text("choose item image "),
                              )),
                          if (controller.file != null)
                            Image.file(
                              controller.file!,
                              width: 100,
                              height: 100,
                            ),
                          CustomButton(
                            text: " اضافة",
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
