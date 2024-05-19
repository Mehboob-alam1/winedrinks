
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:winedrinks/features/authentication/models/user/user_model.dart';
import 'package:winedrinks/utlis/exceptions/firebase_exceptions.dart';
import 'package:winedrinks/utlis/exceptions/format_exceptions.dart';
import 'package:winedrinks/utlis/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{

  static UserRepository get instance =>Get.find();

  final FirebaseFirestore _db= FirebaseFirestore.instance;


  /// Function to save user data to FireStore

   Future<void> saveUserRecord(UserModel user)async {


     try{
       await _db.collection("Users").doc(user.id).set(user.toJson());

     }on FirebaseException catch (e){
       throw WFirebaseException(e.code).message;
     }on FormatException catch (_){
       throw const WFormatException();
     }on PlatformException catch (e){
       throw WPlatformException(e.code).message;
     }catch(e){
       throw 'Something went wrong';
     }
   }



 }