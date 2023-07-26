import "package:flutter/material.dart";

class DialogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 220,
        width: 200,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
