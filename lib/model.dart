import 'package:weather/network.dart';
const APIKEY='ca49e6bbcd84db607f2aa1bb7e12286d';
class Model {
Future<dynamic> getCityWeather(String cityName) async {
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$APIKEY&units=metric');

    var weatherData = await network.getData();
    return weatherData;
  }
String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }


}