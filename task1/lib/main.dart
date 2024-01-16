import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/Bloc/Bloc_details/details_cubit.dart';
import 'package:task1/Bloc/Bloc_home/home_cubit.dart';
import 'package:task1/Bloc/Bloc_profile/profile_cubit.dart';
import 'package:task1/Screen/StartPage.dart';
import 'package:task1/Screen/tab_screen.dart';

import 'Bloc/Bloc_Login/login_cubit.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  print(prefs.getString("token"));
  String token = prefs.getString("token") ?? "";
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale("en"),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          primaryColor: Colors.black38,
        ),
        debugShowCheckedModeBanner: false,
        home: token != "" ? const TabScreen() : const StartPage(),
      ),
    ),
  );
}
