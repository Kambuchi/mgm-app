import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/inject.dart';
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp();

  await injectDependencies();

  runApp(const MyApp());
}
