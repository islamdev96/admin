import 'package:exfai/all_export.dart';
import 'package:exfai/controller/categories/view_controller.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());

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
                    final category = controller.data[index];

                    return Card(
                      child: ListTile(
                        onTap: () {
                          controller.goToPageEdit(category);
                        },
                        leading: Container(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.network(
                            "${AppLink.imagestCategories}/${category.categoriesImage}",
                            height: 80,
                          ),
                        ),
                        title: Text(category.categoriesName!),
                        subtitle: Text(category.categoriesDatetime!),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            _showDeleteConfirmationDialog(
                              controller,
                              int.parse(category.categoriesId!),
                              category.categoriesImage!,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(
    CategoriesController controller,
    int categoryId,
    String categoryImage,
  ) {
    Get.defaultDialog(
      title: "تحذير",
      middleText: "هل أنت متأكد من عملية الحذف",
      onCancel: () {},
      onConfirm: () {
        controller.deleteCategory(categoryId.toString(), categoryImage);
        Get.back();
      },
    );
  }
}
