import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/weather_controller.dart';
import 'controllers/weatherController.dart';

class WeatherView extends StatelessWidget {
  final WeatherController controller = Get.put(WeatherController());
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: latitudeController,
              decoration: InputDecoration(
                labelText: 'Latitude',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: longitudeController,
              decoration: InputDecoration(
                labelText: 'Longitude',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double latitude = double.parse(latitudeController.text);
                double longitude = double.parse(longitudeController.text);
                controller.fetchWeather(latitude, longitude);
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  children: [
                    Text('Temperature: ${controller.weather.value.temperature}°C'),
                    Text('Wind Speed: ${controller.weather.value.windSpeed} m/s'),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
