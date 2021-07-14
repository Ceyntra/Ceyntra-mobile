class WeatherModel {

  var dateObject;
  String place;
  String country;
  int condition;
  double tempeture;
  double windStatus;
  var visibility;
  int humidity;
  int airPressure;

  //For next 5 days
  var weatherForecast;


  WeatherModel(
      this.dateObject,
      this.place,
      this.country,
      this.condition,
      this.tempeture,
      this.windStatus,
      this.visibility,
      this.humidity,
      this.airPressure,
      this.weatherForecast);



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

}