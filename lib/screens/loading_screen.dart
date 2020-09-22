import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/location.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();

    await location.getcurrentlocation();
    print(location.longtude);
    print(location.latitude);
  }

  void getData() async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/onecall?lat=36.7523705&lon=34.5496791&exclude=hourly&appid=1eb0ce3a477f044560005da255c71423');
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
