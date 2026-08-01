import 'dart:ui';
import 'package:ai_chatbot_colab/utilities/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_chatbot_colab/controllers/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isPortrait = Get.context!.orientation == Orientation.portrait;
    return
    // remeber to delete the PopScope
    PopScope(
      canPop: true,

      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {}
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            // Adding blur effect
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(),
              ),
            ),
            backgroundColor: theme.colorScheme.surface.withAlpha(204),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: isPortrait ? 10 : 5),

                icon: Icon(Icons.settings, color: theme.colorScheme.outline),
                onPressed: () {
                  Get.toNamed("/settings");
                },
                iconSize: 24,
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isPortrait ? Sizes.lg : Sizes.md,
                ),
                child: GetBuilder<HomeController>(
                  builder: (controller) => PopupMenuButton(
                    color: theme.colorScheme.surface,
                    offset: const Offset(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Sizes.lg),
                    ),
                    constraints: BoxConstraints(minWidth: 220, maxWidth: 220),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: "profile",
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: Sizes.xl,
                              color: theme.colorScheme.outline,
                            ),
                            SizedBox(width: Sizes.md),
                            Text(
                              "View Profile",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: "settings",
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: Sizes.xl,
                              color: theme.colorScheme.outline,
                            ),
                            SizedBox(width: Sizes.md),
                            Text(
                              "Settings",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        height: 0,
                        enabled: false,
                        child: Divider(),
                      ),
                      PopupMenuItem(
                        value: "logout",

                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              size: Sizes.xl,
                              color: Color(0xffba1a1a),
                            ),
                            SizedBox(width: Sizes.md),
                            Text(
                              "Log Out",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: Color(0xffba1a1a),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (value) async {
                      if (value == "profile") {}
                      if (value == "settings") {
                        Get.toNamed("/settings");
                      }
                      if (value == "logout") {
                        await controller.logout();
                        Get.offNamed("/login");
                      }
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: Image.asset(
                        "assets/images/person.jpg",
                        fit: BoxFit.cover,
                      ).image,
                    ),
                  ),
                ),
              ),
            ],
            leading: Builder(
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: isPortrait ? Sizes.lg : Sizes.md,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 24,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                );
              },
            ),
          ),
          drawer: GetBuilder<HomeController>(
            builder: (controller) {
              return Drawer(
                width: double.infinity,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40,
                              top: 20,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      Sizes.md,
                                    ),
                                    child: Image.asset(
                                      "assets/images/person.jpg",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: Sizes.sm,
                                    bottom: Sizes.sm,
                                  ),
                                  child: Text(
                                    "Alex Rivera", //To be edited
                                    style: theme.textTheme.titleLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: Sizes.sectionPadding,
                                  ),
                                  child: Text(
                                    "Free Plan",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: theme.colorScheme.outline
                                          .withAlpha(220),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(Sizes.md),
                            ),
                            margin: EdgeInsets.only(
                              left: 40,
                              right: Sizes.containerMargin,
                            ),
                            child: InkWell(
                              onTap: () async {
                                controller.currentSession.clear();
                                controller.startChat = false;
                                controller.chatId = null;
                                controller.chatController.clear();
                                controller.update();
                                Get.back();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: Sizes.containerMargin,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: theme.colorScheme.primary,
                                      size: 24,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: Sizes.md),
                                    child: Text(
                                      "New Chat",
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(
                                            color: theme.colorScheme.primary,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: Sizes.sectionPadding),
                          Padding(
                            padding: EdgeInsets.only(left: 65),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.messenger,
                                  color: theme.colorScheme.outline,
                                  size: 24,
                                ),
                                SizedBox(width: Sizes.md),
                                Text(
                                  "Recent Conversations",
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: theme.colorScheme.outline.withAlpha(
                                      220,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Sizes.sectionPadding),
                          controller.isLoadingMessages
                              ? Center(child: CircularProgressIndicator())
                              : Padding(
                                  padding: const EdgeInsets.only(
                                    left: Sizes.lg,
                                  ),
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.previousChatsSessions.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          left: Sizes.xl,
                                          right: isPortrait
                                              ? Sizes.xl
                                              : Sizes.xl * 4,
                                        ),

                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          "${controller.previousChatsSessions[index][0]["Message"]}",
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(
                                                color: theme
                                                    .colorScheme
                                                    .onSurface
                                                    .withAlpha(220),
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 40,
                        bottom: Sizes.sectionPadding,
                        top: isPortrait ? Sizes.xl : Sizes.lg,
                        right: 70,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 24,
                              color: theme.colorScheme.outline,
                            ),
                            SizedBox(width: Sizes.md),
                            Text(
                              "Settings",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: theme.colorScheme.outline.withAlpha(220),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          body: GetBuilder<HomeController>(
            builder: (controller) => Column(
              children: [
                controller.startChat
                    ? Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Sizes.bubbleGapOuter,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.currentSession.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          controller
                                                  .currentSession[index]['Sender'] ==
                                              controller.userData[0]['EMAIL']
                                          ? BorderRadius.only(
                                              topLeft: Radius.circular(
                                                Sizes.xl,
                                              ),
                                              topRight: Radius.circular(
                                                Sizes.xl,
                                              ),
                                              bottomLeft: Radius.circular(
                                                Sizes.xl,
                                              ),
                                              bottomRight: Radius.circular(
                                                Sizes.sm,
                                              ),
                                            )
                                          : BorderRadius.only(
                                              topLeft: Radius.circular(
                                                Sizes.xl,
                                              ),
                                              topRight: Radius.circular(
                                                Sizes.xl,
                                              ),
                                              bottomLeft: Radius.circular(
                                                Sizes.sm,
                                              ),
                                              bottomRight: Radius.circular(
                                                Sizes.xl,
                                              ),
                                            ),
                                      color:
                                          controller
                                                  .currentSession[index]['Sender'] ==
                                              controller.userData[0]['EMAIL']
                                          ? theme.colorScheme.primary
                                          : controller
                                                    .currentSession[index]['Sender'] ==
                                                "Bot"
                                          ? theme
                                                .colorScheme
                                                .surfaceContainerHighest
                                          : theme.colorScheme.error.withAlpha(
                                              220,
                                            ),
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        Sizes.bubbleGapInner,
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          "${controller.currentSession[index]['Sender']}: ${controller.currentSession[index]['Message']}",
                                          style: theme.textTheme.bodyLarge!.copyWith(
                                            color:
                                                controller
                                                        .currentSession[index]['Sender'] ==
                                                    controller
                                                        .userData[0]['EMAIL']
                                                ? theme.colorScheme.onPrimary
                                                : controller
                                                          .currentSession[index]['Sender'] ==
                                                      "Bot"
                                                ? theme.colorScheme.onSurface
                                                : theme.colorScheme.onError,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Sizes.bubbleGapOuter),
                                ],
                              );
                            },
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: isPortrait
                                        ? Sizes.sectionPadding
                                        : Sizes.xl,
                                    bottom: isPortrait
                                        ? Sizes.sectionPadding
                                        : Sizes.xl,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/images/Overlay.png",
                                      width: 80,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "How can I help?",
                                  style: theme.textTheme.headlineLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: theme.colorScheme.onSurface
                                            .withAlpha(220),
                                      ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.containerMargin,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Start a conversation with your AI assistant for brainstorming, coding, or just a chat.",
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant
                                          .withAlpha(220),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: Sizes.bubbleGapOuter,
                                left: Sizes.containerMargin,
                                right: Sizes.containerMargin,
                                bottom: Sizes.bubbleGapOuter,
                              ),
                              child: SizedBox(
                                height: 130,
                                width: 100,

                                child: Card(
                                  color:
                                      theme.colorScheme.surfaceContainerLowest,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: Sizes.md,
                                          ),
                                          child: Image.asset(
                                            "assets/images/bulb.png",
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsGeometry.only(
                                            top: Sizes.lg,
                                          ),
                                          child: Text(
                                            "Brainstorm ideas for my next travel blog",
                                            style: isPortrait
                                                ? theme.textTheme.bodyMedium!
                                                      .copyWith(
                                                        color: theme
                                                            .colorScheme
                                                            .onSurface,
                                                      )
                                                : theme.textTheme.bodyLarge!
                                                      .copyWith(
                                                        color: theme
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: Sizes.containerMargin,
                                right: Sizes.containerMargin,
                              ),
                              child: SizedBox(
                                height: 130,
                                width: 100,

                                child: Card(
                                  color:
                                      theme.colorScheme.surfaceContainerLowest,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: Image.asset(
                                            "assets/images/bulb.png",
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsGeometry.only(
                                            top: 10,
                                          ),
                                          child: Text(
                                            "Brainstorm ideas for my next travel blog",
                                            softWrap: true,
                                            style: isPortrait
                                                ? theme.textTheme.bodyMedium!
                                                      .copyWith(
                                                        color: theme
                                                            .colorScheme
                                                            .onSurface,
                                                      )
                                                : theme.textTheme.bodyLarge!
                                                      .copyWith(
                                                        color: theme
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
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

                Padding(
                  padding: EdgeInsets.only(
                    top: Sizes.sectionPadding,
                    left: isPortrait ? Sizes.containerMargin : 70,
                    right: isPortrait ? Sizes.containerMargin : 70,
                    bottom: Sizes.sectionPadding,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: controller.chatController,
                          decoration: InputDecoration(
                            hintText: "Type your message...",
                          ),
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          fixedSize: Size.square(50),
                        ),

                        onPressed: () async {
                          //fetch the user message and send it to the API, then update the chat with both the user message and the bot response
                          if (controller.chatController.text.trim().isEmpty) {
                            return;
                          }
                          await controller.chating(
                            await controller.userData[0]['EMAIL'],
                          );
                          controller.startChat = true;
                          controller.update();
                        },
                        child: Image.asset("assets/images/arrow.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: GetBuilder<HomeController>(
            builder: (controller) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(blurRadius: 10, color: Colors.black.withAlpha(20)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),

                child: BottomNavigationBar(
                  onTap: (value) => controller.changeBottomIndex(value),
                  currentIndex: controller.bottomIndex,
                  iconSize: 24,
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/images/chat.png",
                        // height: Sizes().bottomIconSize(portrait),
                      ),
                      label: "Chat",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.history),
                      label: "History",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.explore),
                      label: "Explore",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
