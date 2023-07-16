import 'package:exfai/all_export.dart';
import 'package:exfai/controller/categories/view_controller.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.categoriesadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CategoriesController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: () {
                  return controller.myback();
                },
                child: Center(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.goToPageEdit(controller.data[index]);
                              },
                              child: Card(
                                  child: Row(children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      child: SvgPicture.network(
                                        height: 80,
                                        "${AppLink.imagestCategories}/${controller.data[index].categoriesImage}",
                                      ),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: ListTile(
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              icon: const Icon(
                                                  Icons.delete_outline),
                                              onPressed: () {
                                                Get.defaultDialog(
                                                    title: "تحذير",
                                                    middleText:
                                                        "هل أنت متأكد من عملية الحذف",
                                                    onCancel: () {},
                                                    onConfirm: () {
                                                      controller.deleteCategory(
                                                          controller.data[index]
                                                              .categoriesId!,
                                                          controller.data[index]
                                                              .categoriesImage!);
                                                      Get.back();
                                                    });
                                              }),
                                        ],
                                      ),
                                      subtitle: Text(controller
                                          .data[index].categoriesDatetime!),
                                      title: Text(controller
                                          .data[index].categoriesName!),
                                    ))
                              ])),
                            );
                          },
                        ))),
              ))),
    );
  }
}
