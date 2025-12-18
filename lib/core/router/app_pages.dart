enum AppPages {
  home,
  login;
  //...;

  String get path {
    switch (this) {
      case AppPages.home:
        return '/';
      case AppPages.login:
        return '/login';
      // case AppPage.settings:
      //   return '/settings';
    }
  }

  String get name => toString().split('.').last;
}