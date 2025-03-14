import 'package:flutter/material.dart';
import 'package:weather/city.dart';
import 'package:weather/model.dart';

const kstyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26);

class Uiscreen extends StatefulWidget {
  final weatherData;
  final Function? getlocation;
  Uiscreen(this.weatherData,this.getlocation);

  @override
  State<Uiscreen> createState() => _UiscreenState();
}

class _UiscreenState extends State<Uiscreen> {
  late double temperature;

  late int condition;

  late String cityName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/back.jpg'))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {

                       
                         


                        },
                        child: const Icon(
                          Icons.near_me,
                          color: Colors.black,
                          size: 40,
                        )),



                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Weather App",
                      style: kstyle,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () async{

                     dynamic CityName= await Navigator.push(context, 
                        
                        MaterialPageRoute(builder: (context) => 
                        CityScreen(),));
                      print(CityName);
                        if (CityName!=null) {
                          var weatherData= await Model().getCityWeather(CityName);
                          UpdateUI(weatherData);
                        }


                        },
                        child: const Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 40,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Text(
                  "$temperature",
                  style: kstyle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Text(
                  "${Model().getMessage(temperature.toInt())}",
                  style: kstyle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Text(
                  "${Model().getWeatherIcon(condition)}",
                  style: kstyle,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Text(
                  "$cityName",
                  style: kstyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void UpdateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        condition = 0;
        cityName = '';
        return;
      }
      temperature = weatherData['main']['temp'];

      condition = weatherData['weather'][0]['id'];

      cityName = weatherData['name'];
    });
  }
}
