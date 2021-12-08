import 'package:airq_jyv/data/helpers/get_device_data_resp.dart';
import 'package:airq_jyv/data/models/airq_data_model.dart';
import 'package:airq_jyv/data/repo/map_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial()){
    getLocationData(10.108407664998317, 76.1883680595074);
  }

  void getLocationData(double lat, double lng) async {
    emit(MapLoading());
    try {
      DeviceDataResponse dataResponse = await MapRepo().getDeviceData(lat, lng);
      emit(MapSuccess(
        dataList: dataResponse.dataList.reversed.toList(),
      ));
    } catch (e) {
      print(e.toString());
      emit(MapFailed(error: e.toString()));
    }
  }
}
