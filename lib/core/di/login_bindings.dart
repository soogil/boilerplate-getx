import 'package:boilerplate_getx/feature/auth/data/datasource/auth_datasource.dart';
import 'package:boilerplate_getx/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:boilerplate_getx/feature/auth/domain/repositories/auth_repository.dart';
import 'package:boilerplate_getx/feature/auth/domain/usecase/login_usecase.dart';
import 'package:boilerplate_getx/feature/auth/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';


class LoginBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AuthDataSource>(
          () => AuthDatasourceImpl(Get.find<Dio>()),);
    Get.lazyPut<AuthRepository>(
          () => AuthRepositoryImpl(Get.find<AuthDataSource>()),);
    Get.lazyPut<LoginUseCase>(
          () => LoginUseCase(Get.find<AuthRepository>()),);
    Get.lazyPut<LoginController>(
          () => LoginController(Get.find<LoginUseCase>()),);
  }
}

mixin GetControllerMixin<T> on State<StatefulWidget> {
  late final T controller = Get.find<T>();
}