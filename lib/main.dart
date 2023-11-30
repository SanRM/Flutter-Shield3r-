import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/cubits.dart';
import 'package:shield3r/pages/home.dart';
import 'package:shield3r/pages/login.dart';
import 'package:shield3r/pages/mission_control.dart';

void main() => runApp(BlocProviders());

class BlocProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PageChangeManagerCubit>(
        create: (context) => PageChangeManagerCubit(),
      ),
      BlocProvider<ButtonStateCubit>(
        create: (context) => ButtonStateCubit(),
      ),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shield3r - Ciberseguridad nativa en la nube',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/login': (context) => const LoginPage(),
      // },
      onGenerateRoute: (settings) {
        Widget wid = const LoginPage();
        switch (settings.name) {
          case "/login":
            wid = const LoginPage();
            break;
          case "/missionControl":
            wid = const MissionControl();
            break;
          case "/home":
            wid = const Home();
            break;
        }

        return PageRouteBuilder(
            settings:
                settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
            pageBuilder: (_, __, ___) => wid,
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

        // Unknown route
      },
      home: const Scaffold(
        body: Home(),
      ),
    );
  }
}
