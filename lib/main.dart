import 'package:banao_flutter_task_1/ui/home_route/gridview.dart';
import 'package:banao_flutter_task_1/ui/home_route/home_screen_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dependency_injection.dart';

void main() async {
  runApp( MyApp());
  await inject();
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // useMaterial3: true,
      ),
      home: const HomeRoute(),

    );
  }
}*/
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(routes: [
/*    GoRoute(
        name: "splash",
        path: "/",
        builder: (context, state) {
          return  Container();
        }),*/
    GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) {
          return const HomeRoute();
        }),
    /*GoRoute(
        name: "register",
        path: "/register",
        builder: (context, state) {
          return const RegisterScreen();
        }),*/
    GoRoute(
        name: "gridview",
        path: "/gridview",
        builder: (context, state) {
          return const GridRoute();
        }),

  ]);
}

