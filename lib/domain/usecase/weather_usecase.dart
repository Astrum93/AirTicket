import 'package:airticket/common/di/di.dart';
import 'package:airticket/data/repository/weather_remote_repository.dart';
import 'package:airticket/domain/usecase/base.dart';
import 'package:airticket/presentation/home/model/weather.dart';

/// CRUD
// class WeatherUseCase {
//   /// CRUD
/// 이렇게 구현하지 않는 이유는 Controller와 1:1 매핑이 되기 때문
/// 굳이 이렇게 하지 않고 Controller에서 직접 구현하면 된다.(불필요)
// }

/// UseCase를 feature 단위 class로 선언
/// C
class AddWeatherUseCase implements UseCase<void, Weather> {
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  // final WeatherRemoteRepository _repository = locator();
  final WeatherRemoteRepository _repository;

  /// 이렇게 DI를 해주는 이유는 Test에 용이하기 때문
  /// repository가 없다면 DI로 주입 시켜주겠다는 코드
  AddWeatherUseCase([WeatherRemoteRepository? repository])
      : _repository = repository ?? locator();

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<void> execute(Weather params) {
    return _repository.addWeatherList(params);
  }
}

/// R
class ReadWeatherUseCase implements UseCase<void, Weather> {
  final WeatherRemoteRepository _repository = WeatherRemoteRepository();

  ReadWeatherUseCase([WeatherRemoteRepository? repository]);

  @override
  Future<List<Weather>> execute([Weather? params]) {
    return _repository.getWeatherList();
  }
}

/// U
class UpdateWeatherUseCase implements UseCase<void, Weather> {
  final WeatherRemoteRepository _repository = WeatherRemoteRepository();

  UpdateWeatherUseCase([WeatherRemoteRepository? repository]);

  @override
  Future<void> execute(Weather params) {
    return _repository.updateWeatherList(params);
  }
}

/// D
class DeleteWeatherUseCase implements UseCase<void, Weather> {
  final WeatherRemoteRepository _repository = WeatherRemoteRepository();

  DeleteWeatherUseCase([WeatherRemoteRepository? repository]);

  @override
  Future<void> execute(Weather params) {
    return _repository.deleteWeatherList();
  }
}

/// Search
class SearchWeatherUseCase implements UseCase<void, String> {
  final WeatherRemoteRepository _repository = WeatherRemoteRepository();

  SearchWeatherUseCase([WeatherRemoteRepository? repository]);

  @override
  Future<void> execute(String stnId) {
    return _repository.getSearchWeatherList(stnId);
  }
}
