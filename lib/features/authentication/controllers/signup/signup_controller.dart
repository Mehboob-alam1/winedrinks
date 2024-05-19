import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:winedrinks/common/widgets/loaders/t_loaders.dart';
import 'package:winedrinks/data/repositories/authentication/authentication_repository.dart';
import 'package:winedrinks/data/repositories/user/user_repository.dart';
import 'package:winedrinks/features/authentication/models/user/user_model.dart';
import 'package:winedrinks/features/authentication/screens/signup/verify_email.dart';
import 'package:winedrinks/utlis/constants/image_strings.dart';
import 'package:winedrinks/utlis/network/network_manager.dart';
import 'package:winedrinks/utlis/popups/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variable
  final hidePassword = true.obs;
  final name = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /// Sign Up

void signUp() async {
    try {
      // Start loading

      WFullScreenLoader.openLoadingDialog(
          'We are processing your information...', WImages.loadingWine);

      // check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        return;
      }


      // Form validation

      if (!signUpFormKey.currentState!.validate()) {

        WFullScreenLoader.stopLoading();

        return;
      }

      // Register user in firebase authentication  & save user data

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore

      final newUser = UserModel(
          id: userCredential.user!.uid,
          name: name.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          password: password.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);
      
      
      // Remove Loader 
      WFullScreenLoader.stopLoading();
      
      // Show success message
      WLoaders.successSnackBar(title: 'Congratulations',message: 'Your account has been created ! Verify email to continue.');
    
      // Move to verify email
      
      Get.to(()=>   VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      WFullScreenLoader.stopLoading();
      WLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
