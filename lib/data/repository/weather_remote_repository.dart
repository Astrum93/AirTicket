import 'package:airticket/data/remote/weather_api.dart';
import 'package:airticket/domain/repository/weather_repository.dart';
import 'package:airticket/presentation/home/model/weather.dart';
import 'package:airticket/presentation/make_ticket/model/weather_ticket.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherRemoteRepository implements WeatherRepository {
  final Dio _dio = Dio();

  @override
  Future<List<Weather>> getWeatherList() async {
    List<Weather> weatherList = [];

    try {
      final WeatherApi weatherApi = WeatherApi(_dio);
      var response = await weatherApi.fetchWeather(
        'kHb8z0a4maE/+L2GTXaWZGp1wo5NxLjEY21d8HA/lOA6H0juAh5rofZ+ZBtT1XGicZYR8j57HZ2JxJGsRK0dSA==',
        'JSON',
        '${DateFormat('yyyyMMdd').format(DateTime.now())}0000',
        '47108',
      );

      /// Api error
      if (response.runtimeType == String) {
        debugPrint(
            'error check : ${response.toString().contains(OpenApiErrorType.values.toString()).toString()}');

        debugPrint(response.toString());
        weatherList = [];
      }

      var responseData = response['response']['body']['items']['item'];

      weatherList = List.generate(
        responseData!.length,
        (int index) => Weather.fromJson(responseData[index]),
      );
      debugPrint(weatherList.toString());
      debugPrint(weatherList.length.toString());
    } catch (e) {
      debugPrint('@@error@@ : ${e.toString()}');
      rethrow;
    }
    return weatherList;
  }

  @override
  Future<List<Weather>> getSearchWeatherList(String stnId) async {
    List<Weather> weatherList = [];
    try {
      final WeatherApi weatherApi = WeatherApi(_dio);
      var response = await weatherApi.fetchWeather(
        'kHb8z0a4maE/+L2GTXaWZGp1wo5NxLjEY21d8HA/lOA6H0juAh5rofZ+ZBtT1XGicZYR8j57HZ2JxJGsRK0dSA==',
        'JSON',
        '${DateFormat('yyyyMMdd').format(DateTime.now())}0000',
        stnId,
      );

      var responseData = response['response']['body']['items']['item'];

      weatherList = List.generate(
        responseData!.length,
        (int index) => Weather.fromJson(responseData[index]),
      );

      debugPrint(weatherList.toString());
      debugPrint(weatherList.length.toString());

      return weatherList;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<WeatherTicket> getSearchWeatherTicket(String stnId) async {
    try {
      final WeatherApi weatherApi = WeatherApi(_dio);
      var response = await weatherApi.fetchWeather(
        'kHb8z0a4maE/+L2GTXaWZGp1wo5NxLjEY21d8HA/lOA6H0juAh5rofZ+ZBtT1XGicZYR8j57HZ2JxJGsRK0dSA==',
        'JSON',
        '${DateFormat('yyyyMMdd').format(DateTime.now())}0000',
        stnId,
      );

      var responseData = response['response']['body']['items']['item'][0];
      WeatherTicket weatherTicket = WeatherTicket.fromJson(responseData);

      return weatherTicket;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future addWeatherList(Weather weather) {
    // TODO: implement addWeatherList
    throw UnimplementedError();
  }

  @override
  Future deleteWeatherList() {
    // TODO: implement addWeatherList
    throw UnimplementedError();
  }

  @override
  Future updateWeatherList(Weather weather) {
    // TODO: implement updateWeatherList
    throw UnimplementedError();
  }
}

enum OpenApiErrorType {
  NORMAL_SERVICE,
  APPLICATION_ERROR,
  DB_ERROR,
  NODATA_ERROR,
  HTTP_ERROR,
  SERVICETIME_OUT,
  INVALID_REQUEST_PARAMETER_ERROR,
  NO_MANDATORY_REQUEST_PARAMETERS_ERROR,
  NO_OPENAPI_SERVICE_ERROR,
  SERVICE_ACCESS_DENIED_ERROR,
  TEMPORARILY_DISABLE_THE_SERVICEKEY_ERROR,
  LIMITED_NUMBER_OF_SERVICE_REQUESTS_EXCEEDS_ERROR,
  SERVICE_KEY_IS_NOT_REGISTERED_ERROR,
  UNREGISTERED_IP_ERROR,
  UNSIGNED_CALL_ERROR,
  UNKNOWN_ERROR,
}
