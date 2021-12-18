import 'package:flutter/material.dart';

class CustomTextFfield extends StatefulWidget {
  const CustomTextFfield({Key? key}) : super(key: key);

  @override
  _CustomTextFfieldState createState() => _CustomTextFfieldState();
}

class _CustomTextFfieldState extends State<CustomTextFfield> {
  bool isSave = false;
  int current = 0;

  List<Map> dataCollect = [];

  TextEditingController myControllerFirstName = TextEditingController();

  TextEditingController myControllerLastName = TextEditingController();

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
                  child: isSave == false ? Text("SAVE") : Text("UPDATE")),
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

                setState(() {
                  isSave = false;
                });
              }
            },
          ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.pink[100],
            ),

            //List View Builder

            child: ListViewBuilder(),
          ),
        ],
      ),
    );
  }

  // Methode List View Builder

  ListView ListViewBuilder() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: dataCollect.length,
      itemBuilder: (context, index) {
        //List Tile

        return ListTile(
          leading: CircleAvatar(
            radius: 18,
            child: Text(index.toString()),
          ),
          title: Text(dataCollect[index]['name'] +
              " " +
              dataCollect[index]['lastName']),
          subtitle: Text("ID : ${index.toString()}"),
          trailing: Container(
            width: 100,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // Icon Of Delete

                IconButton(
                  tooltip: "Delete",
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[800],
                  ),
                  onPressed: () {
                    //Alert Dailogue

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Delete!!"),
                            content: const Text(
                                "Are you sure you want to delete ??"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    dataCollect.removeAt(index);
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        });
                  },
                ),

                //Icon Of Edit

                IconButton(
                  tooltip: "Edit",
                  icon: Icon(
                    Icons.edit,
                    color: Colors.green[800],
                  ),
                  onPressed: () {
                    setState(() {
                      myControllerFirstName.text = dataCollect[index]['name'];
                      myControllerLastName.text =
                          dataCollect[index]['lastName'];
                      current = index;
                      isSave = true;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
