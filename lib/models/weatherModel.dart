class WeatherModel {
  final double temperature;
  final double windSpeed;

  WeatherModel({required this.temperature, required this.windSpeed});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['current']['temperature_2m'],
      windSpeed: json['current']['wind_speed_10m'],
    );
  }
}
