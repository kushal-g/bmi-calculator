import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final Map result;
  ResultsPage({this.result}){
    print(result);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('BMI CALCULATOR')
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin:EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            child: Text('Your Result',            
              style:TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              letterSpacing: 1
                
            )),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  Text(result['condition'],
                    style:TextStyle(
                      color:Colors.greenAccent,
                      letterSpacing: 1,
                      fontSize: 17
                    )
                  ),
                  Text(result['bmi'], style:TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w900
                    )
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(result['interpretation'],
                    
                    textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 17
                      )
                    ),
                  )
                ]
              ),
              colour:kActiveCardColor
            ),
          ),
          GestureDetector(
            onTap: (){  
              Navigator.pop(context);
            },
            child: Container(
              child:Center(
                child: Text(
                  'RECALCULATE',
                  style:TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 3
                  )
                ),
              ),
              color:kBottomContainerColor,
              margin:EdgeInsets.only(top:10),
              width:double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      )
    );
  }
}