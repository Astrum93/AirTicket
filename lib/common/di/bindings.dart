import 'package:airticket/data/remote/weather_api.dart';
import 'package:airticket/data/repository/weather_remote_repository.dart';
import 'package:airticket/domain/repository/weather_repository.dart';
import 'package:airticket/presentation/home/controller/weather_card_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

/// GetX로 의존성 주입 할 경우 Bindings를 사용한다.
///
/// dependencies를 정의하여 의존성을 주입할 수 있다.
class WeatherBindings implements Bindings {
  @override
  void dependencies() {
    /// 순서의 영향을 받기 때문에 순서가 중요 하다.
    /// 현재는 각각의 Presentation Layer의 위젯들마다 GetController를 상속받아 관리하기에 필요 없다고 판단.
    Get.put<WeatherApi>(WeatherApi(Dio()));
    Get.put<WeatherRepository>(WeatherRemoteRepository());
    Get.put<WeatherCardController>(WeatherCardController());
  }
}
