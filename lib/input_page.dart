import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sex_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender {male,female}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  Integer weight = Integer(value:55);
  Integer age = Integer(value:18);

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
                  child:ReusableCard(
                  cardOnTap:  (){
                    this.setState((){
                      selectedGender = Gender.male;
                    });
                  },
                  colour:selectedGender==Gender.male?kActiveCardColor:kInactiveCardColor,
                  cardChild: SexContent(
                    label:'Male',
                    icon:FontAwesomeIcons.mars
                  ),
                    )
                ),
                Expanded(
                  child:ReusableCard(
                    cardOnTap: (){
                        this.setState((){
                          selectedGender = Gender.female;
                        });
                      },
                    colour:selectedGender == Gender.female?kActiveCardColor:kInactiveCardColor,
                    cardChild:SexContent(
                      label:'Female',
                      icon:FontAwesomeIcons.venus
                    )
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
                    colour:kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        Text(
                          'HEIGHT',
                          style:kLabelTextStyle
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kStatStyle
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                        ],
                      ),
                      SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            overlayColor:Color(0x29EB1555),
                            thumbColor: Color(0xFFEB1555),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius:30.0)
                          ),
                          child: Slider(
                          onChanged: (double newValue){
                            this.setState((){
                              height = newValue.toInt();
                            });
                          },
                          inactiveColor: Color(0xFF8D8E98),
                          value:height.toDouble(),
                          min:120,
                          max:220
                        ),
                      )
                      ]
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
                    cardChild: PlusMinusWidget(
                      label:'Weight',
                      stat: weight,
                      parent : this
                    ),
                    colour:kActiveCardColor
                  )
                ),
                Expanded(
                  child:ReusableCard(
                    cardChild: PlusMinusWidget(
                      label:'Age',
                      stat: age,
                      parent : this
                    ),
                    colour:kActiveCardColor
                  )
                )
              ],
            ),
          ),
          Container(
            color:kBottomContainerColor,
            margin:EdgeInsets.only(top:10),
            width:double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      )
    );
  }
}

class PlusMinusWidget extends StatelessWidget {
  
  final String label;
  final Integer stat;
  final _InputPageState parent;
  PlusMinusWidget({this.stat,this.parent,this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        Text(label,style:kLabelTextStyle),
        Text(stat.value.toString(),style:kStatStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          RoundIconButton(
            onPress:(){
              parent.setState((){
                stat.value--;
              });
            },
            icon:FontAwesomeIcons.minus
          ),
          SizedBox(width: 20,),
          RoundIconButton(
            onPress: (){
              parent.setState((){
                stat.value++;
              });
            },
            icon:FontAwesomeIcons.plus
          ),
        ],)
      ]
    );
  }
}

class RoundIconButton extends StatelessWidget {
  
  final IconData icon;
  final Function onPress;
  RoundIconButton({this.icon,this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon),
      onPressed: (){this.onPress();},
      elevation: 6,
      shape:CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width:56,
        height:56,
      ),
    );
  }
}