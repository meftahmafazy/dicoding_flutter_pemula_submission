import 'package:flutter/material.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:dicoding_submission/Models/results_screen.dart';
import 'package:dicoding_submission/Models/model.dart';

enum JenisKelamin { lakiLaki, perempuan }
JenisKelamin? _character = JenisKelamin.lakiLaki;

int selectedRadioTile = 0;

class Calculator extends StatefulWidget{
  const Calculator({Key? key}) : super(key : key);
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator>{
  final textWeight = TextEditingController();
  final textHeight = TextEditingController();
  final textAge = TextEditingController();
  double _bmi = 0;
  int _hasil = 0;

  late BMIModel _bmiModel;
  var textDesc = TextStyle(
      color: Colors.teal,
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold);

  setSelectedRadioTile(int val){
    setState(() {
      selectedRadioTile = val;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text('BMI Calculator', style: TextStyle(fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Rubik'),),
    backgroundColor: Colors.teal,
    centerTitle: true,
    ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              //Weight Input
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextFormField(
                  style: textDesc,
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                      focusColor: Colors.tealAccent,
                      labelText: 'Weight',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Input Weight',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)
                      ),
                      suffixText: '.kg'
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    ThousandsFormatter(allowFraction: true)
                  ],
                  controller: textWeight,
                ),
              ),

              //Height Input
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextFormField(
                  style: textDesc,
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                      focusColor: Colors.tealAccent,
                      labelText: 'Height',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Input Height',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)
                      ),
                      suffixText: '.cm'
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    ThousandsFormatter(allowFraction: true)
                  ],
                  controller: textHeight,
                ),
              ),

              //Age Input
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextFormField(
                  style: textDesc,
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                      labelText: 'Age',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Input Ages',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)
                      ),
                      suffixText: 'Years'
                  ),
                  keyboardType: TextInputType.number,
                  controller: textAge,
                ),
              ),

              // Gender Title
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text('Gender', style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal
                    ),
                    ),)
              ),

              //Gender RadioButton
              Container(
                child: Padding(padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: <Widget>[
                      RadioListTile(
                        title: const Text('Male', style: TextStyle(
                          color: Colors.teal,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        value: 0,
                        groupValue: selectedRadioTile,
                        onChanged: (value) {
                          setSelectedRadioTile(value as int);
                        },
                        activeColor: Colors.teal,
                      ),
                      RadioListTile(
                        title: const Text('Female', style: TextStyle(
                            color: Colors.teal,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold
                        )
                        ),
                        value: 1,
                        groupValue: selectedRadioTile,
                        onChanged: (value) {
                          setSelectedRadioTile(value as int);
                        },
                        activeColor: Colors.teal,
                      ),
                    ],
                  ),
                ),
              ),

              //Results Button
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.teal)
                          ),
                          onPressed:() {
                            setState(() {
                              int Genders = selectedRadioTile as int;
                              double broca;
                              double height = double.parse(textHeight.text);
                              double weight = double.parse(textWeight.text);
                              _bmi = weight/((height/100)*(height/100));

                              switch (Genders) {
                                case 0 :
                                  broca=((height-100)-(0.10*(height-100)));
                                  break;
                                case 1 :
                                  broca=((height-100)-(0.15*(height-100)));
                                  break;
                                default: broca=0;
                              }

                              int hasil = broca.toInt();
                              if(_bmi >= 18.5 && _bmi <= 25){
                                _bmiModel = BMIModel(bmi: _bmi, isNormal: true, details: "Kamu sudah cukup ideal", hasil :hasil);
                              }else if(_bmi < 18.5){
                                _bmiModel = BMIModel(bmi: _bmi, isNormal: false, details: "Kamu Terlalu Kurus", hasil :hasil);
                              }else if(_bmi > 25 && _bmi <= 30){
                                _bmiModel = BMIModel(bmi: _bmi, isNormal: false, details: "Kamu Kelebihan Berat Badan", hasil:hasil);
                              }else{
                                _bmiModel = BMIModel(bmi: _bmi, isNormal: false, details: "Kamu Obesitas", hasil :hasil );
                              }


                            });
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => ResultsPage(),
                              settings: RouteSettings(arguments: _bmiModel)
                            ),

                            );
                          },
                          child:
                          Text('Send', style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Rubik',
                          ),
                          )
                      ),

                      //Reset Buttons
                      Padding(padding: EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.teal)
                          ),
                          onPressed: () {
                            textWeight.clear();
                            textHeight.clear();
                            textAge.clear();
                            setSelectedRadioTile(-1);
                          },
                          child:
                          Text('Reset', style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Rubik',
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}




