import 'package:dicoding_submission/Models/model.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    final bmiModel = ModalRoute.of(context)!.settings.arguments as BMIModel;
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar:AppBar(
        title: Text('Results', style: TextStyle(fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rubik'),),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body:
          Center(
        child : Container(
          padding: EdgeInsets.fromLTRB(60.0, 28.0, 29.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 15),
            child : Text('Hasil BMI Anda adalah',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Rubik',color: Colors.white),),
        ),
                    Column(children: [
                  Text(bmiModel.bmi.toString(),style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: Colors.white60),)
                ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 15),
                      child : Text('Menurut Analisa',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Rubik',color: Colors.white),),
                    ),
                    Column(children: [
                      Text(bmiModel.details.toString(),style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: Colors.white60),)
                    ],
                )
              ],
            ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 15),
                      child : Text('Berat badan ideal yang direkomendasikan adalah',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Rubik',color: Colors.white),),
                    ),
                    Column(children: [
                      Text(bmiModel.hasil.toString(),style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: Colors.white60),)
                    ],
                    )
                  ],
                ),
      ]
          )
    )
          )
            );
  }
}