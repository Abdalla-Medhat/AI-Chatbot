import "package:ai_chatbot_colab/controllers/signup_controller.dart";
import "package:flutter/material.dart";
import "package:get_x/get.dart";

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
                style: Get.textTheme.headlineLarge,
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
                    ).colorScheme.onSurfaceVariant.withAlpha(150),
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
                      // Using Material widget to controll the elevation throw the elevation property and focusNode
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        elevation: signUpController.isEmailFocused ? 5 : 0,
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
                    // the same reson as above(Material widget)
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      elevation: signUpController.isPassFocused ? 5 : 0,
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
                              hintStyle: TextStyle(
                                // fontSize: 20,
                                fontWeight: FontWeight.bold,
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
                                  controller.isPasswordVisible
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
                    // the same reson as above(Material widget)
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      elevation: signUpController.isConfirmPassFocused ? 5 : 0,
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
                                  color:
                                      controller.confirmPassFocusNode.hasFocus
                                      ? Get.theme.colorScheme.onSurfaceVariant
                                            .withAlpha(120)
                                      : Get.theme.colorScheme.onSurfaceVariant
                                            .withAlpha(95),
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
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant.withAlpha(150),
                                onPressed: () {
                                  controller.confirmPassIconVisibility();
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
                    if (signUpController.formKey.currentState!.validate()) {
                      Get.offAllNamed("/home");
                    } else {
                      Get.snackbar("Error", "Please fill all the fields");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: GetPlatform.isMobile ? 20 : 25,
                          fontWeight: FontWeight.w600,
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
                        Get.toNamed("/sign_up");
                      },
                      child: Text(
                        "Login",
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
