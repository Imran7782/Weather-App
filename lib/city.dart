import 'package:flutter/material.dart';

class  CityScreen extends StatefulWidget {
  const  CityScreen({super.key});

  @override
  State< CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State< CityScreen> {


  late String CityName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
             height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/back.jpg'))),
          
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              
                SizedBox(height: 80,),
        
        
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: TextField(
                onChanged: (value) {
                  CityName=value;
                },
                decoration: InputDecoration(
                  
                  filled: true,
                  hintText: 'Enter City name ',
                  
                  hintStyle: TextStyle(color: Colors.black),
                  icon: Icon(Icons.search,color: Colors.white,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13)
                  )
                ),
              ),
            )
        ,

        SizedBox(height: 60,),
        GestureDetector(
          onTap: () {
             Navigator.pop(context,CityName);
        
          },
          child: Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(child: Text("Get Weather by city",style: TextStyle(color: Colors.white,
            fontSize: 24,fontWeight: FontWeight.bold),),),
          ),
        )
        
                ],
              ),
          ),
        ),
      ),
    );
  }
}