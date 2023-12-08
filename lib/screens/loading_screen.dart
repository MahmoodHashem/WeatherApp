import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/services/location.dart';
import 'dart:convert';

const apiKey = 'ca259fb18289fab0c445e9d3c26228ec';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {

  double? latitude;
  double? longitude;

  void getLocation() async {
    Location location =  Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
  }

  void getData()  async {

    getLocation();

    http.Response response = await
    http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));

    if(response.statusCode == 200){
      var data = response.body;
      var condition = jsonDecode(data)['main']['temp'];
      var city = jsonDecode(data)['name'];
      var id = jsonDecode(data)['weather'][0]['id'];
    }else{
      print(response.statusCode);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          getData();
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
