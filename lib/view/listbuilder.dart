import 'package:flutter/material.dart';

class ListBuilderC extends StatelessWidget {
  //passin data
  final List<Map> dataCollect;
  //callBack Function For Edit Icon
  final Function callBackEditFun;
  //callBack Function for Remove Alert Dailogue
  final Function callBackRemove;

  const ListBuilderC(
      {Key? key,
      required this.dataCollect,
      required this.callBackEditFun,
      required this.callBackRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink[100],
      ),
      child: ListView.builder(
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
                              //notif NO
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("No"),
                              ),
                              //Notif Yes
                              TextButton(
                                onPressed: () {
                                  //call Back
                                  callBackRemove(index);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
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
                      //call Back
                      callBackEditFun(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
