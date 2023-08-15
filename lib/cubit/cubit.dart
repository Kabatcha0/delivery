import 'dart:developer';
import 'dart:io';

import 'package:delivery/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(DeliveryInitialState());
  static DeliveryCubit get(context) => BlocProvider.of(context);
  List<String> images = [
    "assets/Pizza.png",
    "assets/Package.png",
    "assets/ShoppingCart.png"
  ];
  List<String> text = ["Pizza", "Parcel", "Groceries"];
  List<String> size = [
    "(less than 10 kg)",
    "(less than 10 kg)",
    "(less than 10 kg)"
  ];
  File? file;
  void imagePicker() {
    emit(DeliveryImagePickerLoadingState());
    ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery)
        .then((value) {
      if (value != null) {
        file = File(value.path);
        emit(DeliveryImagePickerSuccessState());
      } else {
        return;
      }
    }).catchError((e) {
      log(e.toString());
    });
  }

  List<bool> change = [true, false, false, false];
  void changeVehicle(int index) {
    change.clear();
    for (int i = 3; i >= 0; --i) {
      change.add(false);
    }
    change.insert(index, true);
    emit(DeliveryChangeSuccessState());
  }
}
