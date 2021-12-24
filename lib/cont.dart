import 'package:flutter/material.dart';

class Contr {
  List<Map> dataCollect;
  TextEditingController myControllerFirstName;
  TextEditingController myControllerLastName;
  int current;
  bool isSave;

  Contr(
      {required this.dataCollect,
      required this.myControllerFirstName,
      required this.myControllerLastName,
      required this.current,
      required this.isSave});

  getInfo() {
    if (isSave == false) {
      Map add = {
        'name': myControllerFirstName.text,
        'lastName': myControllerLastName.text
      };

      dataCollect.add(add);
      myControllerFirstName.clear();
      myControllerLastName.clear();

      // PART UPDATE

    } else if (isSave == true) {
      dataCollect[current]['name'] = myControllerFirstName.text;
      dataCollect[current]['lastName'] = myControllerLastName.text;
      myControllerFirstName.clear();
      myControllerLastName.clear();

      isSave = false;
    }
  }
}
