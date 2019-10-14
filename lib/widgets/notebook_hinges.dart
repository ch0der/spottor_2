import 'package:flutter/material.dart';

class NotebookHinges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: hinges(),
    );
  }
  hinges() {
    final double spacing = 40;
    return Transform.scale(
      scale: .2,
      child: (Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
          Padding(
            padding: EdgeInsets.only(top: spacing),
          ),
          hinge(),
        ],
      )),
    );
  }

  hinge() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          bottom: -2.5,
          left: 38,
          child: Container(
            height: 17,
            width: 7,
            decoration: BoxDecoration(
              color: Colors.black87.withOpacity(.3),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black87.withOpacity(.4),
                    spreadRadius: 3,
                    blurRadius: 1)
              ],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 6,
              width: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey[600],
                    Colors.grey[300],
                    Colors.grey,
                  ],
                  stops: [
                    0,
                    .5,
                    1,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black87.withOpacity(.3),
                      offset: Offset(0, 1),
                      blurRadius: 2)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3),
            ),
            Container(
              height: 6,
              width: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.grey[600],
                  Colors.grey[300],
                  Colors.grey,
                ], stops: [
                  0,
                  .5,
                  1
                ]),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black87.withOpacity(.3),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 2)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
