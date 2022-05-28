/*
{
  "coord": {
    "lon": 139,
    "lat": 35
  },
  "weather": [
    {
      "description": "clear sky",
      "icon": "01n"
    }
  ],
  "main": {
    "temp": 283.88,
    "feels_like": 282.52,
    "temp_min": 283.88,
    "temp_max": 283.88,
    "pressure": 1011,
    "humidity": 58
  },
"name": "Shuzenji",
}
 */

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['main'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TempInfo{
  final double currTemp;
  final double feelslike;
  final double tempmax;
  final double tempmin;
  final int pressure;
  final int humidity;

  TempInfo({this.currTemp,this.feelslike, this.tempmax, this.tempmin, this.humidity,this.pressure});

  factory TempInfo.fromJson(Map<String, dynamic> tempInfoJson){
    final currTemp = tempInfoJson['temp'];
    final feelslike = tempInfoJson['feels_like'];
    final tempmax = tempInfoJson['temp_max'];
    final tempmin = tempInfoJson['temp_min'];
    final pressure = tempInfoJson['pressure'];
    final humidity = tempInfoJson['humidity'];
    return TempInfo(currTemp: currTemp, feelslike: feelslike,tempmax: tempmax, tempmin: tempmin, humidity: humidity,pressure: pressure);
  }
}
class WeatherResponse{
  final String cityName;
  final TempInfo tempInfo;
  final WeatherInfo weatherInfo;

  WeatherResponse({this.cityName,this.tempInfo, this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TempInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(cityName: cityName,tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}