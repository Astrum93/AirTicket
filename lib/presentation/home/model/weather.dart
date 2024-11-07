import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather({
    required this.stnId,
    required this.tm,
    required this.pa,
    required this.hm,
    required this.ta,
    required this.td,
    required this.wd,
    required this.ws,
    required this.lat,
    required this.lon,
    required this.ps,
    required this.vs,
    required this.tca,
    required this.rn,
    required this.rnWrchHr,
    required this.maxTa,
    required this.minTa,
    required this.sd,
    required this.hr24Rn,
    required this.hr1Rn,
    required this.hr3Rn,
    required this.hr6Rn,
    required this.minCh,
  });

  @JsonKey(name: 'stnId')
  String stnId;
  @JsonKey(name: 'tm')
  String tm;
  @JsonKey(name: 'pa')
  String pa;
  @JsonKey(name: 'hm')
  String hm;
  @JsonKey(name: 'ta')
  String ta;
  @JsonKey(name: 'td')
  String td;
  @JsonKey(name: 'wd')
  String wd;
  @JsonKey(name: 'ws')
  String ws;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lon')
  String lon;
  @JsonKey(name: 'ps')
  String ps;
  @JsonKey(name: 'vs')
  String vs;
  @JsonKey(name: 'tca')
  String tca;
  @JsonKey(name: 'rn')
  String rn;
  @JsonKey(name: 'rnWrchHr')
  String rnWrchHr;
  @JsonKey(name: 'maxTa')
  String maxTa;
  @JsonKey(name: 'minTa')
  String minTa;
  @JsonKey(name: 'sd')
  String sd;
  @JsonKey(name: 'hr24Rn')
  String hr24Rn;
  @JsonKey(name: 'hr1Rn')
  String hr1Rn;
  @JsonKey(name: 'hr3Rn')
  String hr3Rn;
  @JsonKey(name: 'hr6Rn')
  String hr6Rn;
  @JsonKey(name: 'minCh')
  String minCh;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
