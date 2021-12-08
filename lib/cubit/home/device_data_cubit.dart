import 'package:airq_jyv/data/helpers/get_device_data_resp.dart';
import 'package:airq_jyv/data/models/airq_data_model.dart';
import 'package:airq_jyv/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'device_data_state.dart';

class DeviceDataCubit extends Cubit<DeviceDataState> {
  DeviceDataCubit() : super(DeviceDataInitial());

  void getDeviceData(String deviceId) async {
    emit(DeviceDataLoading());
    try {
      DeviceDataResponse dataResponse =
          await HomeRepo().getDeviceData(deviceId);
      emit(DeviceDataSuccess(
        dataList: dataResponse.dataList.reversed.toList(),
      ));
    } catch (e) {
      print(e.toString());
      emit(DeviceDataFailed(error: e.toString()));
    }
  }
}
