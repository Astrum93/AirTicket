import 'package:airticket/presentation/home/common/nation_code.dart';
import 'package:airticket/presentation/home/controller/weather_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherSearchSnackBar extends StatefulWidget {
  const WeatherSearchSnackBar({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  State<WeatherSearchSnackBar> createState() => _WeatherSearchSnackBarState();
}

class _WeatherSearchSnackBarState extends State<WeatherSearchSnackBar>
    with WeatherCardProvider {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    Get.put(WeatherCardController());
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 30),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 2, color: Theme.of(context).colorScheme.inversePrimary),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.inversePrimary),
                borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '국가 Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    cursorColor: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(nationCode.toString().substring(1, 88)),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              weatherCard.getSearchWeather(_nameController.value.text);
              Get.back();
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 4, color: widget.primaryColor),
                  borderRadius: BorderRadius.circular(24)),
              child: Center(
                child: Icon(
                  Icons.search,
                  size: 50,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
