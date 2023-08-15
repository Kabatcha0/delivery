import 'package:delivery/cubit/cubit.dart';
import 'package:delivery/cubit/states.dart';
import 'package:delivery/modules/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryCubit(),
      child: BlocConsumer<DeliveryCubit, DeliveryState>(
        builder: (context, state) => const MaterialApp(
          title: 'Delivery',
          home: Splash(),
          debugShowCheckedModeBanner: false,
        ),
        listener: (context, state) {},
      ),
    );
  }
}
