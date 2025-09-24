import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/bindings/general_bindings.dart';
import 'package:shopping_app/routes/app_routes.dart';
import 'package:shopping_app/utils/constants/colors.dart';
import 'package:shopping_app/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: RAppTheme.lightTheme,
      darkTheme: RAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: RColors.primary, body: Center(child: CircularProgressIndicator(color: RColors.white))),
    );
  }
}