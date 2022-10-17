import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newtodoapp/model/kendaraan.dart';
import 'package:newtodoapp/screen/taskPage.dart';

class taskCardWidget extends StatelessWidget {
  final String title;
  final String desc;
  taskCardWidget({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    desc,
                    style: TextStyle(
                        fontSize: 16, color: Colors.black87, height: 1.5),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 15,
            child: Row(
              children: <Widget>[
                Container(
                  width: 25,
                  height: 25,
                  child: GestureDetector(
                    onTap: () {},
                    child: Image(
                      image: AssetImage("assets/editicon.png"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 25,
                  height: 25,
                  child: GestureDetector(
                    child: Image(
                      image: AssetImage("assets/deleteicon.png"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
