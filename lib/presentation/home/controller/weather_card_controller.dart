import 'package:airticket/data/repository/weather_remote_repository.dart';
import 'package:airticket/domain/usecase/weather_usecase.dart';
import 'package:airticket/presentation/home/model/weather.dart';
import 'package:get/get.dart';

abstract mixin class WeatherCardProvider {
  late final weatherCard = Get.find<WeatherCardController>();
}

class WeatherCardController extends GetxController {
  final RxList<Weather> weatherList = <Weather>[].obs;
  final WeatherRemoteRepository weatherRepositoryImplements =
      WeatherRemoteRepository();

  /// UseCase
  /// WeatherRepositoryImplements에서 데이터 가져오기
  getWeatherList() async {
    // weatherList.value = await weatherRepositoryImplements.getWeatherList();
    final remoteWeatherList = await ReadWeatherUseCase().execute();
    weatherList.value = remoteWeatherList;
  }

  /// SearchWeather 가져오기
  getSearchWeather(stnId) async {
    // weatherList.value = await weatherRepositoryImplements.getSearchWeatherList(stnId);
    final searchWeatherList = await SearchWeatherUseCase().execute(stnId);
    weatherList.value = searchWeatherList;
  }

  removeWeather(int index) async {
    weatherList.removeAt(index);
  }
}
