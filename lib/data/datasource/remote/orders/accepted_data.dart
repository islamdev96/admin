import '../../../../all_export.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }
   donePrepare(String ordersid, String userid,String orderstype) async {
   var response = await crud.postData(AppLink.prepare, {"ordersid": ordersid,"userid":userid,"orderstype":orderstype});
    return response.fold((l) => l, (r) => r);
 }
  doneDelivery(String ordersid, String userid) async {
   var response = await crud.postData(AppLink.prepare, {"ordersid": ordersid,"userid":userid});
    return response.fold((l) => l, (r) => r);
 }


}
