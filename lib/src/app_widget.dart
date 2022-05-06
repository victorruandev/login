import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/src/shared/models/auth/auth_controller.dart';

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
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          // '/': (_) => const SplashPage(),
          '/': (_) => const ClosedCashierPage(),
          // '/auth': (_) => const AuthPage(),
          // '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
