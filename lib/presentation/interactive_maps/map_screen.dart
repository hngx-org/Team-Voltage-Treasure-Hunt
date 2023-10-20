import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:math';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LocationData? currentLocation;
  LatLng destinationLocation = LatLng(31.48345, 74.2944);
  double circleRadius = 200;

  Set<Marker> markers = {};
  Set<Circle> circles = {};
  StreamSubscription<LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    Location location = Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        print("Location services are not available.");
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission != PermissionStatus.granted) {
      if (await location.requestPermission() != PermissionStatus.granted) {
        print("Location permissions are denied.");
        return;
      }
    }

    try {
      currentLocation = await location.getLocation();
      addCurrentLocMarker(currentLocation!);
      _locationSubscription = location.onLocationChanged.listen((newLoc) {
        setState(() {
          currentLocation = newLoc;
          addCurrentLocMarker(newLoc);

          var distanceBetween = haversineDistance(
              LatLng(newLoc.latitude!, newLoc.longitude!), destinationLocation);
          print('Distance between: $distanceBetween');
          if (distanceBetween < circleRadius) {
            print('User reached the destination');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'You reached the location',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        });
      });
    } catch (e) {
      print("Error obtaining location: $e");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _locationSubscription?.cancel();
  }

  void addCurrentLocMarker(LocationData locationData) {
    Marker currentLocMarker = Marker(
      markerId: MarkerId('currentLocation'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(locationData.latitude!, locationData.longitude!),
      infoWindow: InfoWindow(
        title: 'Current Location',
        snippet: 'My location',
      ),
      onTap: () {
        print('Current location tapped');
      },
    );
    markers.add(currentLocMarker);
  }
  double haversineDistance(LatLng player1, LatLng player2) {
    double lat1 = player1.latitude;
    double lon1 = player1.longitude;
    double lat2 = player2.latitude;
    double lon2 = player2.longitude;

    var R = 6371e3; // meters
    var phi1 = (lat1 * pi) / 180;
    var phi2 = (lat2 * pi) / 180;
    var deltaPhi = ((lat2 - lat1) * pi) / 180;
    var deltaLambda = ((lon2 - lon1) * pi) / 180;

    var a = sin(deltaPhi / 2) * sin(deltaPhi / 2) +
        cos(phi1) * cos(phi2) * sin(deltaLambda / 2) * sin(deltaLambda / 2);

    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c; // in meters

    return d;
  }

  void goToCurrentLocation() {
    if (currentLocation != null && mapController != null) {
      mapController!.animateCamera(CameraUpdate.newLatLng(
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation?.latitude ?? 0.0, currentLocation?.longitude ?? 0.0),
          zoom: 13,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          circles.add(Circle(
            circleId: CircleId('geo_fence_1'),
            center: destinationLocation,
            radius: circleRadius,
            strokeWidth: 2,
            strokeColor: Colors.green,
            fillColor: Colors.green.withOpacity(0.15),
          ));
        },
        markers: markers,
        circles: circles,
      ),
  floatingActionButton: Container(
  margin: EdgeInsets.only(bottom: 0.0, right: 35.0),
  child: FloatingActionButton(
    mini: true,
    onPressed: goToCurrentLocation,
    child: Icon(Icons.location_searching),
  ),
)
    );
  }
}
