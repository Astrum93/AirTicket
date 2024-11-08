import 'package:airticket/presentation/home/model/weather.dart';
import 'package:airticket/presentation/make_ticket/model/weather_ticket.dart';

abstract interface class WeatherRepository {
  Future<List<Weather>> getWeatherList();

  Future<List<Weather>> getSearchWeatherList(String stnId);

  Future<WeatherTicket> getSearchWeatherTicket(String stnId);

  Future addWeatherList(Weather weather);

  Future updateWeatherList(Weather weather);

  Future deleteWeatherList();
}
