import 'package:boilerplate_getx/feature/auth/domain/entities/user.dart';
import 'package:boilerplate_getx/feature/auth/domain/usecase/login_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  LoginController(this._loginUseCase);

  final LoginUseCase _loginUseCase;
  final Rx<LoginStatus> _loginStatus = Rx<LoginStatus>(LoginStatus.none);
  final Rx<String?> _errorMsg = Rx<String?>(null);
  final Rx<User?> _user = Rx<User?>(null);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    _loginStatus.value = LoginStatus.loading;
    try {
      _user.value = await _loginUseCase.call(email: email, password: password);
      _loginStatus.value = LoginStatus.success;
      _errorMsg.value = null;
    } catch(e) {
      debugPrint(e.toString());
      _errorMsg.value = e.toString();
      _loginStatus.value = LoginStatus.failure;
    }
  }

  LoginStatus get loginStatus => _loginStatus.value;
  String? get errorMsg => _errorMsg.value;
  User? get user => _user.value;
}


enum LoginStatus {
  none,
  loading,
  success,
  failure
}