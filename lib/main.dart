import 'package:ecommerce_app/repositories/repositories.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:ecommerce_app/simple_bloc_observer.dart';
import 'package:hive_flutter/adapters.dart';
import 'blocs/blocs.dart';
import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // TODO fix hive [Error: No implementation found for method
  //getApplicationDocumentsDirectory on channel plugins.flutter.io/path_provider]
  /* await Hive.initFlutter();
  Hive..registerAdapter(ProductAdapter()); */

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Check user auth
    return MaterialApp(
      title: 'Licoreria',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthRepository(),
          ),
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                  authenticationRepository: context.read<AuthRepository>(),
                  userRepository: context.read<UserRepository>()),
            ),
            BlocProvider(
              create: (_) => CartBloc()
                ..add(
                  LoadCart(),
                ),
            ),
            BlocProvider(
              create: (_) => PaymentBloc()
                ..add(
                  LoadPaymentMethod(),
                ),
            ),
            BlocProvider(
              create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                paymentBloc: context.read<PaymentBloc>(),
                checkoutRepository: CheckoutRepository(),
              ),
            ),
            BlocProvider(
              create: (_) => WishlistBloc()
                ..add(
                  LoadWishList(),
                ),
            ),
            BlocProvider(
              create: (_) => CategoryBloc(
                categoryRepository: CategoryRepository(),
              )..add(LoadCategories()),
            ),
            BlocProvider(
              create: (_) => ProductBloc(
                productRepository: ProductRepository(),
              )..add(LoadProducts()),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Licoreria App',
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
          ),
        ),
      ),
    );
  }
}
