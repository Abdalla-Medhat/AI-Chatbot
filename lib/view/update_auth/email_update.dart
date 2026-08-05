import 'package:ai_chatbot_colab/utilities/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_chatbot_colab/controllers/authentication_controller/email_update_controller.dart';

class EmailUpdate extends StatelessWidget {
  EmailUpdate({super.key});
  final EmailUpdateController emailUpdatecontroller = Get.put(
    EmailUpdateController(),
  );
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Email Update")),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: emailUpdatecontroller.formKey,
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
                  "Update your email",
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface.withAlpha(220),
                  ),
                ),
              ),

              Text(
                "Your email is used for account security, login, and important notifications. ",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.outline.withAlpha(220),
                ),
              ),

              SizedBox(height: Sizes.sectionPadding * 2),

              // Current email section
              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: Sizes.md,
                  left: Sizes.md,
                ),
                child: Text(
                  "Current Email",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withAlpha(200),
                  ),
                ),
              ),
              GetBuilder<EmailUpdateController>(
                builder: (controller) {
                  return TextFormField(
                    focusNode: controller.currentEmailFocusNode,
                    controller: controller.currentEmail,
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
                      errorText: controller.existingErrorText,
                      contentPadding: const EdgeInsets.all(15),

                      filled: true,
                      hintText: "yourname@example.com",

                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  );
                },
              ),
              SizedBox(height: Sizes.sectionPadding),

              // New email section
              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: Sizes.md,
                  left: Sizes.md,
                ),
                child: Text(
                  "New Email Address",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withAlpha(200),
                  ),
                ),
              ),
              GetBuilder<EmailUpdateController>(
                builder: (controller) {
                  return TextFormField(
                    focusNode: controller.newEmailFocusNode,
                    controller: controller.newEmail,
                    validator: (value) {
                      if (value == null) {
                        return "Please enter your new email";
                      } else {
                        return controller.isEmailValid(value);
                      }
                    },

                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      errorText: controller.sameEmailErrorText,
                      filled: true,
                      hintText: "Enter new email",

                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  );
                },
              ),
              SizedBox(height: Sizes.sectionPadding),
              // Confirm email section
              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: Sizes.md,
                  left: Sizes.md,
                ),
                child: Text(
                  "Confirm Email Address",
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withAlpha(200),
                  ),
                ),
              ),
              GetBuilder<EmailUpdateController>(
                builder: (controller) {
                  return TextFormField(
                    focusNode: controller.confirmEmailFocusNode,
                    controller: controller.confirmEmail,
                    validator: (value) {
                      if (value == null) {
                        return "Please confirm your new email";
                      } else if (value != controller.newEmail.text) {
                        return "Emails do not match";
                      } else if (value == controller.currentEmail.text.trim()) {
                        return "New email cannot be the same as current email";
                      } else {
                        return controller.isEmailValid(value);
                      }
                    },

                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),

                      filled: true,
                      hintText: "Repeat new email",

                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  );
                },
              ),
              SizedBox(height: Sizes.sectionPadding * 2),
              SizedBox(
                height: 65,
                child: ElevatedButton(
                  onPressed: () async {
                    // Check if the current email exists in the database
                    if (await emailUpdatecontroller.checkEmailExists(
                      emailUpdatecontroller.currentEmail.text.trim(),
                    )) {
                      // Check if the new email is the same as the current email
                      if (emailUpdatecontroller.currentEmail.text.trim() ==
                          emailUpdatecontroller.newEmail.text.trim()) {
                        emailUpdatecontroller.sameEmailErrorText =
                            "New email cannot be the same as current email";
                        emailUpdatecontroller.update();
                      }
                      if (emailUpdatecontroller.formKey.currentState!
                          .validate()) {
                        await emailUpdatecontroller.updateEmail(
                          emailUpdatecontroller.newEmail.text.trim(),
                        );
                        Get.back(result: true);
                      }
                    } else {
                      emailUpdatecontroller.existingErrorText =
                          "Current email does not exist";
                      emailUpdatecontroller.update();
                    }
                  },
                  child: Text(
                    "Update Email",
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
