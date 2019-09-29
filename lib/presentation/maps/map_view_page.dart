import 'package:chyc_sie_roboty/presentation/home/home_app_bar.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewPage extends StatefulWidget {
  @override
  _MapViewPageState createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  @override
  Widget build(BuildContext context) {
    return _buildView("Test", _buildMap());
  }

  Widget _buildMap() {
    GoogleMapController mapController;
    Set<Marker> markers = Set.of([
      Marker(
        position: LatLng(50.270908, 19.039993),
        markerId: MarkerId("1"),
      ),
      Marker(
        position: LatLng(50.2518805, 19.0065477),
        markerId: MarkerId("2"),
      ),
      Marker(
        position: LatLng(50.2588496, 19.0144857),
        markerId: MarkerId("3"),
      )
    ]);

    return GoogleMap(
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
      mapToolbarEnabled: true,
      initialCameraPosition: CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(50.270908, 19.039993),
          tilt: 5.440717697143555,
          zoom: 15.151926040649414),
    );
  }
}

Widget _buildView(String userName, Widget contentView) => Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HomeAppBar(userName: userName),
            Expanded(child: contentView),
          ],
        ),
      ),
    );
