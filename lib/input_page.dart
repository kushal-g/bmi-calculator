import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sex_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF11132A);
const bottomContainerColor = Color(0xFFEB1555);


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateGender(int gender){
    
    if(gender==1){
      
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
    }else{
      femaleCardColor = activeCardColor;
      maleCardColor = inactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:GestureDetector(
                      onTap: (){
                        this.setState((){
                          this.updateGender(1);
                        });
                      },
                      child: ReusableCard(
                      colour:maleCardColor,
                      cardChild: SexContent(
                        label:'Male',
                        icon:FontAwesomeIcons.mars
                      ),
                    ),
                  )
                ),
                Expanded(
                  child:GestureDetector(
                      onTap: (){
                        this.setState((){
                          this.updateGender(2);
                        });
                      },
                      child: ReusableCard(
                      colour:femaleCardColor,
                      cardChild:SexContent(
                        label:'Female',
                        icon:FontAwesomeIcons.venus
                      )
                    ),
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:ReusableCard(
                    colour:activeCardColor
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:ReusableCard(
                    colour:activeCardColor
                  )
                ),
                Expanded(
                  child:ReusableCard(
                    colour:activeCardColor
                  )
                )
              ],
            ),
          ),
          Container(
            color:bottomContainerColor,
            margin:EdgeInsets.only(top:10),
            width:double.infinity,
            height: bottomContainerHeight,
          )
        ],
      )
    );
  }
}

