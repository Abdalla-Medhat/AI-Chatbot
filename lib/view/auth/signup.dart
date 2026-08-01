import "package:ai_chatbot_colab/controllers/authentication_controller/signup_controller.dart";
import "package:ai_chatbot_colab/theme/styles.dart";
import "package:flutter/material.dart";
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool portrait = Get.context!.orientation == Orientation.portrait;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: signUpController.formKey,
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
                "Join ChatBot",
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 17),
                child: Text(
                  """Experience seamless AI conversations
with privacy at the core.""",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withAlpha(220),
                  ),
                ),
              ),
              // Email Section ====================>
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
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
                      // Email TextField ====================>
                      child: GetBuilder<SignUpController>(
                        builder: (controller) {
                          return TextFormField(
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
                            maxLines: 1,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),

                              filled: true,
                              hintText: "name@example.com",

                              prefixIcon: Icon(Icons.email_rounded),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Password section =====================>
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

                    // Password TextField ==================>
                    child: GetBuilder<SignUpController>(
                      builder: (controller) {
                        return TextFormField(
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
                          obscureText: controller.isPasswordVisible,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            filled: true,
                            hintText: "••••••••",

                            prefixIcon: Icon(Icons.lock_rounded),

                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible
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
              // Confirmation Section =====================>
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
                      "Confirm Password",
                      style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
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

                    child: GetBuilder<SignUpController>(
                      builder: (controller) {
                        // Confirmation Password TextFormField
                        return TextFormField(
                          focusNode: controller.confirmPassFocusNode,
                          controller: controller.confirmPassController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Password Confirmation';
                            } else if (value !=
                                controller.passwordController.text) {
                              return "Password confirmation doesn't match";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: 1,
                          obscureText: controller.isConfirmPassVisible,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            filled: true,
                            hintText: "••••••••",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant.withAlpha(80),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/images/shield_with_lock.png",

                                height: 10,
                                width: 10,
                                fit: BoxFit.contain,
                              ),
                            ),

                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isConfirmPassVisible
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                              ),

                              onPressed: () {
                                controller.confirmPassIconVisibility();
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
                    if (signUpController.formKey.currentState!.validate()) {
                      //check if the email is already exists
                      String? checkEmail = await signUpController.checkEmail(
                        signUpController.emailController.text.trim(),
                      );
                      if (checkEmail != null) {
                        Get.snackbar("Error", checkEmail);
                        return;
                      }
                      int response = await signUpController.addingUser(
                        signUpController.emailController.text.trim(),
                        signUpController.passwordController.text.trim(),
                      );
                      if (response == 0) {
                        Get.snackbar("Error", "Failed to create an account");
                        return;
                      } else if (response > 0) {
                        print(
                          "User Added Successfully =======================>>",
                        );
                        Get.offAllNamed("/home");
                      }
                    } else {
                      Get.snackbar("Error", "Please fill all the fields");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: AppTextStyles.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?  ",
                      style: TextStyle(
                        color: Get.theme.colorScheme.onSurfaceVariant.withAlpha(
                          175,
                        ),
                        fontSize: GetPlatform.isMobile ? 17 : 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/");
                      },
                      child: Text(
                        "Login",
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
