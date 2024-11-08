import 'package:airticket/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirTicketApp extends StatelessWidget {
  const AirTicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple.shade100,
        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //initialBinding: WeatherBindings(),
      home: const Home(),
    );
  }
}
