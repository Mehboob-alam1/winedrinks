import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/common/widgets/loaders/t_loaders.dart';
import 'package:winedrinks/data/repositories/user/user_repository.dart';
import 'package:winedrinks/features/personalization/controllers/user_controller.dart';
import 'package:winedrinks/features/personalization/screens/profile/profile_screen.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';
import 'package:winedrinks/utlis/popups/full_screen_loader.dart';

import '../../../utlis/network/network_manager.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final name = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserFormKey= GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();

    initializeValues();

  }

  Future<void> initializeValues()  async{
    name.text= userController.user.value.name;
    userName.text= userController.user.value.userName;
    email.text= userController.user.value.email;
    password.text= userController.user.value.password;
  }


  Future<void> updateUserName() async{
    try{

      // Start Loading
      WFullScreenLoader.openLoadingDialog('We are updating your information', WImages.loadingWine);

      // Check Internet connectivity

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        return;
      }


      Map<String, dynamic> Name= {'Name': name.text.trim(),'UserName' : userName.text.trim()};
      await userRepository.updateSingleField(Name);

      // Update the RX User value

      userController.user.value.name =name.text.trim();
      userController.user.value.userName =userName.text.trim();

      // Remove the Loader
      WFullScreenLoader.stopLoading();


      // Show Success Message
      WLoaders.successSnackBar(title: 'Congratulations',message: 'Your profile has been update');

      Get.off(()=> const ProfileScreen());

    }catch(e){
      WFullScreenLoader.stopLoading();
      WLoaders.errorSnackBar(title: 'Oh snap!',message: e.toString());
    }

  }

  


}
