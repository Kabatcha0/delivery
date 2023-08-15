import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';

class OtpWidget extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  Function(String?) func;
  bool autoFocus = false;

  OtpWidget({
    super.key,
    required this.func,
    required this.autoFocus,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: 55,
        child: Theme(
          data: ThemeData(
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: Color(Const.colorOfSplash))),
          child: TextFormField(
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            onChanged: func,
            controller: textEditingController,
            keyboardType: TextInputType.phone,
            cursorColor: Color(Const.colorOfSplash),
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: Colors.grey.shade600, width: 1.2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: Colors.grey.shade600, width: 1.2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: Color(Const.colorOfSplash), width: 1.2)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            ),
            style: const TextStyle(
                fontFamily: "Quicksand",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ));
  }
}
