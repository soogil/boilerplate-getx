import 'package:boilerplate_getx/core/di/login_bindings.dart';
import 'package:boilerplate_getx/feature/auth/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<StatefulWidget>
    with GetControllerMixin<LoginController> {
  final _emailController = TextEditingController(text: 'test@test.com');
  final _passwordController = TextEditingController(text: '1234');


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressed() async {
    await controller.login(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login (Riverpod + MVVM + Freezed)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 이메일
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 12),

            // 비밀번호
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 24),

            // 로그인 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.loginStatus == LoginStatus.loading
                    ? null
                    : _onLoginPressed,
                child: controller.loginStatus == LoginStatus.loading
                    ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Text('Login'),
              ),
            ),

            const SizedBox(height: 16),
            Obx(() {
              if (controller.loginStatus == LoginStatus.failure &&
                  controller.errorMsg != null) {
                return Text(
                  controller.errorMsg!,
                  style: const TextStyle(color: Colors.red),
                );
              }

              if (controller.loginStatus == LoginStatus.success
              && controller.user != null) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Welcome, ${controller.user!.name} (${controller.user!.email})',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }

              return SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}