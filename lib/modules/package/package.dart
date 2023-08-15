import 'package:delivery/components/button_widget.dart';
import 'package:delivery/components/navigator.dart';
import 'package:delivery/components/text_from_field.dart';
import 'package:delivery/cubit/cubit.dart';
import 'package:delivery/cubit/states.dart';
import 'package:delivery/modules/take_picture/take_picture.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Package extends StatelessWidget {
  TextEditingController package = TextEditingController();
  TextEditingController note = TextEditingController();

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
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Text(
                  "What is in the package ?",
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
                    text: "What is in the Package ?",
                    hint: "What is in the Package ?",
                    textEditingController: package, validator: (v) {
                  if (v!.isEmpty) {
                    return "Please Enter Ur Package";
                  }
                  return null;
                }, watch: false, maxLine: 1, textInputType: TextInputType.name),
                const SizedBox(
                  height: 10,
                ),
                TextFromFieldWidget(null,
                    onTap: null,
                    text: "Additional Note (Optional)",
                    hint: "Note",
                    textEditingController: note, validator: (v) {
                  if (v!.isEmpty) {
                    return "Please Enter Ur Note";
                  }
                  return null;
                }, watch: false, maxLine: 4, textInputType: TextInputType.name),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    navigator(context: context, widget: const TakePicture());
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
