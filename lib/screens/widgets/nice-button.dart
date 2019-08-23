
import 'package:flutter/material.dart';

class NiceButton extends StatelessWidget {
  
  final String title;
  final Function todo;
  final double height;

  NiceButton({@required this.title, @required this.todo, this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Material(
            child: new MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),),
              elevation: 5.0,
              // minWidth: 200.0,
              height: this.height == null ? 35 : height,
              color: Color(0xFF801E48),
              child: new Text('$title',
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
              onPressed: () {
                //TODO: Goto
                todo();
              },
            ),
          ),
        ),
      ],
    );
  }
}