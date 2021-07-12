import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:ceyntra_mobile/models/weatherModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

/*
*  WeatherScreen(place: 'Sigiriya',country: 'Sri Lanka')
* This will load the weather forecast of the place
*
* */

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key key, this.place, this.country}) : super(key: key);
  final String place;
  final String country;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  WeatherModel weatherModel;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    //Load data
    getWeatherData();
  }

  Future<Map> getLocationCordinates(String input) async {

    http.Response response = await http.get(
        Uri.parse('https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&fields=geometry&key=AIzaSyAMAWxImXkWiTM2vANMU8xDCPSzVlmmtUw')
    );
    return jsonDecode(response.body)['candidates'][0]['geometry']['location'];
  }

  Future<String> getWeatherData() async{

    Map<dynamic,dynamic> location = await getLocationCordinates(widget.place);

    double lat=location['lat'] as double;
    double lon=location['lng'] as double;

    http.Response response=await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely,alerts&appid=b6888446a38baf7b596417ccd83ce056'));

    if(response.statusCode == 200){

      var data= response.body;
      var current=jsonDecode(data)['current'];

      await setState((){
        weatherModel=new WeatherModel(  //dateObject, place, country, condition, tempeture, windStatus, visibility, humidity, airPressure, weatherForecast
          DateTime.fromMillisecondsSinceEpoch(current['dt'] * 1000),
          widget.place,
          widget.country,
          current['weather'][0]['id'],
          current['temp'].toDouble()- 273.15,
          current['wind_speed'],
          current['visibility'],
          current['humidity'],
          current['pressure'],
          jsonDecode(data)['daily'],
        );

      }) ;

    }else{
      print(response.statusCode);
      return response.statusCode.toString();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Column(
            children: [
              //Top menu
              Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex:1,
                        child:  Icon(
                          Icons.menu_outlined,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                      Expanded(
                        flex:1,
                        child: TopIcon(title:'Place',topIcon: Icons.room_outlined),
                      ),
                      Expanded(
                        flex:1,
                        child: TopIcon(title:'Weather',topIcon: Icons.ac_unit_outlined,color: Colors.green,),
                      ),
                      Expanded(
                        flex:1,
                        child:TopIcon(title:'Hotel',topIcon: Icons.hotel_outlined ),
                      ),
                      Expanded(
                        flex:1,
                        child:TopIcon(title:'Taxi',topIcon: Icons.local_taxi),
                      ),
                    ],
                  )
              ),

              //Body container Box
              Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.only(left:15, right: 15, bottom: 15),
                  //Body box style
                  decoration:BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center, // 10% of the width, so there are ten blinds.
                      colors: <Color>[
                        Colors.green[400],
                        Colors.teal[900],
                      ], // red to yellow
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),

                  child: Container(   //move
                    width: double.infinity,
                    child: weatherModel==null ? LoadingSpinner() : WeatherContent(
                      weatherModel: weatherModel,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

//Bottom next day weather prediction box
class NextDayWeather extends StatelessWidget {
  const NextDayWeather({@required this.dateObj,@required this.dayIndex,@required this.weatherForecast,this.weatherIcon});

  final dateObj;
  final weatherForecast;
  final int dayIndex;
  final String weatherIcon;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Text(
            DateFormat('EEEE').format(dateObj.add(Duration(days: dayIndex))),
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.w400
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey[300]),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Text(
                  weatherIcon.toString(), style: TextStyle(
                  fontSize: 14.0,
                ),
                ),
                Text('${(weatherForecast[dayIndex-1]['temp']['day'].toDouble() -273.15).toStringAsFixed(0)}°'),
                Text('C'),
              ],
            ),
          ),
        ],
      );
  }
}

//wind status, visibility, humidity, air pressure
class WeatherDetails extends StatelessWidget {
  WeatherDetails({Key key, @required this.title, @required this.data, @required this.dataUnit}) : super(key: key);

  final String title;
  final data;
  final String dataUnit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
          children: [
            Text(title,
              style:GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(data.toString()+' '+dataUnit,
              style:GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300
              ),
            ),
          ]
      ),
    );
  }
}

//Top menu icons
class TopIcon extends StatelessWidget {
  const TopIcon({Key key, @required this.title,@required this.topIcon, this.color=Colors.yellow}) : super(key: key);

  final String title;
  final IconData topIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:15),
      child: Column(
        children: [
          Icon(
            topIcon,
            color: color,
            size: 30.0,
          ),
          Text( title,
            style: TextStyle(
              color: Colors.white,
            ),

          ),
        ],
      ),
    );
  }
}

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRipple(
        color: Colors.white,
        size: 300.0,
      ),
    );
  }
}

class WeatherContent extends StatelessWidget {

  WeatherContent({Key key,this.weatherModel}) : super(key: key);

  final WeatherModel weatherModel;

  TextStyle fontStyleCircle=GoogleFonts.montserrat(
      color: Colors.black,
      fontSize: 64,
      fontWeight: FontWeight.w300
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          //Location Name
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                children: [
                  Text('Today, ${DateFormat('MMM').format(weatherModel.dateObject)} ${weatherModel.dateObject.day}th ${weatherModel.dateObject.year}',
                    style:GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                    ),),
                  Text(weatherModel.place,
                    style:GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Text('${weatherModel.country}',style:GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w200
                  )
                  ),
                ],
              ),
            ),
          ),

          //Temp Circle
          Expanded(
            flex: 6,
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Column(
                children: [
                  Text(weatherModel.getWeatherIcon(weatherModel.condition).toString(), style: fontStyleCircle,),
                  Text('${weatherModel.tempeture.toStringAsFixed(0)}°C', style: fontStyleCircle,)
                ],
              ),
            ),
          ),

          //Wind status & Visibility
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeatherDetails(title: 'Wind status', data: weatherModel.windStatus,dataUnit: 'mph',),
                  WeatherDetails(title: 'Visibility', data: weatherModel.visibility/1000,dataUnit: 'miles',),
                ],
              ),
            ),
          ),

          //Humidity & Air pressure
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeatherDetails(title: 'Humidity', data: weatherModel.humidity,dataUnit: '%',),
                  WeatherDetails(title: 'Air pressure', data: weatherModel.airPressure,dataUnit: 'mb',),
                ],
              ),
            ),
          ),

          //Next days Predictions
          Expanded(
            flex: 5 ,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 25.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0), bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Align(
                    alignment:Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0, bottom: 8.0),
                      child: Text('The next 5 days',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              letterSpacing: 1,
                            ),
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i=0; i<5; i++)
                        Expanded(
                          flex: 1,
                          child: NextDayWeather(dateObj: weatherModel.dateObject, dayIndex: i+1, weatherForecast: weatherModel.weatherForecast,
                            weatherIcon: weatherModel.getWeatherIcon(weatherModel.weatherForecast[i]['weather'][0]['id']),
                          ),
                        ),
                    ],
                  ),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}