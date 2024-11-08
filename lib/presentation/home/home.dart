import 'package:airticket/presentation/home/widget/weather_card.dart';
import 'package:airticket/presentation/make_ticket/controller/make_ticket_controller.dart';
import 'package:airticket/presentation/make_ticket/make_ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/fade_button.dart';
import 'widget/weather_search_snack_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color primaryColor = Colors.deepPurple.shade100;
  bool _show = false;
  bool _show2 = false;

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
        title: const Text(
          '날씨',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          const WeatherCard(),

          /// Search Weather
          FadeButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) =>
                    WeatherSearchSnackBar(primaryColor: primaryColor),
              );
            },
            left: 16,
            flag: _show,
            color: Colors.redAccent,
            icon: Icons.search,
          ),

          /// Make Ticket
          FadeButton(
            onTap: () => Get.to(
              () => const MakeTicketScreen(),
              binding: BindingsBuilder(
                () {
                  Get.put(MakeTicketController());
                },
              ),
            ),
            left: 82,
            flag: _show2,
            color: Colors.blueAccent,
            icon: Icons.airplane_ticket_outlined,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          setState(() {
            _show = !_show;
          });
          await Future.delayed(const Duration(milliseconds: 200));
          setState(() {
            _show2 = !_show2;
          });
        },
        child: Icon(_show || _show2 ? Icons.remove : Icons.add),
      ),
    );
  }
}
