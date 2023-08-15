import 'package:delivery/components/button_widget.dart';
import 'package:delivery/components/navigator.dart';
import 'package:delivery/components/text_from_field.dart';
import 'package:delivery/cubit/cubit.dart';
import 'package:delivery/modules/onboarding.dart';
import 'package:delivery/modules/schedule/schedule.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/states.dart';

class Delivered extends StatelessWidget {
  TextEditingController postCode = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController streetTwo = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController reciever = TextEditingController();
  TextEditingController phone = TextEditingController();

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
                      "Where is the package\nbeing delivered to ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFromFieldWidget(null,
                        onTap: () {},
                        text: "Enter PostCode",
                        hint: "Reciever",
                        textEditingController: postCode,
                        validator: (v) {},
                        watch: false,
                        maxLine: 1,
                        textInputType: TextInputType.phone),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFromFieldWidget(null,
                        onTap: () {},
                        text: "Street Adress",
                        hint: "Reciever",
                        textEditingController: street,
                        validator: (v) {},
                        watch: false,
                        maxLine: 1,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFromFieldWidget(null,
                        onTap: () {},
                        text: "Street Adress 1",
                        hint: "Reciever",
                        textEditingController: streetTwo,
                        validator: (v) {},
                        watch: false,
                        maxLine: 1,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFromFieldWidget(null,
                        onTap: () {},
                        text: "City/Town",
                        hint: "City",
                        textEditingController: city,
                        validator: (v) {},
                        watch: false,
                        maxLine: 1,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFromFieldWidget(null,
                        onTap: () {},
                        text: "Name Reciever",
                        hint: "Reciever",
                        textEditingController: reciever,
                        validator: (v) {},
                        watch: false,
                        maxLine: 1,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Phone Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        textInputType: TextInputType.phone,
                        controller: phone,
                        text: "Reciever Phone Number"),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.file(
                        cubit.file!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigator(context: context, widget: const Schedule());
                      },
                      child: ButtonWidget(
                          color: Color(Const.colorOfSplash),
                          text: "Next",
                          font: 15),
                    )
                  ],
                ),
              ),
            ));
      },
      listener: (context, state) {},
    );
  }
}
