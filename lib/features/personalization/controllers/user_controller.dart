import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/t_loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../authentication/models/user/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user Record from any registration provider

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
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
    } catch (e) {
      WLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
          'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }
}
