import 'package:exfai/controller/categories/add_controller.dart';
import 'package:exfai/core/shared/customtextformglobal.dart';
import 'package:exfai/all_export.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesAddController controller = Get.put(CategoriesAddController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: GetBuilder<CategoriesAddController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    hinttext: "Enter Category Name",
                    labeltext: "Category Name",
                    iconData: Icons.category,
                    mycontroller: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 30, "Category Name is required");
                    },
                    isNumber: false,
                  ),
                  CustomTextFormGlobal(
                    hinttext: "Enter Category Name (Arabic)",
                    labeltext: "Category Name (Arabic)",
                    iconData: Icons.category,
                    mycontroller: controller.namear,
                    valid: (val) {
                      return validInput(val!, 1, 30, "Category Name (Arabic) is required");
                    },
                    isNumber: false,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      onPressed: () {
                        controller.chooseImage();
                      },
                      child: const Text("Choose Category Image"),
                    ),
                  ),
                  if (controller.file != null)
                    Image.file(controller.file!),
                  CustomButton(
                    text: "Add",
                    onPressed: () {
                      controller.addData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
