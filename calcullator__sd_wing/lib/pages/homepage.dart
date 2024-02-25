import 'package:calcullator__sd_wing/api.dart';
import 'package:calcullator__sd_wing/utilites/keypad.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String input = "";
  String output = "";
  var Data;
  String url='';


  Future<void> evaluate(String input) async {
    try {
      url = 'https://calculator-flask-app-wvii.onrender.com/evaluate?query=$input';
      Data = await Getdata(url);
      var DecodedData = json.decode(Data);
      output = DecodedData['result'].toString();
          print(output);
    } 
    catch (e) {
      setState(() {
        output = "Error";
        output = "Error: $e";
        print(output);
      });
    }
}



  void onTap(String text){
    setState(() {
      if(text=='AC'){
        input='';
        output='';
      }
      else if(text=='⌫'){
        if(input.length==1){
          input='';
          output='';
        }
        else if(input.isNotEmpty) {
          input=input.substring(0,input.length-1);
        }
      }
      else if(text=='00'){
        if(input!='0' && input.isNotEmpty){
          input+=text;
        }
      }
      else if(text=='×' || text =='÷' || text=='+' || text=='-'){
        if(input!='0' && input.isNotEmpty){
          if(input[input.length-1]!='+' && input[input.length-1]!='×' && input[input.length-1]!='÷' &&input[input.length-1]!='-' ){
            input+=text;
          }
          else{
            if(input[input.length-1]!=text && input.length!=1){
              input=input.substring(0,input.length-1);
              input+=text;
            }
          }
        }
        else{
          if(text=='-'){
            input=text;
          }
        }
      }
      else if(text=='='){
        if(input.isNotEmpty){
          var userInput = input;
          userInput=userInput.replaceAll('×', '*');
          userInput=userInput.replaceAll('÷', '/');
          String temp = userInput.substring(userInput.length - 1, userInput.length);
          if((temp == '+' || temp == '-' || temp == '*' || temp == '/')){
            setState(() {
              output = "Error!";
            });
          }
          else{
            evaluate(userInput).then((_) {
              setState(() {
                // print(output);
              });
            });
          }
        }
      }
      else{
        if(input=='0' || input.isEmpty) {
          input=text;
        } else{
          input+=text;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.045),
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: TextStyle(fontSize: (input.length < 36) ? MediaQuery.of(context).size.height * 0.07 : MediaQuery.of(context).size.height * 0.05),
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      output,
                      style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05, color: Colors.black.withOpacity(0.6)),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            CalcKeypad(onInputChanged: onTap),
          ],
      ),
    );
  }
}