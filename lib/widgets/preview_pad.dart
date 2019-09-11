import 'package:flutter/material.dart';

class PreviewPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text("Index $index"),
          ),
        ),
        itemCount: 20,
        separatorBuilder: (context, index) => Divider(
          height: 2,
          color: Colors.blue,
        ),
      ),
    );
  }
}
