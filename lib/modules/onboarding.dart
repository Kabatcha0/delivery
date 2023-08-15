import 'package:delivery/components/navigator.dart';
import 'package:delivery/components/otp_widget.dart';
import 'package:delivery/modules/login/login.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController otpOne = TextEditingController();
  TextEditingController otpTwo = TextEditingController();
  TextEditingController otpThree = TextEditingController();
  TextEditingController otpFour = TextEditingController();
  TextEditingController otpFive = TextEditingController();
  TextEditingController otpSex = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/onBoarding.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 60,
            height: 100,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.black),
            alignment: Alignment.topCenter,
            child: Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).showBottomSheet(
                      (context) => textEditingController.text.length != 10
                          ? Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 2.2,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Enter Phone Number",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Mobile Number",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    TextFieldWidget(
                                        textInputType: TextInputType.phone,
                                        controller: textEditingController,
                                        text: "0000000")
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 2,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        textEditingController.text = "";
                                      },
                                      child: Text(
                                        "change Phone Number",
                                        style: TextStyle(
                                            color: Color(Const.colorOfSplash),
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "Confirm OTP",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "A OTP has been sent to  +20${textEditingController.text}\nKind enter below the 6 digit code.",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        OtpWidget(
                                            func: (v) {
                                              if (v!.length == 1) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            autoFocus: true,
                                            textEditingController: otpOne),
                                        OtpWidget(
                                            func: (v) {
                                              if (v!.length == 1) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            autoFocus: false,
                                            textEditingController: otpTwo),
                                        OtpWidget(
                                            func: (v) {
                                              if (v!.length == 1) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            autoFocus: false,
                                            textEditingController: otpThree),
                                        OtpWidget(
                                            func: (v) {
                                              if (v!.length == 1) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            autoFocus: false,
                                            textEditingController: otpFour),
                                        OtpWidget(
                                            func: (v) {
                                              if (v!.length == 1) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            autoFocus: false,
                                            textEditingController: otpFive),
                                        OtpWidget(
                                            func: (v) {
                                              if (v!.length == 1) {
                                                navigator(
                                                    context: context,
                                                    widget: Login());
                                              } else {
                                                FocusScope.of(context)
                                                    .previousFocus();
                                              }
                                            },
                                            autoFocus: false,
                                            textEditingController: otpSex),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(Const.colorOfSplash),
                      boxShadow: [
                        BoxShadow(
                            color: Color(Const.colorOfSplash),
                            spreadRadius: 4,
                            blurRadius: 1)
                      ]),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              );
            }),
          )
        ],
      )),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String? text;
  TextInputType textInputType;
  TextFieldWidget(
      {super.key,
      required this.textInputType,
      required this.controller,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[350],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/flag.png"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                    size: 23,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "+20",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 0.3,
                    height: 40,
                    color: Colors.black,
                  )
                ],
              ),
              Expanded(
                  child: TextFormField(
                controller: controller,
                keyboardType: textInputType,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsetsDirectional.only(start: 4),
                    hintText: text,
                    hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            color: Color(Const.colorOfSplash),
            width: double.infinity,
            height: 1,
          ),
        )
      ],
    );
  }
}
