import 'package:airticket/presentation/home/common/nation_code.dart';
import 'package:airticket/presentation/home/model/weather.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherCardDescription extends StatelessWidget {
  const WeatherCardDescription({super.key, required this.weather});

  final Weather weather;
  final String _sun = 'https://img.icons8.com/emoji/96/sun-emoji.png';
  final String _cloud = 'https://img.icons8.com/emoji/96/cloud-emoji.png';
  final String _rain =
      'https://img.icons8.com/emoji/96/cloud-with-rain-emoji.png';
  final String _temp = 'https://img.icons8.com/emoji/96/thermometer-emoji.png';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          surfaceTintColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.white,
          child: SingleChildScrollView(
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
                        fontSize: 50,
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
                Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: (double.parse(weather.pa).ceil()) < 800
                          ? _rain
                          : (double.parse(weather.pa).ceil()) < 1013
                              ? _cloud
                              : _sun,
                    ),
                    Text(
                      (double.parse(weather.pa).ceil()) < 800
                          ? '비'
                          : (double.parse(weather.pa).ceil()) < 1013
                              ? '흐림'
                              : '맑음',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50),
                Divider(),
                SizedBox(height: 50),
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
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('적설(cm) : ${weather.sd}'),
                    Text('강수량(24h) (mm) : ${weather.hr24Rn}'),
                    Text('강수량(1h) (mm) : ${weather.hr1Rn}'),
                    Text('강수량(3h)(mm) : ${weather.hr3Rn}'),
                    Text('강수량(6h)(mm) : ${weather.hr6Rn}'),
                    Text('최저운고(m) : ${weather.minCh}'),
                    Text('현지기압(hPa) : ${weather.pa}'),
                    Text('상대습도(%) : ${weather.hm}'),
                    Text('기온(℃) : ${weather.ta}'),
                    Text('이슬점온도(℃) : ${weather.td}'),
                    Text('풍향(deg.,°) : ${weather.wd}'),
                    Text('풍속(㎧) : ${weather.ws}'),
                    Text('위도(N) : ${weather.lat}'),
                    Text('경도(E) : ${weather.lon}'),
                    Text('해면기압(hPa) : ${weather.ps}'),
                    Text('전운량(%) : ${weather.tca}'),
                    Text('강수량(mm) : ${weather.rn}'),
                    Text('강수집수시간 (6시간단위) : ${weather.rnWrchHr}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
