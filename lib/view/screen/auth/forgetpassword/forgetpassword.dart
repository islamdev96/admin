import '../../../../../all_export.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('forgetPassword'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    SizedBox(height: 20.h),
                    CustomTextTitleAuth(text: "checkEmail".tr),
                    SizedBox(height: 10.h),
                    CustomTextBodyAuth(
                        // please Enter Your Email Address To Recive A verification code
                        text: "ReciveAVerificationCode".tr),
                    SizedBox(height: 15.h),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return null;
                      },
                      mycontroller: controller.email,
                      hinttext: "enterYourEmail".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "email".tr,
                      // mycontroller: ,
                    ),
                    CustomButtonAuth(
                        text: "check".tr,
                        onPressed: () {
                          controller.checkemail();
                        }),
                    SizedBox(height: 40.h),
                  ]),
                ),
              ))),
    );
  }
}
