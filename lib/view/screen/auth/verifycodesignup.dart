import '../../../../all_export.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pleaseEnterTheDigitCodeSentTo = 'pleaseEnterTheDigitCodeSentTo'.tr;

    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("verificationCode".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(children: [
                  SizedBox(height: 20.h),
                  CustomTextTitleAuth(text: "checkCode".tr),
                  SizedBox(height: 10.h),
                  CustomTextBodyAuth(
                      text:
                          "$pleaseEnterTheDigitCodeSentTo    ${controller.email}"),
                  SizedBox(height: 15.h),
                  OtpTextField(
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 5,
                    borderColor: AppColor.primaryColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      controller.reSend();
                    },
                    child: Center(
                        child: Text(
                      "resendVerfiyCode".tr,
                      style: const TextStyle(
                          color: AppColor.primaryColor, fontSize: 20),
                    )),
                  )
                ]),
              ))),
    );
  }
}
