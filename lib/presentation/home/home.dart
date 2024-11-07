import 'package:airticket/presentation/home/widget/weather_card.dart';
import 'package:flutter/material.dart';

import 'widget/weather_search_snack_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color primaryColor = Colors.deepPurple.shade100;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Air Ticket'),
      ),
      body: const WeatherCard(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) =>
                WeatherSearchSnackBar(primaryColor: primaryColor),
          );
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
