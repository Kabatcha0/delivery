import 'package:delivery/components/button_widget.dart';
import 'package:delivery/components/navigator.dart';
import 'package:delivery/cubit/cubit.dart';
import 'package:delivery/cubit/states.dart';
import 'package:delivery/modules/picture/picture.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TakePicture extends StatelessWidget {
  const TakePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {},
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  "Please note: Take picture of your parcel close to a\nrecognisable object such as a chair, pen , etc.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 15,
                ),
                containerOfExample(text: "", image: "assets/example2.png"),
                const SizedBox(
                  height: 10,
                ),
                containerOfExample(
                    image: "assets/example1.png", text: "Example 2"),
                Text(
                  "If you do not follow this instruction, your order\nrequest will not be valid",
                  style: TextStyle(
                      color: Color(Const.colorOfSplash),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (cubit.file == null) {
                      cubit.imagePicker();
                    }
                    if (cubit.file != null) {
                      navigator(context: context, widget: const Picture());
                    }
                  },
                  child: cubit.file == null
                      ? ButtonWidget(
                          color: Color(Const.colorOfSplash),
                          text: "Take a Picture",
                          font: 15)
                      : ButtonWidget(
                          color: Color(Const.colorOfSplash),
                          text: "Next",
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

Widget containerOfExample({
  required String image,
  required String text,
}) {
  return Container(
    alignment: Alignment.center,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    width: double.infinity,
    height: 220,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
