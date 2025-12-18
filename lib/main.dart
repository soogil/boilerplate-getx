import 'package:boilerplate_getx/core/di/app_bindings.dart';
import 'package:boilerplate_getx/core/router/app_router.dart';
import 'package:flutter/material.dart';


void main() {
  AppBindings.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}

