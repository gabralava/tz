import 'package:tz/service/date_convert.dart';

Stream<String> timeStream() async* {
  while(true) {
    await Future.delayed(const Duration(seconds: 1));
    yield convertDate();
  }
}