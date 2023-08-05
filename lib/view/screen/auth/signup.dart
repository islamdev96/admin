import '../../../../../all_export.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('signUp'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formKey,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "welcomeBack".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "signUpEmailAndPassword".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validateInput(val!, 1, 50, "username");
                        },
                        mycontroller: controller.usernameController,
                        hinttext: "enterYourUsername".tr,
                        iconData: Icons.person_outline,
                        labeltext: "username".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validateInput(val!, 1, 50, "email");
                        },
                        mycontroller: controller.emailController,
                        hinttext: "enterYourEmail".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "email".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validateInput(val!, 3, 15, "phone");
                        },
                        mycontroller: controller.phoneController,
                        hinttext: "enterYourPhone".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "phone".tr,
                        // mycontroller: ,
                      ),
                      GetBuilder<SignUpControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          obscureText: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validateInput(val!, 1, 50, "password");
                          },
                          mycontroller: controller.passwordController,
                          hinttext: "enterYourPassword".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "password".tr,
                        ),
                      ),
                      CustomButtonAuth(
                          text: "signUp".tr,
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: "haveAnAccount".tr,
                        texttwo: "signIn".tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ]),
                  ),
                )),
          )),
    );
  }
}
