class Weather {
  String? cityName;
  double? temp;
  double? tempMin;
  double? tempMax;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;

  Weather({
    this.cityName,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.wind,
    this.humidity,
    this.feelsLike,
    this.pressure,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    tempMin = json["main"]["temp_min"];
    tempMax = json["main"]["temp_max"];
    wind = json["wind"]["speed"] == 0 ? 0.0 : json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feelsLike = json["main"]["feels_like"];
  }
}
