part of 'map_cubit.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapSuccess extends MapState {
  final List<DeviceData> dataList;

  const MapSuccess({required this.dataList});
  @override
  List<Object> get props => [dataList];
}

class MapFailed extends MapState {
  final String error;

  const MapFailed({required this.error});
  @override
  List<Object> get props => [error];
}
