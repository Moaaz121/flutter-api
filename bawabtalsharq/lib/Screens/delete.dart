import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Delete extends StatefulWidget {
  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // drawerEnableOpenDragGesture: true,
        drawer: Drawer(
          child: Column(
            children: [
              AppBar(
                title: Text('setting'),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                focusColor: Colors.black,
                title: Text("general"),
                onTap: () {
                  print('general');
                },
              ),
              ListTile(
                focusColor: Colors.black,
                title: Text("private"),
                onTap: () {
                  print('private');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Bawabet shareq'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: ('product'),
                icon: Icon(
                  Icons.accessibility_new_outlined,
                  color: Colors.amberAccent,
                ),
              ),
              Tab(
                  text: ('sale'),
                  icon: Icon(
                    Icons.add_circle_sharp,
                    color: Colors.black87,
                  )),
              Tab(
                text: ('price'),
              )
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              height: 55,
              color: Colors.blue,
              child: FlatButton(
                focusColor: Colors.greenAccent,
                onPressed: () {},
              ),
            ),
            Expanded(child: Text('eslam alaa ')),
            TextField(
              decoration: InputDecoration(
                  labelText: ('eslam'), filled: true, fillColor: Colors.grey),
              keyboardType: TextInputType.number,
            ),
            Expanded(flex: 3, child: Text('eslam alaa '))
          ],
        ),
      ),
    );
  }
}
