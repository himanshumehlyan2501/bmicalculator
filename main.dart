import 'dart:math';

import 'package:bmicalculator/Splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: Splashscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  var wtcontroller= TextEditingController();
  var ftcontroller=TextEditingController();
  var Incontroller=TextEditingController();
  var result="";
  var chat="";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Container(
        width: double.infinity,
        color: Colors.amber,
        child: Center(
          child: Container(
            width: 300,
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('BMI Calculator',style: TextStyle(fontSize: 31.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,color: Colors.red),
                ),
                SizedBox(height: 31,),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label:Text('Weight in Kg',style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    prefixIcon: Icon(Icons.line_weight),

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21,),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text('Height in Feet',style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21,),
                TextField(
                  controller: Incontroller,
                  decoration: InputDecoration(

                    label: Text('Height in Inch',style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 31,),

                ElevatedButton(onPressed:(){
                  var wt=wtcontroller.text.toString();
                  var ft=ftcontroller.text.toString();
                  var inch=Incontroller.text.toString();

                  if(wt!=""&&ft!=""&&inch!=""){
                    var weight=int.parse(wt);
                    var ftheight=int.parse(ft);
                    var INheight=int.parse(inch);

                    var tinch=(ftheight*12)+INheight;
                    var tm=(tinch*2.54)/100;
                    var bmi=weight/pow(tm, 2);

                    setState(() {
                      result="Your Calculated BMI : ${bmi.toStringAsFixed(2)}";
                    });
                    if(bmi>29.90){
                       chat ="Obesity";
                    }
                    else if(bmi>25.00&&bmi<29.9){
                      chat="Over Weight";
                    }
                    else if(bmi<18.50)
                    {chat="Under Weight";}
                    else{
                      chat="Healthy Weight";
                    }


                  }
                  else{
                    setState(() {
                      result="Please fill the above details ";
                      chat="";
                    });

                  }




                },child: Text('Calculate',style: TextStyle(fontSize: 20.0,),

                ),

                ),

                SizedBox(height: 34.0,),

                Text('${result}\n ${chat}',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.red),),


              ],
            ),
          ),
        ),
      )
    );
  }
}
