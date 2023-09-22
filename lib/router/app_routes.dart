import 'package:cs_hd_hour/feature/login/presentation/bloc/login_bloc.dart';
import 'package:cs_hd_hour/feature/login/presentation/page/login_page.dart';
import 'package:cs_hd_hour/feature/splash/presentation/page/splash_page.dart';
import 'package:cs_hd_hour/injection_container.dart';
import 'package:cs_hd_hour/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Rout {
  Rout._();

  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initial:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => sl<LoginBloc>(),
              child: const LoginPage(),
            ));
      case RoutesName.auth:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        throw ('The rout does not exist');
    }
  }

}