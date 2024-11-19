import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_task/app/features/map/controller/map_controller.dart';
import 'package:test_task/app/widgets/custom_app_bar.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapController(),
        builder: (mapController) {
          return PopScope(
            canPop: false,
            child: Scaffold(
              appBar: CustomAppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text("Google Maps"),
              ),
              body: SafeArea(
                child: GoogleMap(
                  zoomControlsEnabled: true,
                  onTap: mapController.onTapGoogleMaps,
                  markers: <Marker>{
                    Marker(
                      draggable: true,
                      markerId: mapController.markerId,
                      position: LatLng(
                          mapController.latitude, mapController.longitude),
                    )
                  },
                  mapType: MapType.hybrid,
                  initialCameraPosition: mapController.kStockholm,
                  onMapCreated:
                      (GoogleMapController googleMapController) async {
                    mapController.completer.complete(googleMapController);
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: mapController.goToTheLake,
                label: const Text('To the lake!'),
                icon: const Icon(Icons.directions_boat),
              ),
            ),
          );
        });
  }
}
