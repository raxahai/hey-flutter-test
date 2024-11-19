import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final CameraPosition kStockholm = const CameraPosition(
    target: LatLng(59.3280654, 18.03183),
    zoom: 17,
  );

  final CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  final Completer<GoogleMapController> completer = Completer();

  var isLoading = false;
  double latitude = 59.3280654;
  double longitude = 18.03183;

  final markerId = const MarkerId('mylocation');

  void onTapGoogleMaps(LatLng latLng) {
    latitude = latLng.latitude;
    longitude = latLng.longitude;
    update();
  }

  Future<void> goToTheLake() async {
    final GoogleMapController controller = await completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }
}
