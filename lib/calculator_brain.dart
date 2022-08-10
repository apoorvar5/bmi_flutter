
import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.weight, this.height});
    final height;
    final weight;
    double _bmi=0;
  String getBMI(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getComments(){
    if(_bmi>=25){
      return 'OverWeight';
    }else if(_bmi>=18.5){
      return 'Average';
    }else{
      return 'UnderWeight';
    }
  }
  String getOverView(){
    if(_bmi>=25){
      return 'You have above normal body weight. Start working out!';
    }else if(_bmi>=18.5){
      return 'You have normal body weight. Good Job!';
    }else{
      return 'You have below normal body weight. Increase your food intake!';
    }
  }
}