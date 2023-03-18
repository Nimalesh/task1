import 'package:flutter/material.dart';
import 'package:weather/services.dart';
import 'package:weather/weather_model.dart';

class WeatherApp extends StatefulWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _myController = TextEditingController();
  final _dataService = WeatherService();
  late Weather _response;


  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

  String currentWeather = "";
  double tempC = 0;
  double tempF = 0;
  double windS=0;
  double hum=0;
  double output=0;
  bool fOrc=true;
  double input=0;




  @override
  void initState() {
    super.initState();
    _search();
  }

  void initStat(){
    super.initState();
    input=tempC;
    output=0.0;
    fOrc=true;
  }


  void _search() async {
    weather = await weatherService.getWeatherData(_myController.text);

    setState(() {
      currentWeather = weather.condition;
      tempF = weather.temperatureF;
      tempC = weather.temperatureC;
      windS=weather.wind;
      hum=weather.humidity;


    });

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Weather app'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
 ///This Container is to search city and Icon
          Container(
            height: 50,
            width: double.infinity,
            //color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
///This Container is for text filed to search the city
               SizedBox(
                 height: double.infinity,
                 width: 300,

                 //color: Colors.black87,
                 child: Center(
                   child: TextField (
                     controller: _myController,
                     decoration: InputDecoration(
                         prefixIcon: const Icon(Icons.search,color: Colors.white,),
                         enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15.0),
                             borderSide:  const BorderSide(color: Colors.white )
                         ),
                       focusedBorder:  OutlineInputBorder(
                         borderRadius:  BorderRadius.circular(15.0),
                         borderSide:  const BorderSide(color: Colors.white ),
                       ),
                         labelText: 'Enter the city',
                         labelStyle: const TextStyle(color: Colors.white),
                         hintText: 'Enter the City name',
                       hintStyle: const TextStyle( color: Colors.white)
                     ),
                   ),

                 ),

               ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: _search,
                  style: ButtonStyle(
                            elevation: MaterialStateProperty.all(8),
                            backgroundColor: MaterialStateProperty.all(Colors.white)),
    child: const Text('Search',style: TextStyle(
          color: Colors.black
        ),)

                ),
                const SizedBox(
                  width: 20,
                ),






              ],

            ),

          ),
//This Container is to show details
          SizedBox(
            height: 350,
            width: double.infinity,
            //color: Colors.green,
            child: Center(
              child: Column(

                children:  [const SizedBox(height: 30,),
                  // Text('_myController Weather Report',style: TextStyle(
                  //     color: Colors.white,
                  //   fontSize: 30
                  // ),),

                  const SizedBox(height: 20,),


 //Temperature..............

                  const SizedBox(height: 20,),
                  Text("Temperature is $tempC",style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),),
                  const SizedBox(height: 20,),
 //Current weather..............
                  Text("Current Weather is $currentWeather",style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),),
                  const SizedBox(height: 20,),
 //Wind Speed............
                  Text("Wind Speed is $windS Kmph",style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),),
                  const SizedBox(height: 20,),
 //Humidity............
                  Text("Humidity is $hum",style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),),
                ],
              ),
            ),
          ),
//This Container is to convert celcius to fahrenheit
         Container(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)
            ),
          child: const Text("Calculate celcius an fahrenheit ",style: TextStyle(
            color: Colors.black
          ),),
      onPressed: () {
        setState(() {
          fOrc == false
              ? output = (tempC - 32) * (5 / 9)
              : output = (tempC * 9 / 5) + 32;
        });
        AlertDialog dialog = AlertDialog(
          content: fOrc == false
              ? Text(
              "${tempC.toStringAsFixed(2)} F : ${output.toStringAsFixed(2)} C")
              : Text(
              "${tempC.toStringAsFixed(2)} C : ${output.toStringAsFixed(2)} F"),
        );
        showDialog(context: context, builder: (BuildContext context ){
          return dialog;
        });

      },
    ),



      ),
    ],
    ),
    );

  }
}
