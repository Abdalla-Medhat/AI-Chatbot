import 'dart:io';
import 'dart:ui';

import 'package:ai_chatbot_colab/controllers/profile_controlle.dart';
import 'package:ai_chatbot_colab/utilities/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          onPressed: () {
            Get.back(result: profileController.imageChanged);
          },
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: Sizes.xl),
            height: Sizes.xl * 1.5,
            width: Sizes.xl * 1.5,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person_2_outlined,
              color: theme.colorScheme.onPrimary,
              size: Sizes.xl,
            ),
          ),
        ],
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: SizedBox.expand(),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(Sizes.xl),

        children: [
          SizedBox(height: Sizes.sectionPadding * 4),
          Center(
            child: Stack(
              children: [
                GetBuilder<ProfileController>(
                  builder: (controller) => CircleAvatar(
                    radius: 100,
                    backgroundColor: theme.colorScheme.primary,
                    backgroundImage: controller.userImage == null
                        ? AssetImage("assets/images/person.jpg")
                        : FileImage(File(controller.userImage!)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: Sizes.xl,
                  child: Material(
                    borderRadius: BorderRadius.circular(Sizes.xl),
                    child: Ink(
                      height: Sizes.xl * 2,
                      width: Sizes.xl * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(Sizes.xl),
                        splashColor: theme.colorScheme.secondary,
                        highlightColor: theme.colorScheme.secondary,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: theme.colorScheme.onPrimary,
                          size: Sizes.xl,
                        ),
                        onTap: () {
                          Get.bottomSheet(
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Sizes.xl * 1.5),
                                topRight: Radius.circular(Sizes.xl * 1.5),
                              ),
                              child: Container(
                                height: Sizes.xl * 8,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surfaceContainerLow,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.only(top: Sizes.md),
                                        width: Sizes.xl * 3,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color:
                                              theme.colorScheme.outlineVariant,
                                          borderRadius: BorderRadius.circular(
                                            Sizes.xl,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Sizes.containerMargin),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: Sizes.lg,
                                      ),
                                      child: Text(
                                        "Update Profile Picture",
                                        textAlign: TextAlign.start,
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withAlpha(200),
                                            ),
                                      ),
                                    ),
                                    SizedBox(height: Sizes.containerMargin),
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Sizes.xl),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          splashColor: theme.colorScheme.primary
                                              .withAlpha(125),
                                          onTap: () async {
                                            await profileController
                                                .pickCamera();
                                            await profileController
                                                .loadUserData();
                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: Sizes.xl * 1.5,
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: Sizes.xl,
                                                  color:
                                                      theme.colorScheme.primary,
                                                ),
                                                SizedBox(
                                                  width: Sizes.containerMargin,
                                                ),
                                                Text(
                                                  "Take Photo",
                                                  style: theme
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        color: theme
                                                            .colorScheme
                                                            .onSurface
                                                            .withAlpha(200),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Sizes.sectionPadding),
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Sizes.xl),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          splashColor: theme.colorScheme.primary
                                              .withAlpha(125),
                                          onTap: () async {
                                            await profileController
                                                .pickeGallary();
                                            await profileController
                                                .loadUserData();
                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: Sizes.xl * 1.5,
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.image_outlined,
                                                  size: Sizes.xl,
                                                  color:
                                                      theme.colorScheme.primary,
                                                ),
                                                SizedBox(
                                                  width: Sizes.containerMargin,
                                                ),
                                                Text(
                                                  "Choose from Gallery",
                                                  style: theme
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        color: theme
                                                            .colorScheme
                                                            .onSurface
                                                            .withAlpha(200),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Sizes.sectionPadding),
          GetBuilder<ProfileController>(
            builder: (controller) => Text(
              profileController.userName == null
                  ? "User Name"
                  : profileController.userName!,
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: Sizes.sectionPadding),
          Ink(
            height: Sizes.xl * 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(Sizes.lg),
            ),
            child: InkWell(
              splashColor: theme.colorScheme.primary.withAlpha(100),
              highlightColor: theme.colorScheme.secondary.withAlpha(125),
              borderRadius: BorderRadius.circular(Sizes.lg),
              onTap: () {
                Get.bottomSheet(
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizes.xl * 1.5),
                      topRight: Radius.circular(Sizes.xl * 1.5),
                    ),
                    child: Container(
                      height: Sizes.xl * 16,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerLow,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: Sizes.md),
                              width: Sizes.xl * 3,
                              height: 4,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.outlineVariant,
                                borderRadius: BorderRadius.circular(Sizes.xl),
                              ),
                            ),
                          ),
                          SizedBox(height: Sizes.containerMargin),
                          Flexible(
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: Sizes.lg,
                                  ),
                                  child: Text(
                                    "Edit Name",
                                    textAlign: TextAlign.start,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      // fontWeight: FontWeight.w600,
                                      color: theme.colorScheme.onSurface
                                          .withAlpha(200),
                                    ),
                                  ),
                                ),
                                SizedBox(height: Sizes.sm),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: Sizes.lg,
                                  ),
                                  child: Text(
                                    "How should we address you?",
                                    textAlign: TextAlign.start,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.outline,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Sizes.sectionPadding),
                                Form(
                                  key: profileController.formKey,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Sizes.lg,
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(
                                            Sizes.md,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: theme.colorScheme.primary
                                                .withAlpha(51),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            Sizes.md,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            Sizes.md,
                                          ),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: theme.colorScheme.error
                                                .withAlpha(51),
                                          ),
                                        ),
                                        fillColor: WidgetStateColor.resolveWith(
                                          (state) {
                                            if (state.contains(
                                              WidgetState.focused,
                                            )) {
                                              return Color(0xffEAF4FF);
                                            }
                                            return theme
                                                .colorScheme
                                                .outlineVariant
                                                .withAlpha(75);
                                          },
                                        ),
                                      ),

                                      maxLines: 1,
                                      maxLength: 50,

                                      keyboardType: TextInputType.name,
                                      controller:
                                          profileController.userNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),

                                SizedBox(height: Sizes.sectionPadding),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.lg,
                                  ),
                                  child: SizedBox(
                                    height: Sizes.xl * 2.5,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        await profileController.editUserName();
                                        await profileController.loadUserData();
                                        Get.back();
                                      },
                                      child: Text(
                                        "Save Changes",
                                        style: Get.textTheme.bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  theme.colorScheme.onPrimary,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: Sizes.sectionPadding),
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: Get.textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: theme.colorScheme.primary,
                                      ),
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
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: Sizes.md),
                    height: Sizes.xl * 2,
                    width: Sizes.xl * 2,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHigh.withAlpha(
                        150,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_2_outlined,
                      color: theme.colorScheme.outline,
                      size: Sizes.xl,
                    ),
                  ),
                  SizedBox(width: Sizes.lg),
                  Text(
                    "Edit Name",
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface.withAlpha(220),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: Sizes.md),
                    child: Icon(
                      Icons.edit_outlined,
                      color: theme.colorScheme.outline,
                      size: Sizes.xl,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SizedBox(height: Sizes.sectionPadding),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     height: Sizes.xl * 4,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(Sizes.lg),
          //       color: theme.colorScheme.surfaceContainerLow,
          //     ),

          //     child: Row(
          //       children: [
          //         Container(
          //           margin: EdgeInsets.only(left: Sizes.md),
          //           height: Sizes.xl * 2,
          //           width: Sizes.xl * 2,
          //           decoration: BoxDecoration(
          //             color: theme.colorScheme.surfaceContainerHigh.withAlpha(
          //               150,
          //             ),
          //             shape: BoxShape.circle,
          //           ),
          //           child: Icon(
          //             Icons.camera_alt_outlined,
          //             color: theme.colorScheme.outline,
          //             size: Sizes.xl,
          //           ),
          //         ),
          //         SizedBox(width: Sizes.lg),
          //         Text(
          //           softWrap: true,
          //           "Change Profile Picture",
          //           style: Get.textTheme.bodyLarge!.copyWith(
          //             fontWeight: FontWeight.w600,
          //             color: theme.colorScheme.onSurface.withAlpha(220),
          //           ),
          //         ),
          //         Spacer(),
          //         Padding(
          //           padding: const EdgeInsets.only(right: Sizes.md),
          //           child: Icon(
          //             Icons.arrow_forward_ios_rounded,
          //             color: theme.colorScheme.outline,
          //             size: Sizes.xl,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: Sizes.sectionPadding),
          InkWell(
            splashColor: theme.colorScheme.errorContainer.withAlpha(100),
            highlightColor: theme.colorScheme.error.withAlpha(125),
            borderRadius: BorderRadius.circular(Sizes.lg),
            onTap: () async {
              await profileController.removeImage();
              await profileController.loadUserData();
            },
            child: Container(
              height: Sizes.xl * 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.lg),
                color: theme.colorScheme.errorContainer.withAlpha(50),
              ),

              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: Sizes.md),
                    height: Sizes.xl * 2,
                    width: Sizes.xl * 2,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.errorContainer.withAlpha(150),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LucideIcons.trash2,
                      color: theme.colorScheme.error,
                      size: Sizes.xl,
                    ),
                  ),
                  SizedBox(width: Sizes.lg),
                  Text(
                    "Remove Profile Picture",
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Sizes.sectionPadding),
          SizedBox(
            height: Sizes.xl * 3,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.surfaceContainerLowest,
                foregroundColor: theme.colorScheme.error,
                elevation: 0.3,
              ),
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    insetPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.xl * 2,
                    ),
                    contentPadding: const EdgeInsets.all(Sizes.lg),
                    constraints: const BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: Sizes.xl * 2,
                          height: Sizes.xl * 2,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.errorContainer.withAlpha(
                              125,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_off_outlined,
                            size: Sizes.xl,
                            color: theme.colorScheme.error,
                          ),
                        ),
                        SizedBox(height: Sizes.sectionPadding),
                        Text(
                          "Delete Account?",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: Sizes.containerMargin),
                        Text(
                          "This will permanently delete your account and all associated data.This action cannot be undone.",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: theme.colorScheme.outline,
                          ),
                        ),
                        SizedBox(height: Sizes.sectionPadding),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.xl,
                          ),
                          child: SizedBox(
                            height: Sizes.xl * 2,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                await profileController.deleteAccount();
                                Get.offAllNamed("/");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.error
                                    .withAlpha(220),
                                foregroundColor: theme.colorScheme.onPrimary,
                              ),
                              child: Text(
                                "Delete Account",
                                style: Get.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Sizes.containerMargin),
                        TextButton(
                          onPressed: () {
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
                      ],
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_remove_outlined,
                    size: Sizes.xl,
                    color: theme.colorScheme.error,
                  ),
                  SizedBox(width: Sizes.md),
                  Text(
                    "Delete Account",
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.error,
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
