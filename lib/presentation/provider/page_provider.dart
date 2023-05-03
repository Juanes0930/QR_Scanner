import 'package:flutter/material.dart';
 
class PageProvider extends ChangeNotifier {
 int _selectedPage = 1;

  int get selectedPage {
    return _selectedPage;
  }

  set selectedPage(int index){
    _selectedPage = index;
    notifyListeners();
  }

}