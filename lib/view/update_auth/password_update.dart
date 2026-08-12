import 'package:ai_chatbot_colab/controllers/authentication_controller/password_update_controller.dart';
import 'package:ai_chatbot_colab/utilities/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordUpdate extends StatelessWidget {
  PasswordUpdate({super.key});
  final PasswordUpdateController passwordUpdateController = Get.find();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: theme.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.primary.withAlpha(220),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: passwordUpdateController.formKey,
          child: ListView(
            padding: EdgeInsets.all(Sizes.containerMargin),
            children: [
              SizedBox(height: Sizes.sectionPadding),
              Padding(
                padding: EdgeInsetsGeometry.only(
                  top: Sizes.sectionPadding,
                  bottom: Sizes.md,
                ),
                child: Text(
                  "Update your password",
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface.withAlpha(220),
                  ),
                ),
              ),

              Text(
                "Choose a strong password that you haven't used before.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.outline.withAlpha(220),
                ),
              ),

              SizedBox(height: Sizes.sectionPadding * 2),

              // Current password section
              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: Sizes.md,
                  left: Sizes.md,
                ),
                child: Text(
                  "Current Password",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withAlpha(200),
                  ),
                ),
              ),

              GetBuilder<PasswordUpdateController>(
                builder: (controller) {
                  return TextFormField(
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: Color(0xff191c1d).withAlpha(220),
                    ),

                    focusNode: controller.currentPassFocusNode,
                    controller: controller.currentPassController,
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
                      errorText: controller.currentPassError,
                      prefixIcon: Icon(Icons.lock_outline_rounded),

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
              SizedBox(height: Sizes.sectionPadding),

              // New password section
              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: Sizes.md,
                  left: Sizes.md,
                ),
                child: Text(
                  "New Password",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withAlpha(200),
                  ),
                ),
              ),

              GetBuilder<PasswordUpdateController>(
                builder: (controller) {
                  return TextFormField(
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: Color(0xff191c1d).withAlpha(220),
                    ),
                    focusNode: controller.newPasswordFocusNode,
                    controller: controller.newPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the password';
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      } else if (value ==
                          controller.currentPassController.text) {
                        return "Password can't be same as current password";
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
                      prefixIcon: Icon(Icons.lock_outline_rounded),

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
              SizedBox(height: Sizes.sectionPadding),
              // Confirm New password section
              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: Sizes.md,
                  left: Sizes.md,
                ),
                child: Text(
                  "Confirm New Password",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withAlpha(200),
                  ),
                ),
              ),

              GetBuilder<PasswordUpdateController>(
                builder: (controller) {
                  return TextFormField(
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: Color(0xff191c1d).withAlpha(220),
                    ),
                    focusNode: controller.confirmPassFocusNode,
                    controller: controller.confirmPassController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the password';
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      } else if (value !=
                          controller.newPasswordController.text) {
                        return "Password does not match";
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
                      prefixIcon: Icon(Icons.lock_outline_rounded),

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
              SizedBox(height: Sizes.sectionPadding * 2),

              // Update Button
              SizedBox(
                height: 65,
                child: ElevatedButton(
                  onPressed: () async {
                    // Check if the current password is correct
                    if (await passwordUpdateController.checkPasswordExists(
                      passwordUpdateController.currentPassController.text
                          .trim(),
                    )) {
                      passwordUpdateController.currentPassError = null;

                      passwordUpdateController.update();

                      if (passwordUpdateController.formKey.currentState!
                          .validate()) {
                        await passwordUpdateController.updatePassword(
                          passwordUpdateController.newPasswordController.text
                              .trim(),
                        );
                        Get.back();
                      }
                    } else {
                      passwordUpdateController.currentPassError =
                          "The current password is incorrect";
                      passwordUpdateController.update();
                    }
                  },
                  child: Text(
                    "Update Password",
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Sizes.sectionPadding),
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Cancel",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
