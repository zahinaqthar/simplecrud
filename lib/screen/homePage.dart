import 'package:flutter/material.dart';
import 'package:newtodoapp/model/kendaraan.dart';
import 'package:newtodoapp/screen/taskPage.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<kendaraan> _kendaraanlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Penjualan Kendaraan Bermotor"),
      ),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          color: Colors.black12,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.separated(
                      itemCount: _kendaraanlist.length,
                      itemBuilder: (context, index) {
                        final newitem = _kendaraanlist[index];
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 32.0, horizontal: 24.0),
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
                                      "${newitem.merk}",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${newitem.model}",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${newitem.typetran} / ${newitem.tahun} / Rp.${newitem.hp}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                            height: 1.5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 25,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 25,
                                      height: 25,
                                      child: GestureDetector(
                                        onTap: () async {
                                          final thisresult =
                                              await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          taskPage(
                                                            konst: newitem,
                                                            mode: FormMode.edit,
                                                          ))));
                                          if (thisresult is kendaraan) {
                                            setState(() {
                                              _kendaraanlist[index] =
                                                  thisresult;
                                            });
                                          }
                                        },
                                        child: Image(
                                          image:
                                              AssetImage("assets/editicon.png"),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      width: 25,
                                      height: 25,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _kendaraanlist.removeAt(index);
                                          });
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              "assets/deleteicon.png"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () async {
                    final thisresult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => taskPage(
                                  mode: FormMode.create,
                                ))));
                    if (thisresult is kendaraan) {
                      setState(() {
                        _kendaraanlist.add(thisresult);
                      });
                    }
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF7349FE),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image(image: AssetImage("assets/addicon.png")),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
