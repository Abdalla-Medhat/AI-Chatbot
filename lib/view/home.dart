import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:ai_chatbot_colab/utilities/sizes.dart';
import 'package:ai_chatbot_colab/controllers/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print("Home Built");
    HomeController c = Get.put(HomeController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool portrait = Get.context!.orientation == Orientation.portrait;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(
              horizontal: portrait ? width * 0.04 : width * 0.02,
            ),
            icon: Icon(Icons.settings),
            onPressed: () {},
            iconSize: Sizes().getIconSize(portrait),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: portrait ? width * 0.03 : width * 0.04,
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: CircleAvatar(
                radius: Sizes().circleAvatar(portrait),
                backgroundImage: AssetImage("assets/images/person.jpg"),
              ),
            ),
          ),
        ],
        leading: LayoutBuilder(
          builder: (context, constraints) {
            double size = constraints.maxHeight;
            return Padding(
              padding: EdgeInsets.only(
                left: portrait ? size * 0.3 : size * 0.34,
              ),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu, size: Sizes().getIconSize(portrait)),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        width: double.infinity,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Sizes().imageSize(portrait),
                          width: Sizes().imageSize(portrait),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(25),
                            child: Image.asset(
                              "assets/images/person.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            "Abdallah Medhat",
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Free Plan",
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant.withAlpha(180),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed("/");
                    },
                    child: Container(
                      height: Sizes().bigDrawerButtonSize(portrait),

                      margin: EdgeInsets.only(left: 20, bottom: 30, right: 40),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).colorScheme.primary,
                              size: Sizes().getIconSize(portrait),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 20),
                            child: Text(
                              "New Chat",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 30),
                    child: Row(
                      children: [
                        Icon(
                          Icons.messenger,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurfaceVariant.withAlpha(180),
                          size: Sizes().getIconSize(portrait),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Recent Conversations",
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant.withAlpha(180),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ...List.generate(
                    20,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 50.0, bottom: 10),
                      child: Text(
                        "Example of Chat $index",
                        style: TextStyle(
                          fontSize: 17,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                bottom: 20,
                top: portrait ? 50 : 15,
                right: 70,
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: Sizes().getIconSize(portrait),
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurfaceVariant.withAlpha(180),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurfaceVariant.withAlpha(180),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          c.startChat
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text("""
              startResizingAnimationIfNeeded: types=statusBars host=com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab/com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab.MainActivity
              startResizingAnimationIfNeeded: types=statusBars host=com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab/com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab.MainActivity
              startResizingAnimationIfNeeded: types=statusBars host=com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab/com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab.MainActivity
              startResizingAnimationIfNeeded: types=statusBars host=com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab/com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab.MainActivity
              startResizingAnimationIfNeeded: types=statusBars host=com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab/com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab.MainActivity
              startResizingAnimationIfNeeded: types=statusBars host=com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab/com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab.MainActivity
              startResizingAnimationIfNeeded: types=statusBars host=com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab/com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab.MainActivity
              startResizingAnimationIfNeeded: types=statusBars host=com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab/com.abdallahmedhat.ai.chatbot.colab.ai_chatbot_colab.MainActivity
              
              """, style: TextStyle(fontSize: 17)),
                      ],
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
                              top: portrait ? height * 0.05 : height * 0.01,
                              bottom: portrait ? height * 0.02 : height * 0.03,
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/Overlay.png",
                                width: Sizes().imageSize(portrait),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "How can I help?",
                            style: TextStyle(
                              fontSize: portrait ? 40 : 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            textAlign: TextAlign.center,
                            """
Start a conversation with your AI 
assistant for brainstorming, coding, 
or just a chat.""",
                            style: TextStyle(fontSize: portrait ? 15 : 12),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 15.0,
                          right: 15.0,
                          bottom: 15,
                        ),
                        child: SizedBox(
                          height: Sizes().getCardHeight(portrait),
                          width: Sizes().getCardWidth(portrait),

                          child: Card(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                      "assets/images/bulb.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsGeometry.only(top: 10),
                                    child: Text("""
Brainstorm ideas for my next travel 
blog
          """, style: TextStyle(fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: SizedBox(
                          height: Sizes().getCardHeight(portrait),
                          width: Sizes().getCardWidth(portrait),

                          child: Card(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                      "assets/images/bulb.png",
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsGeometry.only(top: 10),
                                    child: Text("""
Brainstorm ideas for my next travel 
blog
          """, style: TextStyle(fontSize: 15)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 7.0,
                  top: 10.0,
                  // bottom: 3.0,
                ),
                child: SizedBox(
                  width: Sizes().getTextFieldWidth(portrait),
                  height: portrait ? height * 0.07 : height * 0.150,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    fixedSize: Size.square(
                      Sizes().getCircleButtonSize(portrait),
                    ),
                  ),

                  onPressed: () {},
                  child: Image.asset("assets/images/arrow.png"),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: portrait ? height * 0.075 : height * 0.15,
                width: portrait ? width * 0.5 : width * 0.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/chatrounded.png"),
                      SizedBox(width: 10),
                      Text(
                        "Start Chat",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
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
              iconSize: Sizes().bottomIconSize(portrait),
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
    );
  }
}
