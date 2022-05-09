
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/src/features/auth/auth_controller.dart';
import 'package:provider_start/src/shared/models/user/user_model.dart';
import 'package:provider_start/src/shared/services/client_http.dart';

import 'features/auth/auth_page.dart';
import 'features/closed_cashier/closed_cashier_page.dart';
import 'features/home/home_page.dart';
import 'features/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ClientHttp(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthController(context.read<ClientHttp>()),
        ),
        ChangeNotifierProvider(
          create: (context) => UserModel(cashierCode: '', operatorName: ''),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const ClosedCashierPage(),
          '/splashPage': (_) => const SplashPage(),
          '/auth': (_) => const AuthPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
