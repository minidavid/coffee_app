import 'package:flutter/material.dart';

import 'pages/WebView.dart';

void main() {
  runApp(const TIC80AndroidApp());
}

class TIC80AndroidApp extends StatelessWidget {
  const TIC80AndroidApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',

      routes: {
        '/': (context) => LandingPage(),
        '/second': (context) => LandingPage(),
      }

    );
  }
}
