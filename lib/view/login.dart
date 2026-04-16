import "package:ai_chatbot_colab/controllers/login_controller.dart";
import "package:flutter/material.dart";
import "package:get_x/get.dart";

class Login extends StatelessWidget {
  Login({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool portrait = Get.context!.orientation == Orientation.portrait;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: loginController.formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: Center(
                  child: Transform.rotate(
                    angle: 0.25,

                    child: Container(
                      alignment: Alignment.center,
                      height: GetPlatform.isDesktop
                          ? (portrait ? 70 : 0.55)
                          : (portrait ? 80 : 65),
                      width: GetPlatform.isDesktop
                          ? (portrait ? 70 : 0.55)
                          : (portrait ? 80 : 65),
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: Transform.rotate(
                        angle: -0.25,
                        child: Image.asset(
                          "assets/images/white_chat_icon.png",
                          fit: BoxFit.contain,
                          height: GetPlatform.isDesktop
                              ? (portrait ? 50 : 40)
                              : portrait
                              ? 40
                              : 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Welcome back",
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 17),
                child: Text(
                  "Continue Yout conversation",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withAlpha(200),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: GetPlatform.isMobile
                            ? (portrait ? width * 0.12 : width * 0.18)
                            : portrait
                            ? width * 0.12
                            : width * 0.38,
                      ),
                      child: Text(
                        "EMAIL ADDRESS",
                        style: Get.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurfaceVariant.withAlpha(200),
                        ),
                      ),
                    ),
                    Container(
                      height: GetPlatform.isMobile ? 90 : 110,
                      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                      margin: EdgeInsets.symmetric(
                        horizontal: GetPlatform.isMobile
                            ? (portrait ? width * 0.07 : width * 0.15)
                            : portrait
                            ? width * 0.1
                            : width * 0.3,
                      ),
                      // Using Material widget to controll the elevation throw the elevation property and focusNode
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        elevation: loginController.isEmailFocused ? 5 : 0,
                        child: GetBuilder<LoginController>(
                          builder: (controller) {
                            return TextFormField(
                              focusNode: controller.emailFocusNode,
                              controller: controller.emailController,
                              validator: (value) {},
                              keyboardType: TextInputType.emailAddress,
                              expands: true,
                              maxLines: null,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "alex@example.com",
                                hintStyle: TextStyle(
                                  color: Get.theme.colorScheme.onSurfaceVariant
                                      .withAlpha(80),
                                ),
                                prefixIcon: Icon(Icons.email_rounded),
                                prefixIconColor:
                                    controller.emailFocusNode.hasFocus
                                    ? Get.theme.colorScheme.onSurfaceVariant
                                          .withAlpha(120)
                                    : Get.theme.colorScheme.onSurfaceVariant
                                          .withAlpha(80),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: GetPlatform.isMobile
                          ? (portrait ? width * 0.12 : width * 0.18)
                          : portrait
                          ? width * 0.12
                          : width * 0.38,
                    ),
                    child: Text(
                      "PASSWORD",
                      style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurfaceVariant.withAlpha(200),
                      ),
                    ),
                  ),
                  Container(
                    height: GetPlatform.isMobile ? 90 : 110,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    margin: EdgeInsets.symmetric(
                      horizontal: GetPlatform.isMobile
                          ? (portrait ? width * 0.07 : width * 0.15)
                          : portrait
                          ? width * 0.1
                          : width * 0.3,
                    ),
                    // the same reson as above(Material widget)
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      elevation: loginController.isPassFocused ? 5 : 0,
                      child: GetBuilder<LoginController>(
                        builder: (controller) {
                          return TextFormField(
                            focusNode: controller.passwordFocusNode,
                            controller: loginController.passwordController,
                            validator: (value) {},
                            keyboardType: TextInputType.visiblePassword,

                            maxLines: 1,
                            obscureText: loginController.isPasswordVisible,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "••••••••",
                              hintStyle: TextStyle(
                                fontSize: 25,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant.withAlpha(80),
                              ),
                              prefixIcon: Icon(Icons.lock_rounded),
                              prefixIconColor:
                                  controller.passwordFocusNode.hasFocus
                                  ? Get.theme.colorScheme.onSurfaceVariant
                                        .withAlpha(120)
                                  : Get.theme.colorScheme.onSurfaceVariant
                                        .withAlpha(80),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  loginController.isPasswordVisible
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                ),
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant.withAlpha(150),
                                onPressed: () {
                                  controller.passIconVisibility();
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide.none,
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide.none,
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: GetPlatform.isMobile
                      ? (portrait ? 20 : 100)
                      : portrait
                      ? 50
                      : 200,
                  vertical: 30,
                ),
                height: GetPlatform.isMobile ? 65 : 75,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed("/home");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: GetPlatform.isMobile ? 20 : 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: GetPlatform.isMobile ? 25 : 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New to ChatBot?   ",
                      style: TextStyle(
                        color: Get.theme.colorScheme.onSurfaceVariant,
                        fontSize: GetPlatform.isMobile ? 17 : 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/sign_up");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: GetPlatform.isMobile ? 17 : 25,
                          color: Get.theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.storage,
                        color: Get.theme.colorScheme.onSurfaceVariant.withAlpha(
                          80,
                        ),
                      ),
                    ),

                    Text(
                      "Your data is stored locally on this device.",
                      style: Get.textTheme.titleSmall!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
