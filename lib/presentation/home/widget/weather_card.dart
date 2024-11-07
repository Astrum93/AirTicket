import 'package:airticket/presentation/home/common/nation_code.dart';
import 'package:airticket/presentation/home/controller/weather_card_controller.dart';
import 'package:airticket/presentation/home/widget/weather_card_description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({
    super.key,
  });

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> with WeatherCardProvider {
  final String _sun = 'https://img.icons8.com/emoji/96/sun-emoji.png';
  final String _cloud = 'https://img.icons8.com/emoji/96/cloud-emoji.png';
  final String _rain =
      'https://img.icons8.com/emoji/96/cloud-with-rain-emoji.png';
  final String _temp = 'https://img.icons8.com/emoji/96/thermometer-emoji.png';

  @override
  void initState() {
    Get.put(WeatherCardController());
    weatherCard.weatherList.isEmpty ? weatherCard.getWeatherList() : null;
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<WeatherCardController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => weatherCard.weatherList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurpleAccent,
              ),
            )
          : ListView.separated(
              itemCount: weatherCard.weatherList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                var weather = weatherCard.weatherList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Dismissible(
                    key: UniqueKey(),

                    /// Dismissible Container
                    background: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.delete_outline, size: 50),
                          Icon(Icons.delete_outline, size: 50),
                        ],
                      ),
                    ),

                    /// weatherCard 삭제
                    onDismissed: (direction) {
                      weatherCard.removeWeather(index);
                    },
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => WeatherCardDescription(
                              weather: weather,
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.shade300, width: 4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  nationCode[weather.stnId],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '${weather.tm.substring(0, 4)}년 ${weather.tm.substring(4, 6)}월 ${weather.tm.substring(6, 8)}일',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${weather.tm.substring(8, 10)}시 ${weather.tm.substring(10, 12)}분',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: (double.parse(weather.pa).ceil()) <
                                          800
                                      ? _rain
                                      : (double.parse(weather.pa).ceil()) < 1013
                                          ? _cloud
                                          : _sun,
                                ),
                                Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: _temp,
                                      width: 50,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${weather.minTa}℃ ',
                                          style: const TextStyle(
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          '/',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          ' ${weather.maxTa}℃',
                                          style: const TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
