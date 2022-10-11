import 'package:ecommerce_app/config/auth_route.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/repositories/repositories.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:ecommerce_app/simple_bloc_observer.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:hive_flutter/adapters.dart';
import 'blocs/blocs.dart';
import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/config/theme.dart';
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
  Hive..registerAdapter(ProductAdapter());

  /* final authRepository = AuthRepository();
  final userRepository = UserRepository();
  await authRepository.user.first; */

  runApp(MyApp(
      /* authRepository: authRepository,
    userRepository: userRepository, */
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  /* required AuthRepository authRepository,
    required UserRepository userRepository, */
  /* _authRepository = authRepository,
        _userRepository = userRepository; */

  /*  final AuthRepository _authRepository;
  final UserRepository _userRepository; */

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Licoreria',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthRepository(), //AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          /* RepositoryProvider(
            create: (context) => UserRepository(),
          ), */
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => AuthBloc(
                      authRepository: context.read<AuthRepository>(),
                    )),
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
              create: (_) => WishlistBloc(
                localStorageRepository: LocalStorageRepository(),
              )..add(
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
          child: const MyAppView(),
        ),
      ),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Licoreria App',
      theme: theme(),
      /* home: FlowBuilder<AuthStatus>(
        state: context.select((AuthBloc bloc) => bloc.state.status),
        onGeneratePages: AppRouter.
      ), */
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
