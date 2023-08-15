import 'package:delivery/components/button_widget.dart';
import 'package:delivery/components/navigator.dart';
import 'package:delivery/cubit/cubit.dart';
import 'package:delivery/cubit/states.dart';
import 'package:delivery/modules/delivered/delivered.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Picture extends StatelessWidget {
  const Picture({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DeliveryCubit.get(context);
        return Scaffold(
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
              children: [
                const Text(
                  "Take a picture of the item",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Please note: Please take picture close to a\nrecognisable object such as a chair, pen , etc.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 220,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.file(
                    cubit.file!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    cubit.imagePicker();
                  },
                  child: ButtonWidget(
                      color: Color(Const.colorOfSplash),
                      text: "Take another Picture",
                      font: 15),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    navigator(context: context, widget: Delivered());
                  },
                  child: ButtonWidget(
                      color: Color(Const.colorOfSplash),
                      text: "Sumbit",
                      font: 15),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
