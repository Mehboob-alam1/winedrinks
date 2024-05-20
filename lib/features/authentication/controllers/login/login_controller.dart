import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winedrinks/common/widgets/loaders/t_loaders.dart';
import 'package:winedrinks/data/repositories/authentication/authentication_repository.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';
import 'package:winedrinks/utlis/popups/full_screen_loader.dart';

import '../../../../utlis/network/network_manager.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {


  /// Variables


  final rememberMe = false.obs;
  final hidePassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final localStorage = GetStorage();
  final userController = Get.put(UserController());



  @override
  void onInit() {
    super.onInit();
    if(localStorage.read('REMEMBER_ME_EMAIL') !=null) {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
    }
    if(localStorage.read('REMEMBER_ME_PASSWORD') !=null) {
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    }
  }

  /// Email & Password Sign In

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Logging you in', WImages.loadingWine);

      // Check Internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation

      if (!loginFormKey.currentState!.validate()) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user with Email & Password Authentication

      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader

      WFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {


      WFullScreenLoader.stopLoading();

      WLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// -- Google SignIn

  Future<void> googleSignIn() async {
    try {
      // Start loading

      WFullScreenLoader.openLoadingDialog(
          'Logging you in...', WImages.loadingWine);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication

      final userCredentials =
      await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record

      await userController.saveUserRecord(userCredentials);

      // Remove loader

      WFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      WFullScreenLoader.stopLoading();

      WLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }






}
