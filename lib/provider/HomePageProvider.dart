import 'package:flutter/foundation.dart';

class MenuProvider with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  Future<void> setSelectedIndex({required int selectedIndex}) async {
    _selectedIndex = selectedIndex;
    notifyListeners();
  }
}
