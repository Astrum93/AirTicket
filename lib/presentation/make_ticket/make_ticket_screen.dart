import 'package:airticket/presentation/home/common/nation_code.dart';
import 'package:airticket/presentation/make_ticket/controller/make_ticket_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/input_card.dart';

class MakeTicketScreen extends GetView<MakeTicketController> {
  const MakeTicketScreen({super.key});

  final String _sun = 'https://img.icons8.com/emoji/96/sun-emoji.png';
  final String _cloud = 'https://img.icons8.com/emoji/96/cloud-emoji.png';
  final String _rain =
      'https://img.icons8.com/emoji/96/cloud-with-rain-emoji.png';
  final String _temp = 'https://img.icons8.com/emoji/96/thermometer-emoji.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text('티켓 만들기'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            InputCard(
              name: '출발지',
              textEditingController: controller.departureController.value,
            ),
            const SizedBox(height: 30),
            InputCard(
              name: '도착지',
              textEditingController: controller.arrivalController.value,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: nationCode.length,
                  itemBuilder: (context, index) {
                    return Text(
                        '${nationCode.entries.elementAt(index).value} : ${nationCode.entries.elementAt(index).key}');
                  }),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () async {
                if (controller.departureController.value.text.isEmpty ||
                    controller.arrivalController.value.text.isEmpty) {
                  return;
                }
                await controller.createTicket(
                  controller.departureController.value.text,
                  controller.arrivalController.value.text,
                );
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 4, color: Colors.deepPurple.shade100),
                    borderRadius: BorderRadius.circular(24)),
                child: Center(
                  child: Icon(
                    Icons.search,
                    size: 50,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),

            /// 티켓
            Obx(() {
              return controller.departure.value.stnId.isEmpty ||
                      controller.arrival.value.stnId.isEmpty
                  ? const SizedBox()
                  : AnimatedOpacity(
                      opacity: controller.departure.value.stnId.isEmpty ||
                              controller.arrival.value.stnId.isEmpty
                          ? 0
                          : 1,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// 출발지
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  nationCode[controller.departure.value.stnId],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                    '${controller.departure.value.tm.substring(8, 10)}시 ${controller.departure.value.tm.substring(10, 12)}분'),
                                CachedNetworkImage(
                                  imageUrl: (double.parse(
                                                  controller.departure.value.pa)
                                              .ceil()) <
                                          800
                                      ? _rain
                                      : (double.parse(controller
                                                      .departure.value.pa)
                                                  .ceil()) <
                                              1013
                                          ? _cloud
                                          : _sun,
                                  scale: 2,
                                ),
                                Text(
                                  (double.parse(controller.departure.value.pa)
                                              .ceil()) <
                                          800
                                      ? '비'
                                      : (double.parse(controller
                                                      .departure.value.pa)
                                                  .ceil()) <
                                              1013
                                          ? '흐림'
                                          : '맑음',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_right,
                              size: 60,
                            ),

                            /// 도착지
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  nationCode[controller.arrival.value.stnId],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                    '${controller.arrival.value.tm.substring(8, 10)}시 ${controller.arrival.value.tm.substring(10, 12)}분'),
                                CachedNetworkImage(
                                  imageUrl:
                                      (double.parse(controller.arrival.value.pa)
                                                  .ceil()) <
                                              800
                                          ? _rain
                                          : (double.parse(controller
                                                          .arrival.value.pa)
                                                      .ceil()) <
                                                  1013
                                              ? _cloud
                                              : _sun,
                                  scale: 2,
                                ),
                                Text(
                                  (double.parse(controller.arrival.value.pa)
                                              .ceil()) <
                                          800
                                      ? '비'
                                      : (double.parse(controller
                                                      .arrival.value.pa)
                                                  .ceil()) <
                                              1013
                                          ? '흐림'
                                          : '맑음',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
            }),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
