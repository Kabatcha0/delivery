import 'package:delivery/cubit/cubit.dart';
import 'package:delivery/cubit/states.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Vehicle extends StatelessWidget {
  const Vehicle({super.key});

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select a Vehicle Type:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        cubit.changeVehicle(0);
                      },
                      child: container(
                          change: cubit.change[0],
                          image: "assets/vehicleOne.png",
                          type: "Bicycle Delivery",
                          money: "\$16.00",
                          deliveryTo: "60 mins to deliver")),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.changeVehicle(1);
                    },
                    child: container(
                        change: cubit.change[1],
                        image: "assets/vehicleTwo.png",
                        type: "Motorbike Delivery",
                        money: "\$20.00",
                        deliveryTo: "60 mins to deliver"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.changeVehicle(2);
                    },
                    child: container(
                        change: cubit.change[2],
                        image: "assets/carOne.png",
                        type: "car Delivery",
                        money: "\$34.00",
                        deliveryTo: "60 mins to deliver"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.changeVehicle(3);
                    },
                    child: container(
                        change: cubit.change[3],
                        image: "assets/carTwo.png",
                        type: "car-van Delivery",
                        money: "\$60.00",
                        deliveryTo: "60 mins to deliver"),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

Widget container({
  required bool change,
  required String image,
  required String type,
  required String money,
  required String deliveryTo,
}) {
  return Container(
    width: double.infinity,
    height: 140,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: change ? Color(Const.colorOfSplash) : Colors.grey,
            width: 1.1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: change ? Color(Const.colorOfSplash) : Colors.grey),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 150,
          width: 150,
          child: Image.asset(image),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(""),
            Text(
              type,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              money,
              style: TextStyle(
                  color: Color(Const.colorOfSplash),
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            const Text(
              "60 mins to deliver",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            Text(""),
          ],
        )
      ],
    ),
  );
}
