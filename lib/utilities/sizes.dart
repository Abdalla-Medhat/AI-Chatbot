import 'package:get_x/get.dart';

class Sizes {
  double getIconSize(bool portrait) {
    if (GetPlatform.isDesktop) {
      return portrait ? 36 : 33;
    }
    // Mobile
    return portrait ? 30 : 26;
  }

  double bottomIconSize(bool portrait) {
    if (GetPlatform.isDesktop) {
      return portrait ? 50 : 33;
    }
    // Mobile
    return portrait ? 35 : 30;
  }

  double circleAvatar(bool portrait) {
    if (GetPlatform.isDesktop) {
      return portrait ? 33 : 30;
    }

    // Mobile
    return portrait ? 25 : 22;
  }

  // Home image size
  double imageSize(bool portrait) {
    if (GetPlatform.isDesktop) {
      return portrait ? 130 : 100;
    }

    // Mobile
    return portrait ? 100 : 90;
  }

  double getCardWidth(bool portrait) {
    if (GetPlatform.isDesktop) {
      return portrait ? 400 : 500;
    }
    // Mobile
    return portrait ? 330 : 200;
  }

  double getCardHeight(bool portrait) {
    if (GetPlatform.isDesktop) {
      return portrait ? 200 : 150;
    }
    // Mobile
    return portrait ? 170 : 130;
  }

  double getTextFieldWidth(bool portrait) {
    if (GetPlatform.isDesktop) {
      return portrait ? 400 : 500;
    }
    // Mobile
    return portrait ? 300 : 300;
  }

  double bigDrawerButtonSize(bool portrait) {
    if (GetPlatform.isDesktop) {
      return portrait ? 85 : 75;
    }
    // Mobile
    return portrait ? 75 : 65;
  }

  double getCircleButtonSize(bool portrait) {
    if (GetPlatform.isDesktop) {
      return portrait ? 65 : 60;
    }
    // Mobile
    return portrait ? 50 : 45;
  }
}
