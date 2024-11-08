import 'package:airticket/domain/usecase/ticket_usecase.dart';
import 'package:airticket/presentation/make_ticket/model/weather_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeTicketController extends GetxController {
  final Rx<WeatherTicket> departure =
      WeatherTicket(stnId: '', tm: '', pa: '').obs;
  final Rx<WeatherTicket> arrival =
      WeatherTicket(stnId: '', tm: '', pa: '').obs;

  final Rx<TextEditingController> departureController =
      TextEditingController().obs;
  final Rx<TextEditingController> arrivalController =
      TextEditingController().obs;

  @override
  void dispose() {
    departureController.value.dispose();
    arrivalController.value.dispose();
    super.dispose();
  }

  /// SearchWeather 가져오기
  createTicket(stnId1, stnId2) async {
    departure.value = await CreateTicketUseCase().execute(stnId1);

    arrival.value = await CreateTicketUseCase().execute(stnId2);
  }
}
