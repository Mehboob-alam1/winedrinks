import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:winedrinks/common/widgets/loaders/t_loaders.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';
import 'package:winedrinks/utlis/network/network_manager.dart';
import 'package:winedrinks/utlis/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variable

  final name = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /// Sign Up

  Future<void> signUp() async {
    try {
      // Start loading

      WFullScreenLoader.openLoadingDialog(
          'We are processing your information...', WImages.loadingWine);

      // check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) return;

      ///TODO
      ///https://youtu.be/8TIFDZq97Q8?list=PL5jb9EteFAOAusKTSuJ5eRl1BapQmMDT6  16:32

      // Form validation

      if (signUpFormKey.currentState!.validate())return;

      // Register user in firebase authentication  & save user data
    } catch (e) {
      WLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      WFullScreenLoader.stopLoading();
    }
  }
}
