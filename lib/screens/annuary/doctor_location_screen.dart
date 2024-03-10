import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class DoctorLocationScreen extends StatefulWidget {
  const DoctorLocationScreen({super.key});

  @override
  State<DoctorLocationScreen> createState() => _DoctorLocationScreenState();
}

class _DoctorLocationScreenState extends State<DoctorLocationScreen> {
  Location? _pickedLocation;
  var _isLocationLoading = false;

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isLocationLoading = true;
    });

    locationData = await location.getLocation();

    final lat = locationData.latitude;
    final lng = locationData.longitude;

    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&location_type=ROOFTOP&result_type=street_address&key=AIzaSyARiGmPVVIIwOnAaQAPPyzTTlNaM3TTsLg");

    final response = await http.get(url);

    final resData = json.decode(response.body);

    print(resData);

    setState(() {
      _isLocationLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewPosition = const Text("Aucune position choisie");

    if (_isLocationLoading) {
      previewPosition = const CircularProgressIndicator(
        color: primarygreen,
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          const Text(
            "Recherchez les experts de santé aux alentours",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: primarygreen,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: previewPosition,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                label: const Text(
                  "Position actuelle",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                icon: const Icon(
                  Icons.location_on,
                  color: primarygreen,
                ),
                onPressed: _getCurrentLocation,
              ),
              TextButton.icon(
                label: const Text(
                  "Choisir sur la carte ",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                icon: const Icon(
                  Icons.map,
                  color: primarygreen,
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
