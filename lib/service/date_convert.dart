String convertDate(){
  int currentDay = DateTime.now().day;
  int currentMonth = DateTime.now().month;
  String currentHour = DateTime.now().hour.toString().padLeft(2, '0');
  String currentMinute = DateTime.now().minute.toString().padLeft(2, '0');
  String result = '';

  switch (currentMonth) {
    case 1:
      result = '$resultянваря';
      break;
    case 2:
      result = '$resultфевраля';
      break;
    case 3:
      result = '$resultмарта';
      break;
    case 4:
      result = '$resultапреля';
      break;
    case 5:
      result = '$resultмая';
      break;
    case 6:
      result = '$resultиюня';
      break;
    case 7:
      result = '$resultиюля';
      break;
    case 8:
      result = '$resultавгуста';
      break;
    case 9:
      result = '$resultсентября';
      break;
    case 10:
      result = '$resultоктября';
      break;
    case 11:
      result = '$resultноября';
      break;
    case 12:
      result = '$resultдекабря';
      break;
  }

  return '$currentDay $result $currentHour:$currentMinute';

}