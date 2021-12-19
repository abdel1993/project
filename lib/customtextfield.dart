import 'package:flutter/material.dart';
import 'listbuilder.dart';

class CustomTextFfield extends StatefulWidget {
  const CustomTextFfield({Key? key}) : super(key: key);

  @override
  _CustomTextFfieldState createState() => _CustomTextFfieldState();
}

class _CustomTextFfieldState extends State<CustomTextFfield> {
  //variable used
  List<Map> dataCollect = [];
  TextEditingController myControllerFirstName = TextEditingController();
  TextEditingController myControllerLastName = TextEditingController();
  int current = 0;
  bool isSave = false;

//CallBack Function for Edit Icon
  callBackEdit(index) {
    setState(() {
      myControllerFirstName.text = dataCollect[index]['name'];
      myControllerLastName.text = dataCollect[index]['lastName'];
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
              controller: myControllerFirstName,
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
              controller: myControllerLastName,
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
                Map add = {
                  'name': myControllerFirstName.text,
                  'lastName': myControllerLastName.text
                };

                setState(() {
                  dataCollect.add(add);
                  myControllerFirstName.clear();
                  myControllerLastName.clear();
                });

                // PART UPDATE

              } else if (isSave == true) {
                dataCollect[current]['name'] = myControllerFirstName.text;
                dataCollect[current]['lastName'] = myControllerLastName.text;
                myControllerFirstName.clear();
                myControllerLastName.clear();

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
