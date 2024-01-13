import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task1/Bloc/Bloc_details/details_cubit.dart';
import 'package:task1/Bloc/Bloc_home/home_cubit.dart';
import 'package:task1/Bloc/Bloc_profile/profile_cubit.dart';
import 'package:task1/Screen/StartPage.dart';

import 'Bloc/Bloc_Login/login_cubit.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return LoginCubit();
          },
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) {
            return ProfileCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return DetailsCubit();
          },
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //  localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale("en"),
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
            primaryColor: Colors.black38),
        debugShowCheckedModeBanner: false,
        home: const StartPage(),
      ),
    );
  }
}
