import 'package:flutter/cupertino.dart';

class DogsBloc extends ChangeNotifier {
  String? _selectedItem;
  String get selected => _selectedItem!;

  void setSelectedItem(String s) {
    _selectedItem = s;
    notifyListeners();
  }
}
