import 'package:internet_connection_checker/internet_connection_checker.dart';


class StatusChecker {


  Future<bool> checkConnection() async {
    if (await InternetConnectionChecker().hasConnection) {
      return true;
    } else {
      return false;
    }
  }


}
