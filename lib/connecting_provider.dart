import 'package:flutter/material.dart';

class ConnectingProvider extends ChangeNotifier {
  List<String> name = [];

  addNote(String data) {
    name.add(data);
    notifyListeners();
  }
  Delete(String deletedata){
    name.remove( deletedata);
   
    notifyListeners();

  }
}
