import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';


class AppBindings {
  static void init() {
    Get.lazyPut<Dio>(() => Dio());
  }
}

mixin GetControllerMixin<T> on State<StatefulWidget> {
  late final T controller = Get.find<T>();
}