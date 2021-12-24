import 'package:flutter/material.dart';
import 'package:textfieldtest/Model/user.dart';
import 'package:textfieldtest/cont.dart';
import 'listbuilder.dart';

class CustomTextFfield extends StatefulWidget {
  CustomTextFfield({Key? key}) : super(key: key);

  @override
  _CustomTextFfieldState createState() => _CustomTextFfieldState();
}

class _CustomTextFfieldState extends State<CustomTextFfield> {
  //instanc USERS
  List<Users> user = [];
  addUser(String name, String lname) {
    user.add(
      Users.fromJson(
        {'fname': name, 'lname': lname},
      ),
    );
  }

  //variable used
  List<Map> dataCollect = [];
  TextEditingController _myControllerFirstName = TextEditingController();
  TextEditingController _myControllerLastName = TextEditingController();
  int current = 0;
  bool isSave = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _myControllerFirstName.dispose();

    _myControllerLastName.dispose();
    super.dispose();
  }

//CallBack Function for Edit Icon
  callBackEdit(index) {
    setState(() {
      _myControllerFirstName.text = dataCollect[index]['name'];
      _myControllerLastName.text = dataCollect[index]['lastName'];
      current = index;
      isSave = true;
    });
  }

//CallBack Function for Remove Alert Dailogue
  callBackRemov(index) {
    setState(() {
      dataCollect.removeAt(index);
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),

          // TEXT FORM FIELD fIRST NAME

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _myControllerFirstName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your First Name',
              ),
            ),
          ),

          // TEXT FORM FIELD LAST NAME

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _myControllerLastName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Last Name',
              ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          // RAISED BUTTON

          ElevatedButton(
            child: Container(
              width: 100,
              height: 40,
              child: Center(
                child: isSave == false ? Text('SAVE') : Text('UPDATE'),
              ),
            ),

            // On Pressed

            onPressed: () {
              // part SAVE

              if (isSave == false) {
                addUser(
                    _myControllerFirstName.text, _myControllerLastName.text);

                Map add = {
                  'name': _myControllerFirstName.text,
                  'lastName': _myControllerLastName.text
                };

                setState(() {
                  dataCollect.add(add);
                  _myControllerFirstName.clear();
                  _myControllerLastName.clear();
                });

                // PART UPDATE

              } else if (isSave == true) {
                dataCollect[current]['name'] = _myControllerFirstName.text;
                dataCollect[current]['lastName'] = _myControllerLastName.text;
                _myControllerFirstName.clear();
                _myControllerLastName.clear();

                setState(
                  () {
                    isSave = false;
                  },
                );
              }
            },
          ),

          ListBuilderC(
              dataCollect: dataCollect,
              callBackEditFun: callBackEdit,
              callBackRemove: callBackRemov),
        ],
      ),
    );
  }
}
