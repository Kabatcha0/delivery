import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';

class TextFromFieldWidget extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  String text;
  String hint;
  Function()? onTap;
  IconData? iconData;
  bool watch;
  String? Function(String?)? validator;
  TextInputType textInputType;
  int maxLine = 1;
  TextFromFieldWidget(this.iconData,
      {super.key,
      required this.onTap,
      required this.text,
      required this.hint,
      required this.textEditingController,
      required this.validator,
      required this.watch,
      required this.maxLine,
      required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          maxLines: 1,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6,
        ),
        Theme(
          data: ThemeData(
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: Color(Const.colorOfSplash))),
          child: TextFormField(
            validator: validator,
            controller: textEditingController,
            keyboardType: textInputType,
            maxLines: maxLine,
            obscureText: watch,
            cursorColor: Color(Const.colorOfSplash),
            decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 0.4)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 0.4)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Color(Const.colorOfSplash), width: 0.4)),
                suffixIcon: InkWell(
                    onTap: onTap,
                    child: Icon(
                      iconData,
                      size: 24,
                      color: Colors.grey[600],
                    )),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                hintText: hint,
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[600])),
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        )
      ],
    );
  }
}
