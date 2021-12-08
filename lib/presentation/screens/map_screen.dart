import 'dart:async';

import 'package:airq_jyv/cubit/map/map_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  static const LatLng _center = LatLng(10.108407664998317, 76.18836671840292);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("AirQ Map"),),
            body: BlocConsumer<MapCubit, MapState>(
      listener: (context, state) {
        if (state is MapSuccess) {
          
        }
      },
      builder: (context, state) {
        return BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            if (state is MapSuccess) {
              
                state.dataList.forEach((element) {
                  _markers.add(Marker(
                    // This marker id can be anything that uniquely identifies each marker.
                    markerId: MarkerId(element.geo.id),
                    position: LatLng(element.geo.lat, element.geo.lng),
                    infoWindow: InfoWindow(
                      title: 'AQI ${element.aqi}',
                      snippet: element.safety,
                    ),
                    icon: BitmapDescriptor.defaultMarker,
                  ));
                });
              
              print(_markers.toString());
              return GoogleMap(
                markers: _markers,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _markers.elementAt(0).position,
                  zoom: 10.0,
                ),
              );
            }

            return const CircularProgressIndicator();
          },
        );
      },
    )));
  }
}
