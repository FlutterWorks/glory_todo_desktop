import 'package:flutter/material.dart';
import 'package:glory_todo_desktop/core/Manager/Manager.dart';
import 'package:glory_todo_desktop/core/components/Table.dart';
import 'dart:convert';

import 'package:glory_todo_desktop/core/models/Project.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  bool isNight = true;
  Color geceArkaPlan = Colors.black;
  Color geceOnPlan = Color(0xFF212121);
  Future<List<Project>> tables = read();

  var projeBaslik = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: isNight ? Color(0xFF212121) : Colors.white,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.nightlight_round,
                  color: isNight ? Colors.white : Colors.yellow.shade300,
                ),
                onPressed: () {
                  setState(() {
                    isNight = !isNight;
                  });
                })
          ],
        ),
        backgroundColor: isNight ? Colors.black : Color(0xFFf1f2f6),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF212121),
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return new AlertDialog(
                      title: Text(
                        "Yeni Proje Adı?",
                        style: TextStyle(
                            color: isNight ? Colors.white : Colors.black),
                      ),
                      content: TextFormField(
                        controller: projeBaslik,
                        decoration: InputDecoration(
                            hintText: "Proje Adını Giriniz",
                            hintStyle: TextStyle(
                                color: isNight ? Colors.white : Colors.black)),
                      ),
                      backgroundColor: isNight ? geceOnPlan : Color(0xFFf1f2f6),
                      actions: [
                        FlatButton(
                          color: Colors.green.shade400,
                          onPressed: () {
                            setState(() {
                              WriteTablo(new Project("1", projeBaslik.text));

                              tables = read();
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            child: Text(
                              "Oluştur",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    );
                  });
            });
          },
        ),
        body: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: FutureBuilder(
                future: tables,
                builder: (context, snapshot) {
                  //print("SONUC : " + snapshot.data[0]);
                  List<Project> projects = snapshot.data ?? [];
                  if (projects.length > 0) {
                    print("PROJECT : " + projects[0].projectHeader);
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: projects.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new TabloWidget(
                          isNight, projects[index].projectHeader);
                      //print("YAZ :=> " + data.toString());
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
