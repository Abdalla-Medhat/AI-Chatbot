import 'dart:ui';
import 'package:ai_chatbot_colab/utilities/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
        title: Text("Privacy Policy"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Sizes.xl),
            child: Icon(Icons.privacy_tip, size: Sizes.xl),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: Sizes.sectionPadding,
          top: Sizes.sectionPadding,
          bottom: Sizes.sectionPadding,
          right: Sizes.md,
        ),
        child: ListView(
          children: [
            Text(
              "Privacy Policy",
              style: theme.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface.withAlpha(220),
              ),
            ),
            SizedBox(height: Sizes.md),
            Row(
              children: [
                Text(
                  "Last Updated: ",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface.withAlpha(220),
                  ),
                ),
                Text("August 2026", style: theme.textTheme.bodyLarge),
              ],
            ),
            SizedBox(height: Sizes.md),
            Text(
              """Your privacy is important to us.
This AI Chatbot application is designed to collect only the information necessary to provide its features while respecting your privacy.""",
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurface.withAlpha(220),
              ),
            ),
            SizedBox(height: Sizes.sectionPadding),
            Text(
              "Information We Collect",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.md),
            Text(
              "The application may access:",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.sm),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.sm,
                    right: Sizes.md,
                    top: Sizes.md,
                  ),
                  width: Sizes.defaultS,
                  height: Sizes.defaultS,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Your email address for account authentication.",
                    softWrap: true,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withAlpha(220),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.sm),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.sm,
                    right: Sizes.md,
                    top: Sizes.md,
                  ),
                  width: Sizes.defaultS,
                  height: Sizes.defaultS,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Chat conversations created within the app.",
                    softWrap: true,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withAlpha(220),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.sm),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.sm,
                    right: Sizes.md,
                    top: Sizes.md,
                  ),
                  width: Sizes.defaultS,
                  height: Sizes.defaultS,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Photos captured using your device camera.",
                    softWrap: true,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withAlpha(220),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.sm),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.sm,
                    right: Sizes.md,
                    top: Sizes.md,
                  ),
                  width: Sizes.defaultS,
                  height: Sizes.defaultS,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Application preferences such as theme settings.",
                    softWrap: true,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withAlpha(220),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.sectionPadding),
            Text(
              "Permissions",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "This application may request the following permissions:",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Text(
              "Camera",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.sm),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "Used only when you choose to capture an image inside the application.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Text(
              "Photos & Media",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.sm),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "Used only when you choose to select an existing image from your device.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "The application does not access your camera or photo library without your permission.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Text(
              "Local Storage",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "Your chat history, preferences, and other application data are stored locally on your device to improve performance and provide a better user experience.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Text.rich(
              TextSpan(
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
                children: [
                  const TextSpan(
                    text:
                        "You can permanently remove all locally stored data at any time by selecting",
                  ),
                  TextSpan(
                    text: "\"Clear Local Database\"",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: " from the Settings page."),
                ],
              ),
            ),
            SizedBox(height: Sizes.md),
            Text(
              "AI Processing",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "When you send a message to the chatbot, your message is securely transmitted to our application server, where an AI model developed as part of this project processes your request and generates a response.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "The transmitted data is used solely to provide the chatbot service and is not shared with external AI services.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Text(
              "Data Security",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "We take reasonable measures to protect your information. However, no electronic storage or data transmission method can be guaranteed to be completely secure.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Text(
              "Server Logs",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "To maintain the reliability, security, and performance of the application, our server may temporarily record technical information such as request timestamps, IP addresses, and error logs.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "This information is used solely for monitoring, troubleshooting, and improving the service.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Text(
              "Your Choices",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.sm),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "You may:",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.sm),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.sm,
                    right: Sizes.md,
                    top: Sizes.md,
                  ),
                  width: Sizes.defaultS,
                  height: Sizes.defaultS,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),

                Expanded(
                  child: Text(
                    "Update your account information.",
                    softWrap: true,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withAlpha(220),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.sm),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.sm,
                    right: Sizes.md,
                    top: Sizes.md,
                  ),
                  width: Sizes.defaultS,
                  height: Sizes.defaultS,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),

                Expanded(
                  child: Text(
                    "Delete locally stored data.",
                    softWrap: true,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withAlpha(220),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.sm),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.sm,
                    right: Sizes.md,
                    top: Sizes.md,
                  ),
                  width: Sizes.defaultS,
                  height: Sizes.defaultS,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),

                Expanded(
                  child: Text(
                    "Revoke camera or photo permissions at any time through your device settings.",
                    softWrap: true,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withAlpha(220),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.sm),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.sm,
                    right: Sizes.md,
                    top: Sizes.md,
                  ),
                  width: Sizes.defaultS,
                  height: Sizes.defaultS,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),

                Expanded(
                  child: Text(
                    "Stop using the application whenever you choose.",
                    softWrap: true,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurface.withAlpha(220),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Sizes.md),
            Text(
              "Changes to This Policy",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "This Privacy Policy may be updated from time to time.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "Any changes will be reflected in the latest version available within the application.",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),
            SizedBox(height: Sizes.md),
            Text(
              "Contact",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(220),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Sizes.md),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.sm),
              child: Text(
                "If you have any questions, concerns, or requests regarding this Privacy Policy, please contact us at:",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(220),
                ),
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(alignment: Alignment.centerLeft),
              onPressed: () async {
                final uri = Uri(
                  scheme: 'mailto',
                  path: 'abdallahmedhat.dev@gmail.com',
                  queryParameters: {'subject': 'Support'},
                );
                bool contact = await launchUrl(uri);
                if (!contact) {
                  Get.snackbar("Error", "Failed to open email client");
                }
              },
              child: Text(
                "abdallahmedhat.dev@gmail.com",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
