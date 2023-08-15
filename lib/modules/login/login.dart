import 'package:delivery/components/button_widget.dart';
import 'package:delivery/components/navigator.dart';
import 'package:delivery/components/text_from_field.dart';
import 'package:delivery/modules/home/home.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: form,
              child: Column(
                children: [
                  SizedBox(
                    width: 110,
                    height: 110,
                    child: Image.asset("assets/splash.png"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Welcome To",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "SKID",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFromFieldWidget(null,
                      onTap: null,
                      text: "Name",
                      hint: "Name",
                      textEditingController: name, validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter Ur Name";
                    }
                    return null;
                  },
                      watch: false,
                      maxLine: 1,
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFromFieldWidget(null,
                      onTap: null,
                      text: "Email",
                      hint: "Email",
                      textEditingController: email, validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter Ur Password";
                    }
                    return null;
                  },
                      watch: false,
                      maxLine: 1,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorReplacement(
                          context: context, widget: const Home());
                    },
                    child: ButtonWidget(
                        color: Color(Const.colorOfSplash),
                        text: "Continue",
                        font: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 0.7,
                        color: Colors.grey[300],
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 0.7,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonWidget(
                      color: Colors.grey.shade300,
                      text: "Continue With Google",
                      font: 15)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
