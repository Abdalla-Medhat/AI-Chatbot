import "package:ai_chatbot_colab/controllers/authentication_controller/login_controller.dart";
import "package:ai_chatbot_colab/theme/styles.dart";
import "package:flutter/material.dart";
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
                  child: TweenAnimationBuilder(
                    tween: Tween(begin: 0.0, end: 2 * 3.14),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) => Transform.rotate(
                      angle: value,
                      child: Image.asset(
                        "assets/images/app_icon2.png",
                        fit: BoxFit.contain,
                        height: 75,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Welcome back",
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 17),
                child: Text(
                  "Continue Yout conversation",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withAlpha(220),
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
                        style: Get.textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurfaceVariant.withAlpha(200),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                      margin: EdgeInsets.symmetric(
                        horizontal: GetPlatform.isMobile
                            ? (portrait ? width * 0.07 : width * 0.15)
                            : portrait
                            ? width * 0.1
                            : width * 0.3,
                      ),

                      // Using Material widget to controll the elevation throw the elevation property and focusNode
                      child: GetBuilder<LoginController>(
                        builder: (controller) {
                          return TextFormField(
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: Color(0xff191c1d).withAlpha(220),
                            ),
                            focusNode: controller.emailFocusNode,
                            controller: controller.emailController,
                            validator: (value) {
                              if (value == null) {
                                return "Please enter your email";
                              } else {
                                return controller.isEmailValid(value);
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "alex@example.com",

                              prefixIcon: Icon(Icons.email_rounded),
                            ),
                          );
                        },
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
                      style: Get.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurfaceVariant.withAlpha(200),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    margin: EdgeInsets.symmetric(
                      horizontal: GetPlatform.isMobile
                          ? (portrait ? width * 0.07 : width * 0.15)
                          : portrait
                          ? width * 0.1
                          : width * 0.3,
                    ),

                    // the same reson as above(Material widget)
                    child: GetBuilder<LoginController>(
                      builder: (controller) {
                        return TextFormField(
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: Color(0xff191c1d).withAlpha(220),
                          ),
                          focusNode: controller.passwordFocusNode,
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the password';
                            } else if (value.length < 8) {
                              return "Password must be at least 8 characters long";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,

                          maxLines: 1,
                          obscureText: loginController.isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: "••••••••",
                            // hintStyle: TextStyle(fontSize: 25),
                            prefixIcon: Icon(Icons.lock_rounded),

                            suffixIcon: IconButton(
                              icon: Icon(
                                loginController.isPasswordVisible
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                              ),

                              onPressed: () {
                                controller.passIconVisibility();
                              },
                            ),
                          ),
                        );
                      },
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
                  onPressed: () async {
                    if (loginController.formKey.currentState!.validate()) {
                      //check if the email and password are correct
                      String? checkData = await loginController
                          .checkAuthentication(
                            loginController.emailController.text.trim(),
                            loginController.passwordController.text.trim(),
                          );
                      if (checkData == "Operation Successfully Completed") {
                        print("Login Successfully ===================>>>");
                        Get.offAllNamed("/home");
                      } else if (checkData == "The account does not exist") {
                        Get.snackbar(
                          "Error",
                          "Both email and password are incorrect",
                        );
                      } else {
                        Get.snackbar("Error", "Incorrect password");
                      }
                    } else {
                      Get.snackbar("Error", "Please fill all the fields");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: AppTextStyles.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w900,
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
                      style: Get.textTheme.bodyLarge!.copyWith(
                        color: Get.theme.colorScheme.onSurfaceVariant.withAlpha(
                          240,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed("/sign_up");
                      },
                      child: Text(
                        "Sign Up",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          color: Get.theme.colorScheme.primary,
                          fontWeight: FontWeight.w800,
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
                      softWrap: true,
                      style: Get.textTheme.titleSmall?.copyWith(
                        color: Get.theme.colorScheme.onSurfaceVariant.withAlpha(
                          200,
                        ),
                      ),
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
