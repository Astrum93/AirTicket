import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_ticket.g.dart';

@JsonSerializable()
class WeatherTicket {
  WeatherTicket({
    required this.stnId,
    required this.tm,
    required this.pa,
  });

  @JsonKey(name: 'stnId')
  String stnId;
  @JsonKey(name: 'tm')
  String tm;
  @JsonKey(name: 'pa')
  String pa;

  factory WeatherTicket.fromJson(Map<String, dynamic> json) =>
      _$WeatherTicketFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherTicketToJson(this);
}
