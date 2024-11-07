// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      stnId: json['stnId'] as String,
      tm: json['tm'] as String,
      pa: json['pa'] as String == '-999.0' || json['pa'] as String == '-999'
          ? 'null'
          : json['pa'],
      hm: json['hm'] as String == '-999.0' || json['hm'] as String == '-999'
          ? 'null'
          : json['hm'],
      ta: json['ta'] as String == '-999.0' || json['ta'] as String == '-999'
          ? 'null'
          : json['ta'],
      td: json['td'] as String == '-999.0' || json['td'] as String == '-999'
          ? 'null'
          : json['td'],
      wd: json['wd'] as String == '-999.0' || json['wd'] as String == '-999'
          ? 'null'
          : json['wd'],
      ws: json['ws'] as String == '-999.0' || json['ws'] as String == '-999'
          ? 'null'
          : json['ws'],
      lat: json['lat'] as String == '-999.0' || json['lat'] as String == '-999'
          ? 'null'
          : json['lat'],
      lon: json['lon'] as String == '-999.0' || json['lon'] as String == '-999'
          ? 'null'
          : json['lon'],
      ps: json['ps'] as String == '-999.0' || json['ps'] as String == '-999'
          ? 'null'
          : json['ps'],
      vs: json['vs'] as String == '-999.0' || json['vs'] as String == '-999'
          ? 'null'
          : json['vs'],
      tca: json['tca'] as String == '-999.0' || json['tca'] as String == '-999'
          ? 'null'
          : json['tca'],
      rn: json['rn'] as String == '-999.0' || json['rn'] as String == '-999'
          ? 'null'
          : json['rn'],
      rnWrchHr: json['rnWrchHr'] as String == '-999.0' ||
              json['rnWrchHr'] as String == '-999'
          ? 'null'
          : json['rnWrchHr'],
      maxTa: json['maxTa'] as String == '-999.0' ||
              json['maxTa'] as String == '-999'
          ? 'null'
          : json['maxTa'],
      minTa: json['minTa'] as String == '-999.0' ||
              json['minTa'] as String == '-999'
          ? 'null'
          : json['minTa'],
      sd: json['sd'] as String == '-999.0' || json['sd'] as String == '-999'
          ? 'null'
          : json['sd'],
      hr24Rn: json['hr24Rn'] as String == '-999.0' ||
              json['hr24Rn'] as String == '-999'
          ? 'null'
          : json['hr24Rn'],
      hr1Rn: json['hr1Rn'] as String == '-999.0' ||
              json['hr1Rn'] as String == '-999'
          ? 'null'
          : json['hr1Rn'],
      hr3Rn: json['hr3Rn'] as String == '-999.0' ||
              json['hr3Rn'] as String == '-999'
          ? 'null'
          : json['hr3Rn'],
      hr6Rn: json['hr6Rn'] as String == '-999.0' ||
              json['hr6Rn'] as String == '-999'
          ? 'null'
          : json['hr6Rn'],
      minCh: json['minCh'] as String == '-999.0' ||
              json['minCh'] as String == '-999'
          ? 'null'
          : json['minCh'],
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'stnId': instance.stnId,
      'tm': instance.tm,
      'pa': instance.pa,
      'hm': instance.hm,
      'ta': instance.ta,
      'td': instance.td,
      'wd': instance.wd,
      'ws': instance.ws,
      'lat': instance.lat,
      'lon': instance.lon,
      'ps': instance.ps,
      'vs': instance.vs,
      'tca': instance.tca,
      'rn': instance.rn,
      'rnWrchHr': instance.rnWrchHr,
      'maxTa': instance.maxTa,
      'minTa': instance.minTa,
      'sd': instance.sd,
      'hr24Rn': instance.hr24Rn,
      'hr1Rn': instance.hr1Rn,
      'hr3Rn': instance.hr3Rn,
      'hr6Rn': instance.hr6Rn,
      'minCh': instance.minCh,
    };
