class CalculatorBrain{
  final int weight;
  final int height;
  double bmi;

  CalculatorBrain({this.weight,this.height}){
    bmi = weight / ((height/100)*(height/100)); 
  }

  String getBmi(){
    return bmi.toStringAsFixed(1);
  }

  String getCondition(){
    if(bmi>25){
      return 'OVERWEIGHT';
    }else if(bmi>18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(){
    if(bmi>25){
      return 'You have a higher than normal body weight. Try to exercise.';
    }else if(bmi>18.5){
      return 'You have a normal body weight. Good job!';
    }else{
      return 'You have less than normal body weight. Try to eat more.';
    }
  }
}