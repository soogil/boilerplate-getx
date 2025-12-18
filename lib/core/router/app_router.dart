import 'package:boilerplate_getx/core/di/login_bindings.dart';
import 'package:boilerplate_getx/core/router/app_pages.dart';
import 'package:boilerplate_getx/feature/auth/presentation/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  static final router = GoRouter(
    initialLocation: AppPages.home.path,
    routes: [
      GoRoute(
        path: AppPages.home.path,
        pageBuilder: (context, state) {
          LoginBindings().dependencies();
          return const MaterialPage(child: LoginPage());
        }),
      // GoRoute(
      //   path: '/home',
      //   pageBuilder: (context, state) {
      //     HomeBinding().dependencies();
      //
      //     return const MaterialPage(
      //       child: HomePage(),
      //     );
      //   },
      // ),
    ],
  );
}