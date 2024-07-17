import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weatherModel.dart';
import '../models/weather_model.dart';

class WeatherController extends GetxController {
  var weather = WeatherModel(temperature: 0.0, windSpeed: 0.0).obs;
  var isLoading = false.obs;

  Future<void> fetchWeather(double latitude, double longitude) async {
    isLoading.value = true;
    final response = await http.get(
      Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,wind_speed_10m'),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      weather.value = WeatherModel.fromJson(data);
    } else {
      Get.snackbar('Error', 'Failed to fetch weather data');
    }
    isLoading.value = false;
  }
}
