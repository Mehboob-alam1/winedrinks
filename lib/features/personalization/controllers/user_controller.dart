import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/t_loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../authentication/models/user/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
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

      if(user.value.id.isEmpty) {
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

  Future<void> fetchUserRecord() async{
    try{
      final user = await userRepository.fetchUserDetails();
      this.user(user);

    } catch(e){
      user(UserModel.empty());
    }
  }


  uploadUserProfilePicture() async{

  }
}
