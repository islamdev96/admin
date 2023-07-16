import 'package:exfai/view/screen/categories/add.dart';
import 'package:exfai/view/screen/categories/edit.dart';
import 'package:exfai/view/screen/categories/view.dart';
import 'package:exfai/view/screen/items/add.dart';
import 'package:exfai/view/screen/items/edit.dart';
import 'package:exfai/view/screen/items/view.dart';


import 'all_export.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  //GetPage(name: "/", page: () =>   TestView()),
  //GetPage(name: AppRoute.cart, page: () => const Cart()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
 
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
      //GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
      
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
   GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
   //Categories
     GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
       GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
 
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),
  //items

   GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
       GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
 
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),
  //orders
  //GetPage(name: AppRoute.ordershome, page: () => const OrdersScreen()),
  
  

 // GetPage(
];
