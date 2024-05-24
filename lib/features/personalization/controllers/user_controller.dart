
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/loaders/t_loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../authentication/models/user/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Save user Record from any registration provider

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      /// First update the Rx user value and then check if the user data is already stored. if not store new data
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // refresh user record

          // Map Data

          final user = UserModel(
              id: userCredential.user!.uid,
              userName: userCredential.user!.displayName ?? '',
              email: userCredential.user!.email ?? '',
              password: '',
              profilePicture: userCredential.user!.photoURL ?? '',
              name: userCredential.user!.displayName ?? '');

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      WLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }

  /// Fetch user record

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
      WLoaders.successSnackBar(title: user.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update user model

        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        WLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your profile image has been updated');
      }
    } catch (e) {
      WLoaders.errorSnackBar(
          title: 'Oh Snap !', message: 'Something went wrong :$e');
    } finally {
      imageUploading.value = false;
    }
  }
}
