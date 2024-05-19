import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:winedrinks/features/authentication/screens/login/login.dart';
import 'package:winedrinks/features/authentication/screens/onboarding/onboarding.dart';
import 'package:winedrinks/features/authentication/screens/signup/verify_email.dart';
import 'package:winedrinks/navigation_menu.dart';
import 'package:winedrinks/utlis/exceptions/firebase_auth_exceptions.dart';
import 'package:winedrinks/utlis/exceptions/firebase_exceptions.dart';
import 'package:winedrinks/utlis/exceptions/format_exceptions.dart';
import 'package:winedrinks/utlis/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show Relevant screen

  screenRedirect() async {
    final user=_auth.currentUser;
    if(user!=null){
      if(user.emailVerified){
        Get.offAll(()=> const NavigationMenu());
      }else{
        Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
      /// Local Storage
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }

  }

  /// [EmailAuthentication]  - REGISTER

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw WFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw WFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const WFormatException();
    } on PlatformException catch (e) {
      throw WPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// [EmailVerification]  - MAIL VERIFICATION

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw WFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw WFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const WFormatException();
    } on PlatformException catch (e) {
      throw WPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  /// [LOGOUT] - Valid for any authentication

  Future<void> logout() async{


    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    }on FirebaseAuthException catch(e){
      throw WFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw WFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const WFormatException();
    }on PlatformException catch(e){
      throw WPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  /// [GoogleAuthentication] - GOOGLE

  Future<UserCredential?> signInWithGoogle() async {
    try {
      //Trigger the authentication flow

      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request

      final GoogleSignInAuthentication? googleAuth =
      await userAccount?.authentication;

      // Create a new credential

      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in , return the user credential

      return  await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw WFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw WFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const WFormatException();
    } on PlatformException catch (e) {
      throw WPlatformException(e.code).message;
    } catch (e) {

      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }


  /// [EMAILAUTHENTICATION] - LOGIN

  Future<UserCredential> loginWithEmailAndPassword(String email,String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      throw WFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw WFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const WFormatException();
    }on PlatformException catch(e){
      throw WPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }

  }
}
