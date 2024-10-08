import '../../../../../all_export.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'login'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey),
            ),
            SizedBox(width: 75.w),
            InkWell(
              onTap: () {
                Get.toNamed('/homepage');
              },
              child: Text(
                'skip'.tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formKey,
                    child: ListView(children: [
                      const LogoAuth(),
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "welcomeBack".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "signInYourEmailAndPassword".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validateInput(val!, 1, 50, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "enterYourEmail".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "email".tr,
                        // mycontroller: ,
                      ),
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          obscureText: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validateInput(val!, 1, 50, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "enterYourPassword".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "password".tr,
                          // mycontroller: ,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "forgetPassword".tr,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      CustomButtonAuth(
                          text: "signIn".tr,
                          onPressed: () {
                            controller.login();
                          }),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: "dontHaveAnAccount".tr,
                        texttwo: "signUp".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      )
                    ]),
                  ),
                )),
          )),
    );
  }
}
