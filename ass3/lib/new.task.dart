import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String taskName;
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add New Task'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  this.taskName = value;
                },
              ),
              Checkbox(
                value: isComplete,
                onChanged: (value) {
                  this.isComplete = value;
                  setState(() {});
                },
              ),
              RaisedButton(
                  child: Text('Add New Task'),
                  onPressed: () {
                    // tasksList.add(Task(this.taskName, this.isComplete));
                    Navigator.pop(context);
                  })
            ],
          ),
        ));
  }
}
