import 'package:flutter/cupertino.dart';



class BaseModel extends ChangeNotifier {
  final Map<Type, dynamic> _state = {};

  T? getState<T>() {

    return _state[T];
  }

  void initState<T>(dynamic newState) {

    _state[T] = newState;
  }

  void setState<T>(dynamic newState) {
    _state[T] = newState;
    notifyListeners();
  }
}