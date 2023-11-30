import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_first_project/app_styles.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: 'Maps Tracking',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: PrimaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
                child: FlutterMap(
              options: MapOptions(
                center: const LatLng(-1.2424, 116.8944),
                zoom: 8,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
