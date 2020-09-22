import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/location.dart';
import 'package:clima/services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikety = '1eb0ce3a477f044560005da255c71423';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longtude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();

    await location.getcurrentlocation();

    latitude = location.latitude;
    longtude = location.longtude;

    Networtkhelper networkhelper = Networtkhelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtude&appid=$apikety&units=metric');

    var weatherdata = await networkhelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationweeather: weatherdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
        ),
      ),
    );
  }
}
