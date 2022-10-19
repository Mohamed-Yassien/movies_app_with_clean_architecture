import 'package:flutter/material.dart';
import 'package:movies_clean_arc/core/services/sevices_locator.dart';
import 'package:movies_clean_arc/movies/presentation/screens/movies_screen.dart';

main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMoviesScreen(),
    );
  }
}
