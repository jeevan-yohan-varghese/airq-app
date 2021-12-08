import 'dart:io';

import 'package:airq_jyv/cubit/home/device_data_cubit.dart';
import 'package:airq_jyv/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeviceDataCubit>(create: (context) => DeviceDataCubit()),
      ],
      child: MaterialApp(
        title: 'AirQ JYV',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          appBarTheme: Platform.isAndroid
              ? const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarColor:
                      Colors.white, // navigation bar color
                  statusBarColor: Colors.white, // status bar color
                  statusBarBrightness: Brightness.dark, //status bar brigtness
                  statusBarIconBrightness:
                      Brightness.dark, //status barIcon Brightness
                  systemNavigationBarDividerColor:
                      Colors.grey, //Navigation bar divider color
                  systemNavigationBarIconBrightness:
                      Brightness.dark, //navigation bar icon
                ))
              : AppBarTheme(
                  backgroundColor: Colors.white,
                  systemOverlayStyle: SystemUiOverlayStyle.dark
                      .copyWith(statusBarBrightness: Brightness.dark)),
          brightness: Brightness.light,
          colorScheme: theme.colorScheme.copyWith(
              brightness: Brightness.light,
              secondary: const Color(0xff4CB5AE),
              primary: const Color(0xff5438DC)),
        ),
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
