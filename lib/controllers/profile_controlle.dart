import 'dart:io';
import 'package:ai_chatbot_colab/main.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_chatbot_colab/services/db_service.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  SQLData sqlData = SQLData();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();

  bool imageChanged = false;
  // Initializing the Image Picker
  ImagePicker imagePicker = ImagePicker();

  /// Storing the image into the database after coping it from cache to the device memory
  Future storeImage(XFile? image) async {
    if (image != null) {
      // Getting the file name and making it unique
      String fileName =
          "${DateTime.now().millisecondsSinceEpoch}_${p.basename(image.path)}";
      imageChanged = true;
      Directory devicePath = await getApplicationDocumentsDirectory();
      String savedImagePath = p.join(devicePath.path, fileName);
      File savedImage = await File(image.path).copy(savedImagePath);
      await sqlData.updateData(
        "UPDATE USERS SET IMAGE = ? WHERE IS_LOGGED_IN = 1",
        [savedImage.path],
      );
    }
  }

  /// Pick Image From Gallary
  Future pickeGallary() async {
    XFile? gallaryImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    await storeImage(gallaryImage);
  }

  /// Pick Image From Camera
  Future pickCamera() async {
    XFile? cameraImage = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    await storeImage(cameraImage);
  }

  Future removeImage() async {
    await sqlData.updateData(
      "UPDATE USERS SET IMAGE = NULL WHERE IS_LOGGED_IN = 1",
      [],
    );
    imageChanged = true;
  }

  Future editUserName() async {
    if (formKey.currentState!.validate()) {
      await sqlData.updateData(
        "UPDATE USERS SET USER_NAME = ? WHERE IS_LOGGED_IN = 1",
        [userNameController.text.trim()],
      );
    }
  }

  String? userName;
  String? userImage;

  List<Map> userData = [];

  /// Loading the user data
  Future loadUserData() async {
    userData = await sqlData.readData(
      "SELECT * FROM USERS WHERE IS_LOGGED_IN = 1",
      [],
    );

    if (userData.isNotEmpty) {
      if (userData[0]['USER_NAME'] != null) {
        userName = userData[0]['USER_NAME'];
      }
      userImage = userData[0]['IMAGE'];
      update();
    }
  }

  /// Deleting the user account
  Future deleteAccount() async {
    int userId = userData[0]['ID'];
    await sqlData.deleteData("DELETE FROM Chats WHERE USER_ID = ?", [userId]);
    await sqlData.deleteData("DELETE FROM USERS WHERE IS_LOGGED_IN = 1", []);
    data = [];
    await sqlData.closeAndResetDB();
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
  }
}
