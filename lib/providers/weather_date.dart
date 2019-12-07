import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

// class WeatherAndDateInfo{

// }

class WeatherDate with ChangeNotifier {
  Map<String, dynamic> weatherAndDateInfo = <String, dynamic>{
    "temperature": "0",
    "dayState": "Unknown",
    "icon": "Unknown",
    "name": "Unknown"
  };

  Map<String, dynamic> get currentWeatherAndDateInfo {
    return weatherAndDateInfo;
  }

  Future<void> getTemperature() async {
    // String url =
    //     "https://api.openweathermap.org/data/2.5/weather?lat=43.700111&lon=-79.416298&appid=e5e672d68b050dac38838b245de31050";

    // try {
    //   final result = await http.get(url);
    //   var data = json.decode(result.body);
    //   int temp = (((data['main']['temp'] - 273.15) * 9 / 5) + 32).round();
    //   String dayState = data["weather"][0]["main"];
    //   temperatureData = {
    //     "temperature": temp.toString(),
    //     "dayState": dayState,
    //   };
    //   print(temperatureData);
    //   notifyListeners();
    // } catch (error) {
    //   print(error.toString());
    //   throw error;
    // }
    var location = Location();

    try {
      LocationData currentLocation = await location.getLocation();
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      // units = metric define celsius temperature
      String url =
          "https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=e5e672d68b050dac38838b245de31050&units=metric";

      final result = await http.get(url);
      var data = json.decode(result.body);
      //
      // double temp = (((data['main']['temp'] - 273.15) * 9 / 5) + 32);
      // print(data['main']['temp']);
      String dayState = data["weather"][0]["main"];
      weatherAndDateInfo = {
        "temperature": data['main']['temp'].toString(),
        "dayState": dayState,
        "icon": data["weather"][0]["icon"],
        "name": data["name"]
      };
      print(weatherAndDateInfo);
      notifyListeners();
    } on PlatformException catch (err) {
      if (err.code == 'PERMISSON_DENIED') {
        print("Permisiion Denied");
      }
    } catch (err) {
      print(err);
      // throw err;
    }
    // location.getLocation();
    // location.onLocationChanged().listen((LocationData currentLocation) {
    //   print(currentLocation.latitude);
    //   print(currentLocation.longitude);
    // });
  }
}
