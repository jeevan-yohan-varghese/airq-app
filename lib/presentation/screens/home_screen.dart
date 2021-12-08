import 'package:airq_jyv/cubit/home/device_data_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController deviceIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "AirQ Monitoring",
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 16),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xffeeeeee),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: "Enter device id", border: InputBorder.none),
                      controller: deviceIdController,
                    ),
                  )),
                  InkWell(
                    onTap: () {
                      if (deviceIdController.text.trim().isNotEmpty) {
                        BlocProvider.of<DeviceDataCubit>(context)
                            .getDeviceData(deviceIdController.text.trim());
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xff5158BB),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {}, child: const Text("Air quality near me")),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<DeviceDataCubit, DeviceDataState>(
              builder: (context, state) {
                if (state is DeviceDataSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.dataList.length,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: const Color(0xffF4F4F4)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, top: 16),
                                      child: Text(getLocalTime(
                                          state.dataList[position].timeStamp)),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Text(
                                        "AQI ${state.dataList[position].aqi.toString()}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 28),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Text(
                                        state.dataList[position].safety,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5)),
                                          color: getColor(
                                              state.dataList[position].colorCode)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
      
                if (state is DeviceDataLoading) {
                  return const CircularProgressIndicator();
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    ));
  }

  Color getColor(String clr) {
    switch (clr) {
      case "Maroon":
        return Colors.red[900] ?? Colors.red;
      case "Purple":
        return Colors.purple;
      case "Red":
        return Colors.red;
      case "Orange":
        return Colors.orange;
      case "Yellow":
        return Colors.yellow;
      case "Green":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String getLocalTime(String iso) {
    return DateFormat("dd-MMM-yyyy hh:mm aaa")
        .format(DateTime.parse(iso).toLocal());
  }
}
