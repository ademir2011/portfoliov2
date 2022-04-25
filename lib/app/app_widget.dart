import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Portfólio',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xffECECEC),
          secondary: Color(0xff1F51FF),
          tertiary: Color(0xffFE019A),
          surfaceVariant: Color(0xff8FFCFF),
        ),
        cardColor: const Color(0xff323238),
        scaffoldBackgroundColor: const Color(0xff202024),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'MajorMonoDisplay',
            fontSize: 60,
            color: Color(0xffECECEC),
            shadows: [BoxShadow(color: Color(0xffECECEC), blurRadius: 8)],
          ),
          displaySmall: TextStyle(
            fontFamily: 'MajorMonoDisplay',
            fontSize: 30,
            color: Color(0xffECECEC),
            shadows: [BoxShadow(color: Color(0xffECECEC), blurRadius: 4)],
          ),
          titleLarge: TextStyle(
            fontFamily: 'Syncopate',
            fontSize: 25,
            color: Color(0xffECECEC),
            shadows: [BoxShadow(color: Color(0xffECECEC), blurRadius: 3)],
          ),
          titleMedium: TextStyle(
            fontFamily: 'Syncopate',
            fontWeight: FontWeight.w300,
            fontSize: 15,
            color: Color(0xffECECEC),
            shadows: [BoxShadow(color: Color(0xffECECEC), blurRadius: 3)],
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Syncopate',
            fontSize: 15,
            color: Color(0xffECECEC),
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Syncopate',
            fontSize: 12,
            color: Color(0xffECECEC),
          ),
          bodySmall: TextStyle(
            fontFamily: 'SyncopateBold',
            fontSize: 12,
            color: Color(0xffECECEC),
          ),
        ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
