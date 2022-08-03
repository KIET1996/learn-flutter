import 'package:bmi_app/constants/app_constant.dart';
import 'package:bmi_app/widgets/left_bar.dart';
import 'package:bmi_app/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "BMI App",
            style: TextStyle(
                color: accentHexColor,
                fontWeight: FontWeight.w300
            ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8)
                      )
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0,),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = (_w*10000)/(_h*_h);
                  if(_bmiResult > 25){
                    _textResult = "Over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "Normal weight";
                  } else {
                    _textResult = "Under weight";
                  }
                });
              },
              child: Text(
                "Calculation",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor
                ),
              ),
            ),
            const SizedBox(height: 50.0,),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 90.0,
                    color: accentHexColor
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor
                  ),
              ),
            ),
            const SizedBox(height:10),
            const LeftBar(barWidth: 40,),
            const SizedBox(height: 20,),
            const LeftBar(barWidth: 70),
            const SizedBox(height: 20,),
            const LeftBar(barWidth: 40,),
            const SizedBox(height: 20,),
            const RightBar(barWidth: 70),
            const SizedBox(height: 50,),
            const RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
