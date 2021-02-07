import 'package:flutter/material.dart';
import 'package:glory_todo_desktop/Pages/TodosPage.dart';
import 'package:glory_todo_desktop/core/models/Column.dart';
import 'package:glory_todo_desktop/core/models/Project.dart';

class TabloWidget extends StatefulWidget {
  bool isNight;
  String tableHeader;
  String tableUnicId;
  TabloWidget(this.isNight, this.tableHeader, this.tableUnicId);
  Project n = new Project("1", "test");

  @override
  _TabloWidgetState createState() => _TabloWidgetState();
}

class _TabloWidgetState extends State<TabloWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TodosPage(
                    widget.isNight, widget.tableHeader, widget.tableUnicId)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        width: 250,
        height: 150,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: widget.isNight ? Colors.black12 : Colors.grey.shade300,

                blurRadius: 6,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            color: widget.isNight ? Color(0xFF212121) : Colors.white,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(widget.tableHeader,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    color: widget.isNight ? Colors.white : Colors.black,
                  )),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.symmetric(vertical: 10),
              // decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       color: Color(0x738ABFC7),

              //       blurRadius: 1,
              //       offset: Offset(0, 2), // changes position of shadow
              //     ),
              //   ],
              // ),
              child: LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Color(0x4D131111),
                minHeight: 6,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
