import 'package:airticket/data/repository/weather_remote_repository.dart';
import 'package:airticket/presentation/make_ticket/model/weather_ticket.dart';

import 'base.dart';

class CreateTicketUseCase implements UseCase<void, String> {
  final WeatherRemoteRepository _repository = WeatherRemoteRepository();

  CreateTicketUseCase([WeatherRemoteRepository? repository]);

  @override
  Future<WeatherTicket> execute(String stnId) {
    return _repository.getSearchWeatherTicket(stnId);
  }
}
