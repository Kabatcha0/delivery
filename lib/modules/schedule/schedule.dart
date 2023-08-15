import 'dart:developer';

import 'package:delivery/components/button_widget.dart';
import 'package:delivery/components/navigator.dart';
import 'package:delivery/cubit/cubit.dart';
import 'package:delivery/cubit/states.dart';
import 'package:delivery/modules/vehicle/vehicle.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      builder: (context, state) {
        var cubit = DeliveryCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Cancel Order",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Schedule a pickup time:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (v) {
                        String val = v.toString();
                        log(val);
                      }),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    navigator(context: context, widget: const Vehicle());
                  },
                  child: ButtonWidget(
                      color: Color(Const.colorOfSplash),
                      text: "Next",
                      font: 15),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
