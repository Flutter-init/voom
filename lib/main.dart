import 'package:flutter/material.dart';
import 'package:voom/pages/homeScreen.dart';
import 'package:voom/pages/home_state.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voom',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: HomeState.id,
      routes: {
        HomeState.id: (context) => const HomeState(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
