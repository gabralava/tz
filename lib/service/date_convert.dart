String convertDate(){
  int currentDay = DateTime.now().day;
  int currentMonth = DateTime.now().month;
  String currentHour = DateTime.now().hour.toString().padLeft(2, '0');
  String currentMinute = DateTime.now().minute.toString().padLeft(2, '0');
  List<String> listOfDays = ['января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'авгутса', 'сентября', 'октября', 'ноября', 'декабря'];

  return '$currentDay ${listOfDays[currentMonth - 1]} $currentHour:$currentMinute';

}