import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  final Location _locationController = Location();
  LatLng userLocation = const LatLng(37.4223, -122.0848);
  bool loading = true;
  late StreamSubscription<LocationData> _locationSubscription;
  bool _isMounted = true; // Flag to check widget's state

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationSubscription = _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (_isMounted &&
          currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          userLocation =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(userLocation);
          loading = false;
        });
      }
    });
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _isMounted = false; // Set the flag to false to prevent further setState
    _locationSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: userLocation,
                zoom: 13.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('current_location'),
                  position: userLocation,
                  icon: BitmapDescriptor.defaultMarker,
                ),
              },
              onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller)),
            ),
    );
  }
}
