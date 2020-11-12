// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hmtif/HalamanAspirasi.dart';

import 'package:hmtif/Animation/FadeAnimation.dart';
import 'package:hmtif/donasi/constant.dart';
import 'package:hmtif/donasi/info_screen.dart';
import 'package:hmtif/donasi/widgets/rounded_container.dart';

class Nominal extends StatefulWidget {
final String namaDonasi, deskripsi, shortDeskripsi, gambarDonasi, documentId, kategori;
  final int danaDonasi;
  Nominal({
    // @required this.isEdit,
    @required this.documentId,
    @required this.namaDonasi,
    @required this.deskripsi,
    @required this.shortDeskripsi,
    @required this.danaDonasi,
    @required this.gambarDonasi,
    @required this.kategori,
  });
@override
  _NominalState createState() => _NominalState();
  

}

  
class _NominalState extends State<Nominal> {
  int totalAmount = 0;
  var txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: 
        SingleChildScrollView(
          child: Column(children: <Widget>[
            Text(
              "Pilih Nominal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FadeAnimation(
              2,
              Row(
              children: <Widget>[
                 Expanded(
                    child: RoundedContainer(
                    color: kExpandedColor,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                         child : Text("Rp.10.000", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                          onPressed: () {
                          txt.text = "10.000";
                      }),

                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: RoundedContainer(
                    color: kExpandedColor,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                         child : Text("Rp.20.000", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                          onPressed: () {
                          txt.text = "20.000";
                      }),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            ),
            FadeAnimation(
              2,
                          Row(
              children: <Widget>[
                                Expanded(
                    child: RoundedContainer(
                   color: kExpandedColor,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                         child : Text("Rp.50.000", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                          onPressed: () {
                          txt.text = "50.000";
                      }),

                      ],
                    ),
                  ),
                ),
                                 Expanded(
                    child: RoundedContainer(
                    color: kExpandedColor,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                         child : Text("Rp.100.000", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,)),
                          onPressed: () {
                          txt.text = "100.000";
                      }),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            ),
            const SizedBox(height: 30.0,),
            FadeAnimation(
              2,
               Column(
                 children: <Widget>[
                    RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(
                 FontAwesomeIcons.paypal,
                  color: Colors.indigo,
                ),
                title: Text("Paypal"),
                trailing: Icon(Icons.arrow_forward_ios),
                ),
            ),
            RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(
                 FontAwesomeIcons.googleWallet,
                  color: Colors.indigo,
                ),
                title: Text("Google Pay"),
                trailing: Icon(Icons.arrow_forward_ios),
                ),
            ),
             RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(
                 FontAwesomeIcons.applePay,
                  color: Colors.indigo,
                ),
                title: Text("Apple Pay"),
                trailing: Icon(Icons.arrow_forward_ios),
                ),
            ),
                 ],
               ),
               
            ),
            Text("Jumlah nominal lainnya",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),),
            RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LimitedBox(
                    maxWidth: 150.0,
                    child: TextField(

                      controller: txt,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Masukkan nominal",
                      ),                  
                      onChanged: (value){
                        setState(() {
                          totalAmount = num.parse(value);
                        });
                      },
                      ),
                  ),
                ],
              ),
            ),
            
            // Container(
            //   width: double.infinity,
            //   padding:  const EdgeInsets.symmetric(
            //     vertical : 16.0,
            //     horizontal : 32.0,
            //   ),
            //   child: RaisedButton(
            //     elevation: 0,
            //     padding : const EdgeInsets.all(24.0),
            //     shape: RoundedRectangleBorder( 
            //       borderRadius: BorderRadius.circular(10.0)),
            //     child: Text("Continue"),
            //     color: Colors.indigo,
            //     textColor: Colors.white,
            //     onPressed: () {
                  
            //     },
            //   ),
            // ),
                    FadeAnimation(
                        2,
                        GestureDetector(
                          // onTap: () {
                          //   String documentId = widget.documentId;
                          //   String namaDonasi = widget.namaDonasi;
                          //   String deskripsi = widget.deskripsi;

                          //   int danaDonasi =
                          //       int.parse(widget.danaDonasi.toString());
                          //   DocumentReference documentReference =
                          //       FirebaseFirestore.instance
                          //           .collection("Donasi")
                          //           .document(documentId);
                          //   Map<String, dynamic> students = {
                          //     "namaDonasi": namaDonasi,
                          //     "deskripsi": deskripsi,
                          //     "danaDonasi": danaDonasi + 1,
                          //   };

                          //   documentReference
                          //       .setData(students)
                          //       .whenComplete(() {
                          //     print("$namaDonasi updated");
                          //   });
                          //   showDialog(
                          //       context: context,
                          //       builder: (BuildContext context) {
                          //         return AlertDialog(
                          //           title: Text(
                          //               'Terimakasih sudah berdonasi'),
                          //           actions: <Widget>[
                          //             FlatButton(
                          //               child: Text('OK'),
                          //               onPressed: () {
                          //                 Navigator.of(context).push(
                          //                     new MaterialPageRoute(
                          //                         builder:
                          //                             (BuildContext context) =>
                          //                                 new InfoScreen()));
                          //               },
                          //             ),
                          //           ],
                          //         );
                          //       });
                          // },
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kThemeColor,
                                ),
                            child: Center(
                              child: Text(
                                "Donasi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                        ),
                        const SizedBox(height: 10.0,),
          ]),
        ));

        
  }
  
}