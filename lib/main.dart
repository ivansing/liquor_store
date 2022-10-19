import 'package:ecommerce_app/app/myapp.dart';
import 'package:ecommerce_app/config/auth_route.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/repositories/repositories.dart';
import 'package:ecommerce_app/simple_bloc_observer.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();

  // TODO fix hive [Error: No implementation found for method
  //getApplicationDocumentsDirectory on channel plugins.flutter.io/path_provider]
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());

  final authRepository = AuthRepository();
  await authRepository.user.first;

  runApp(MyApp(
    authRepository: authRepository,
  ));
}

