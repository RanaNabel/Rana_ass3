import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'new.task.dart';

class page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Tasks'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "All Tasks",
              ),
              Tab(
                text: "Complete Tasks",
              ),
              Tab(
                text: "InComplete Tasks",
              ),
            ],
            isScrollable: true,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return NewTask();
                },
              ));
            }),
        body: TabBarView(
          children: [
            AllTasks(),
            CompleteTask(),
            INCompleteTask(),
          ],
        ),
      ),
    );
  }
}

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CompleteTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class INCompleteTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
