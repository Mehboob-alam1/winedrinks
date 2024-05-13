import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winedrinks/utlis/network/network_manager.dart';


class GeneralBindings extends Bindings{

  @override
  void dependencies() {
  Get.put(NetworkManager());

  }
}