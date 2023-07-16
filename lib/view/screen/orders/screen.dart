//import 'package:exfai/controller/homescreen_controller.dart';
import 'package:exfai/controller/orders/screen_controller.dart';
import 'package:exfai/view/widget/orders/custombottomappbarhome.dart';

import '../../../all_export.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text("Orders"),
              ),
              //drawer: Drawer(),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: controller.listPage.elementAt(controller.currentpage),
            ));
  }
}
