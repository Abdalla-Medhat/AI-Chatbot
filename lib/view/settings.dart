import 'dart:ui';
import 'package:ai_chatbot_colab/utilities/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_chatbot_colab/controllers/settings_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(),
          ),
        ),

        title: Text("Settings"),
        iconTheme: IconThemeData(color: Get.theme.colorScheme.primary),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(
              top: Sizes.sectionPadding,
              left: Sizes.xl,
              bottom: Sizes.md,
            ),
            child: Text(
              "ACCOUNT",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Material(
              child: ListTile(
                contentPadding: EdgeInsetsDirectional.symmetric(
                  horizontal: Sizes.xl,
                ),
                tileColor: Get.theme.colorScheme.surfaceContainerLowest,
                splashColor: Get.theme.colorScheme.outlineVariant,
                enabled: true,
                onTap: () async {
                  final result = await Get.toNamed("/email_update");
                  if (result != null && result) {
                    await settingsController.loadUserEmail();
                  }
                },

                title: Text(
                  "Email",
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
                subtitle: GetBuilder<SettingsController>(
                  builder: (controller) => Text(
                    controller.userEmail,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.outline.withAlpha(220),
                    ),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: Sizes.lg,
                  color: Get.theme.colorScheme.outline.withAlpha(85),
                ),
                leading: Icon(
                  Icons.email,
                  color: Get.theme.colorScheme.onSurfaceVariant.withAlpha(230),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Material(
              child: ListTile(
                contentPadding: EdgeInsetsDirectional.symmetric(
                  horizontal: Sizes.xl,
                ),
                tileColor: Get.theme.colorScheme.surfaceContainerLowest,
                splashColor: Get.theme.colorScheme.outlineVariant,
                enabled: true,
                onTap: () {
                  Get.toNamed("/password_update");
                },

                title: Text(
                  "Password Change",
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  "Keep your account secure",
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: Get.theme.colorScheme.outline.withAlpha(220),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: Sizes.lg,
                  color: Get.theme.colorScheme.outline.withAlpha(85),
                ),
                leading: Icon(
                  Icons.lock,
                  color: Get.theme.colorScheme.onSurfaceVariant.withAlpha(230),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(
              top: Sizes.sectionPadding,
              left: Sizes.xl,
              bottom: Sizes.md,
            ),
            child: Text(
              "PREFERENCES",
              style: Get.textTheme.bodyLarge!.copyWith(
                color: Get.theme.colorScheme.primary,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: GetBuilder<SettingsController>(
              builder: (controller) => Material(
                child: ListTile(
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: Sizes.xl,
                  ),
                  tileColor: Get.theme.colorScheme.surfaceContainerLowest,
                  splashColor: Get.theme.colorScheme.outlineVariant,
                  enabled: true,
                  onTap: () {
                    controller.toggleDarkMode(!controller.isDarkMode);
                  },

                  title: Text(
                    "Dark Mode toggle",
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Get.theme.colorScheme.onSurface,
                    ),
                  ),
                  subtitle: Text(
                    controller.isDarkMode ? "On" : "Off",
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: Get.theme.colorScheme.outline.withAlpha(220),
                    ),
                  ),
                  trailing: Switch(
                    value: controller.isDarkMode,
                    onChanged: (value) {
                      controller.toggleDarkMode(value);
                    },
                  ),
                  leading: Icon(
                    Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    size: Sizes.xl,
                    color: Get.theme.colorScheme.onSurfaceVariant.withAlpha(
                      230,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(
              top: Sizes.sectionPadding,
              left: Sizes.xl,
              bottom: Sizes.md,
            ),
            child: Text(
              "PREFERENCES",
              style: Get.textTheme.bodyLarge!.copyWith(
                color: Get.theme.colorScheme.primary,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Material(
              child: ListTile(
                contentPadding: EdgeInsetsDirectional.symmetric(
                  horizontal: Sizes.xl,
                ),
                tileColor: theme.colorScheme.surfaceContainerLowest,
                splashColor: theme.colorScheme.outlineVariant,
                enabled: true,
                title: Text(
                  "App version",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  "v1.0.0-alpha",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.outline.withAlpha(220),
                  ),
                ),

                leading: Icon(
                  Icons.info,
                  color: theme.colorScheme.onSurfaceVariant.withAlpha(230),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Material(
              child: ListTile(
                contentPadding: EdgeInsetsDirectional.symmetric(
                  horizontal: Sizes.lg,
                ),
                tileColor: theme.colorScheme.surfaceContainerLowest,
                splashColor: theme.colorScheme.outlineVariant,
                enabled: true,
                onTap: () {
                  Get.toNamed("/privacy_policy");
                },

                title: Text(
                  "Privacy policy",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  "Read our terms and conditions",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.outline.withAlpha(220),
                  ),
                ),
                trailing: Icon(
                  Icons.open_in_new,
                  size: Sizes.xl,
                  color: theme.colorScheme.outline.withAlpha(85),
                ),
                leading: Icon(
                  Icons.policy,
                  size: Sizes.xl,
                  color: Get.theme.colorScheme.onSurfaceVariant.withAlpha(230),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Material(
              child: ListTile(
                contentPadding: EdgeInsetsDirectional.symmetric(
                  horizontal: Sizes.lg,
                ),
                tileColor: Get.theme.colorScheme.surfaceContainerLowest,
                splashColor: Get.theme.colorScheme.outlineVariant,
                enabled: true,
                onTap: () {},

                title: Text(
                  "Clear Local Database",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.error,
                  ),
                ),
                subtitle: Text(
                  "Permanently delete all locally cached messages",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.error.withAlpha(80),
                  ),
                ),
                trailing: Icon(
                  Icons.delete_forever_rounded,
                  size: Sizes.xl,
                  color: theme.colorScheme.error.withAlpha(80),
                ),
                leading: Icon(
                  LucideIcons.database,
                  size: Sizes.xl,
                  color: theme.colorScheme.error.withAlpha(230),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: Sizes.sectionPadding * 2,
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout_outlined, color: theme.colorScheme.error),
                  SizedBox(width: Sizes.sm),
                  Text(
                    "Log Out",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
