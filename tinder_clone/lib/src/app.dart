import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/src/screens/main_screen.dart';
import 'package:tinder_clone/src/stores/card/card_provider.dart';

import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardProvider>(
      create: (context) => CardProvider(),
      child: AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
              theme: ThemeData(
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    minimumSize: const Size.square(80),
                  ),
                ),
              ),
              home: const MainScreen());
        },
      ),
    );
  }
}
