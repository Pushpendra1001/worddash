import 'package:flutter/material.dart';

import 'package:worddash/common_styles.dart';
import 'package:worddash/routes.dart';

class SoundGameApp extends StatelessWidget {
  const SoundGameApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sound Game',
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}