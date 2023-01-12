import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/cubit/cubit.dart';
import 'package:ecommerce_app/repositories/repositories.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) =>
              AuthRepository(userRepository: context.read<UserRepository>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
              userRepository: context.read<UserRepository>(),
            ),
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
              authBloc: context.read<AuthBloc>(),
              cartBloc: context.read<CartBloc>(),
              paymentBloc: context.read<PaymentBloc>(),
              checkoutRepository: CheckoutRepository(),
            ),
          ),
          BlocProvider(
            create: (_) => WishlistBloc(
              localStorageRepository: LocalStorageRepository(),
            )..add(LoadWishList()),
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
          ),
          BlocProvider(
            create: (context) => SearchBloc(
              productBloc: context.read<ProductBloc>(),
            )..add(LoadSearch()),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => SignUpCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
        ],
        child: MyAppView(),
      ),
    );
  }
}

class MyAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Licoreria App',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
