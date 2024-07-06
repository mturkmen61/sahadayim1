import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  final LatLng? location;

  const GoogleMapsScreen({Key? key, this.location}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => GoogleMapsScreenState();
}

class GoogleMapsScreenState extends State<GoogleMapsScreen> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (widget.location != null) {
      _moveCamera(widget.location!);
    }
  }

  void _moveCamera(LatLng location) {
    mapController.animateCamera(CameraUpdate.newLatLng(location));
  }

  @override
  void didUpdateWidget(covariant GoogleMapsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.location != oldWidget.location && widget.location != null) {
      _moveCamera(widget.location!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: widget.location ?? const LatLng(45.521563, -122.677433),
          zoom: 12.5,
        ),
        compassEnabled: false,
        mapToolbarEnabled: false,
        rotateGesturesEnabled: false,
        scrollGesturesEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        tiltGesturesEnabled: false,
        myLocationButtonEnabled: false,
      ),
    );
  }
}
