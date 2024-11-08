// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherTicket _$WeatherTicketFromJson(Map<String, dynamic> json) =>
    WeatherTicket(
      stnId: json['stnId'] as String,
      tm: json['tm'] as String,
      pa: json['pa'] as String,
    );

Map<String, dynamic> _$WeatherTicketToJson(WeatherTicket instance) =>
    <String, dynamic>{
      'stnId': instance.stnId,
      'tm': instance.tm,
      'pa': instance.pa,
    };
