// ignore_for_file: avoid_renaming_method_parameters

import 'package:exfai/view/screen/orders/accepted.dart';

import '../../all_export.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int currentpage);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView()
  ];
 

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.home},

    {"title": "Accepted", "icon": Icons.add_shopping_cart_outlined},
    {"title": "Archive", "icon": Icons.archive_outlined},
 
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
