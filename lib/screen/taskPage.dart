import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:newtodoapp/model/kendaraan.dart';

enum FormMode { create, edit }

class taskPage extends StatefulWidget {
  taskPage({Key? key, this.konst, required this.mode}) : super(key: key);
  @override
  State<taskPage> createState() => _taskPageState();

  final kendaraan? konst;
  final FormMode mode;
}

class _taskPageState extends State<taskPage> {
  TextEditingController merkcontroller = TextEditingController();
  TextEditingController modelcontroller = TextEditingController();
  TextEditingController tahuncontroller = TextEditingController();
  TextEditingController hpcontroller = TextEditingController();

  static final List<String> list = <String>['Matic', 'Manual', 'Sport'];
  String dropdownValue = list.first;

  @override
  initState() {
    super.initState();
    if (widget.mode == FormMode.edit) {
      merkcontroller.text = widget.konst!.merk;
      modelcontroller.text = widget.konst!.model;
      dropdownValue = widget.konst!.typetran;
      tahuncontroller.text = widget.konst!.tahun;
      hpcontroller.text = widget.konst!.hp;
    }
  }

  getdata() {
    return kendaraan(
        merk: merkcontroller.text,
        model: modelcontroller.text,
        typetran: dropdownValue,
        tahun: tahuncontroller.text,
        hp: hpcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.mode == FormMode.create
                ? "Tambah Data Kendaraan"
                : "Edit Data Kendaraan")),
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: merkcontroller,
                      decoration: InputDecoration(
                          label: Text("Merk Motor"),
                          icon: Icon(Icons.motorcycle),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: modelcontroller,
                      decoration: InputDecoration(
                          label: Text("Model Motor"),
                          icon: Icon(Icons.settings_ethernet),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 50, bottom: 10),
                            child: Text("Tipe"),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.handyman),
                              Container(
                                width: 310,
                                padding: EdgeInsets.only(left: 12),
                                margin: EdgeInsets.only(left: 17),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border: Border.all()),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 17),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: tahuncontroller,
                      decoration: InputDecoration(
                          label: Text("Tahun Produksi"),
                          icon: Icon(Icons.date_range),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: hpcontroller,
                      decoration: InputDecoration(
                          label: Text("Harga"),
                          icon: Icon(Icons.wallet),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0.0,
                left: 160,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, getdata());
                    },
                    child: Container(
                      height: 20,
                      width: 66,
                      child: Center(
                        child: Text(
                          widget.mode == FormMode.create
                              ? "Tambah Data"
                              : "Edit  Data ",
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    )))
          ],
        ));
  }
}
