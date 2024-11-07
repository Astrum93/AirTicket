import 'package:airticket/data/repository/weather_remote_repository.dart';
import 'package:airticket/domain/repository/weather_repository.dart';
import 'package:get_it/get_it.dart';

/// getIt, inject, locator 어떤 변수 명으로 사용해도 상관 없다.
final GetIt locator = GetIt.instance;

initLocator() {
  /// 일반적인 의존성 주입 방식
  /// WeatherRepository의 WeatherRepositoryImplements 의존성 주입
  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRemoteRepository());
}
