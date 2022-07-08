import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voom/utility/wrapper.dart';



import 'firebase_options.dart';
import 'utility/navigate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const Wrapper(),
      // initialRoute: HomeState.id,
      routes: Navigate.routes,
    );
  }
}
 