import 'package:financy_app/features/home/home_page_state.dart';
import 'package:flutter/foundation.dart';
//TODO: import states

class HomePageController extends ChangeNotifier {
  //TODO: inject service
  //TODO: constructor

  HomePageState _state = HomePageStateInitial();

  HomePageState get state => _state;

  void _changeState(HomePageState newState) {
    _state = newState;
    notifyListeners();
  }
}
