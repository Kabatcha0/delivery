import 'package:delivery/components/navigator.dart';
import 'package:delivery/cubit/cubit.dart';
import 'package:delivery/cubit/states.dart';
import 'package:delivery/modules/order/order.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      builder: (context, state) {
        var cubit = DeliveryCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "Hi",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "JOSH",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "What are you sending today ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 10.1,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        navigator(context: context, widget: Order());
                      },
                      child: card(
                          image: cubit.images[index],
                          text: cubit.text[index],
                          size: cubit.size[index]),
                    ),
                    itemCount: 3,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: Color(Const.colorOfSplash),
              )
            ],
          )),
        );
      },
      listener: (context, state) {},
    );
  }
}

Widget card({
  required String image,
  required String text,
  required String size,
}) {
  return Container(
    height: 190,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(image),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              size,
              style: TextStyle(
                  color: Color(Const.colorOfSplash),
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    ),
  );
}
