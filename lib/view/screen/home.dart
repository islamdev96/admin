

import 'package:exfai/view/widget/home/cardadmin.dart';
import 'package:path/path.dart';

import '../../all_export.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body:ListView(children: [
        GridView(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 150) ,
          physics:NeverScrollableScrollPhysics() ,
          shrinkWrap: true,
         children: [
             CardAdminHome(url:AppImageAsset.avatar,title:"Categories",onClick:(){
Get.toNamed(AppRoute.categoriesview);
             }),
          CardAdminHome(url:AppImageAsset.avatar,title:"Items",onClick:(){
            Get.toNamed(AppRoute.itemsview);
          }),
          CardAdminHome(url:AppImageAsset.avatar,title:"Users",onClick:(){}),
          CardAdminHome(url:AppImageAsset.avatar,title:"Orders",onClick:(){
            Get.toNamed(AppRoute.ordershome);
          }),
             CardAdminHome(url:AppImageAsset.avatar,title:"Report",onClick:(){}),
                CardAdminHome(url:AppImageAsset.avatar,title:"Notification",onClick:(){})
          
          
        ],)
      ],) ,
    );}}



