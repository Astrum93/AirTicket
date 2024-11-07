import 'package:airticket/data/remote/dio/response_converter.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: 'https://apis.data.go.kr/1360000/GtsInfoService')
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(ResponseConverter());
    return _WeatherApi(dio);
  }

  @GET('/getSynop')
  Future fetchWeather(
    @Query('serviceKey') String serviceKey,
    @Query('dataType') String dataType,
    @Query('tm') String tm,
    @Query('stnId') String stnId,
  );

  @GET('/getSynop')
  Future searchWeather(
    @Query('serviceKey') String serviceKey,
    @Query('dataType') String dataType,
    @Query('tm') String tm,
    @Query('stnId') String stnId,
  );
}
