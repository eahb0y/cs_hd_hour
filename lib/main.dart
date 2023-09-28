import 'package:cs_hd_hour/router/app_routes.dart';
import 'package:cs_hd_hour/router/routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cs_hd_hour/injection_container.dart' as di;


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBsgq-XcocjraO2zLwqYsS114m8kdLBlOM",
      appId: "1:118340001664:web:7caf9b996eb427d1422b65",
      messagingSenderId: "118340001664",
      projectId: "c-space-web-467f3",
      authDomain: "c-space-web-467f3.firebaseapp.com",
      storageBucket: "c-space-web-467f3.appspot.com",
      measurementId: "G-LR6C4CSXDZ",
    ),
  );
  runApp(const MyApp());
  di.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.initial,
      onGenerateRoute: Rout.controller,
    );
  }
}
