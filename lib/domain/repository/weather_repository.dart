import 'package:airticket/presentation/home/model/weather.dart';

abstract interface class WeatherRepository {
  Future<List<Weather>> getWeatherList();

  Future<List<Weather>> getSearchWeatherList(String stnId);

  Future addWeatherList(Weather weather);

  Future updateWeatherList(Weather weather);

  Future deleteWeatherList();
}
