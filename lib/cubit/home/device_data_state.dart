part of 'device_data_cubit.dart';

abstract class DeviceDataState extends Equatable {
  const DeviceDataState();

  @override
  List<Object> get props => [];
}

class DeviceDataInitial extends DeviceDataState {}

class DeviceDataLoading extends DeviceDataState {}

class DeviceDataSuccess extends DeviceDataState {
  final List<DeviceData> dataList;
  const DeviceDataSuccess({required this.dataList});
  @override
  List<Object> get props => [dataList];
}

class DeviceDataFailed extends DeviceDataState {
  final String error;

  const DeviceDataFailed({required this.error});
  @override
  List<Object> get props => [error];
}
