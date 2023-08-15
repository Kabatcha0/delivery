import 'package:delivery/components/button_widget.dart';
import 'package:delivery/components/navigator.dart';
import 'package:delivery/components/text_from_field.dart';
import 'package:delivery/cubit/cubit.dart';
import 'package:delivery/cubit/states.dart';
import 'package:delivery/modules/package/package.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Order extends StatelessWidget {
  TextEditingController height = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController quantity = TextEditingController();

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
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Text(
                  "Provide more details about your parcel.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFromFieldWidget(null,
                    onTap: null,
                    text: "Height Of Package",
                    hint: "Height",
                    textEditingController: height, validator: (v) {
                  if (v!.isEmpty) {
                    return "Please Enter Ur Height";
                  }
                  return null;
                },
                    watch: false,
                    maxLine: 1,
                    textInputType: TextInputType.phone),
                const SizedBox(
                  height: 10,
                ),
                TextFromFieldWidget(null,
                    onTap: null,
                    text: "Width Of Package",
                    hint: "Width",
                    textEditingController: height, validator: (v) {
                  if (v!.isEmpty) {
                    return "Please Enter Ur Width";
                  }
                  return null;
                },
                    watch: false,
                    maxLine: 1,
                    textInputType: TextInputType.phone),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFromFieldWidget(null,
                          onTap: null,
                          text: "Weight Of Package",
                          hint: "Weight",
                          textEditingController: weight, validator: (v) {
                        if (v!.isEmpty) {
                          return "Please Enter Ur Weight";
                        }
                        return null;
                      },
                          watch: false,
                          maxLine: 1,
                          textInputType: TextInputType.phone),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFromFieldWidget(null,
                          onTap: null,
                          text: "Quantity Of Package",
                          hint: "Quantity",
                          textEditingController: quantity, validator: (v) {
                        if (v!.isEmpty) {
                          return "Please Enter Ur Quantity";
                        }
                        return null;
                      },
                          watch: false,
                          maxLine: 1,
                          textInputType: TextInputType.phone),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SelectableText(
                  "Please note: The driver will have a scale at hand to\nverify the weight of your package. If there is a\ndifference in the weight of the package,\nit may affect the delivery cost.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    navigator(context: context, widget: Package());
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
