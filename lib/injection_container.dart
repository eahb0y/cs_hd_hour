import 'package:cs_hd_hour/core/local_data/local_source.dart';
import 'package:cs_hd_hour/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:cs_hd_hour/feature/info/presentation/bloc/info_bloc.dart';
import 'package:cs_hd_hour/feature/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/main/presentation/bloc/main_bloc.dart';

final sl = GetIt.instance;

late SharedPreferences preferences;

Future<void> init() async {
  await initPreferences();
  sl.registerSingleton<LocalSource>(LocalSource(preferences));
  sl.registerFactory(() => LoginBloc());
  sl.registerFactory(() => AuthBloc());
  sl.registerFactory(() => MainBloc());
  sl.registerFactory(() => InfoBloc());
}

Future<void> initPreferences() async {
  preferences = await SharedPreferences.getInstance();
}
