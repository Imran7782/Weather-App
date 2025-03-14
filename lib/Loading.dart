import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather/UIscreen.dart';
import 'package:weather/network.dart';

const APIKEY='ca49e6bbcd84db607f2aa1bb7e12286d';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

    late final double Longtuid;
    late final double latuid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.red,
          size: 50,),
      ),
    );
  }
  
  Future<void> getLocation() async {
   
        Position p= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        Longtuid=p.longitude;
        latuid=p.latitude;
        print(p);
        

      
      Network N=Network(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latuid&lon=$Longtuid&appid=$APIKEY&units=metric"
      );

      var weatherData= await N.getData();
        
      Navigator.push(context, MaterialPageRoute(builder: (context) => Uiscreen( weatherData,getLocation),));

  }
}