// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hmtif/HalamanAspirasi.dart';

import 'package:hmtif/Animation/FadeAnimation.dart';
import 'package:hmtif/donasi/details/nominal.dart';
import 'package:hmtif/donasi/info_screen.dart';

const CHANNEL = "com.donasi.hmtif.channel";
const KEY_NATIVE = "showPaymentGateway";

class DetailDonasi extends StatefulWidget {
  // final DocumentSnapshot MyStudent;
  // DetailAspirasi({this.MyStudent});



  final String namaDonasi,
      deskripsi,
      shortDeskripsi,
      gambarDonasi,
      documentId,
      kategori;
  final int danaDonasi;
  DetailDonasi({
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
  _DetailDonasiState createState() => _DetailDonasiState();
}

class _DetailDonasiState extends State<DetailDonasi> {

  static const platform = const MethodChannel(CHANNEL);


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

// Image.asset(
//       "assets/images/wear_mask.png",
//       height: size.height * 0.25,
//       width: double.infinity,
//       // it cover the 25% of total height
//       fit: BoxFit.fill,
//     );
    var delay = 1.5;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  // Positioned(
                  //   top: -40,
                  //   height: 400,
                  //   width: width,
                  //   child: FadeAnimation(
                  //       1,
                  //       Container(
                  //         decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //                 image: AssetImage('img/background-1.png'),
                  //                 fit: BoxFit.fill)),
                  //       )),
                  // ),
                  Positioned(
                    child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/3.jpg'),
                                  fit: BoxFit.fill)),
                        )),
                  ),
                  // Positioned(
                  //   child: FadeAnimation(
                  //       1.6,
                  //       Container(
                  //         margin: EdgeInsets.only(top: 50),
                  //         child: Center(
                  //           child: Text(
                  //             "Detail Donasi",
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 40,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       )),
                  // )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1.5,
                        Text(
                          // widget.namaDonasi,
                          widget.namaDonasi.toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(49, 39, 79, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),

                    FadeAnimation(
                        1.5,
                        Row(
                          children: <Widget>[
                            new Text(
                              widget.danaDonasi.toString(),
                              // widget.danaDonasi.toString(),
                              style: TextStyle(color: Colors.green),
                            ),
                            new Text(
                              " Jumlah Dana yang terkumpul",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ],
                        )),
                    new Padding(padding: EdgeInsets.all(3)),
                    FadeAnimation(
                        1.5,
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 350,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              child: AnimatedContainer(
                                height: 10,
                                width: 350 * 0.5,
                                duration: Duration(milliseconds: 500),
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            )
                          ],
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    FadeAnimation(
                        1.5,
                        Stack(
                          children: <Widget>[
                            new Text(
                             "kategori : "+widget.kategori,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            )
                          ],
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    FadeAnimation(
                        1.5,
                        Stack(
                          children: <Widget>[
                            new Text(
                              widget.deskripsi,
                              style: TextStyle(
                                  color: Color.fromRGBO(49, 39, 79, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )
                          ],
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),

                    // FadeAnimation(
                    //     2,
                    // StreamBuilder(
                    //   stream: Firestore.instance
                    //         .collection("Donasi")
                    //         .snapshots(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasData) {
                    //         itemBuilder: (context, index) {
                    //             DocumentSnapshot documentSnapshot =
                    //                 snapshot.data.documents[index];
                    //             Map<String, dynamic> task =
                    //          documentSnapshot.data();
                    //                 GestureDetector(
                    //        child : Container (
                            
                    //         padding : const EdgeInsets.all(24.0),
                    //         child: Text("Continue"),
                    //         color: Colors.indigo,
                    //             ),
                    //             onTap: () async {
                    //                   bool result = await Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(builder: (context) {
                    //                       return Nominal(
                    //                         documentId:
                    //                             documentSnapshot.documentID,
                    //                         namaDonasi: task['namaDonasi'],
                    //                         shortDeskripsi: task['shortDeskripsi'],
                    //                         danaDonasi: task['danaDonasi'],
                    //                         deskripsi: task['deskripsi'],
                    //                         kategori: task['kategori'],
           
                    //                       );
                    //                     }),
                    //                   );
                    //                 });
                    //        };
                    //       } else {
                    //         return Container();
                    //       }
                    //     }),
                    // ),

                    FadeAnimation(
                        2,
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                            _showNativeView();

//                                              new MaterialPageRoute(
//                                                  builder:
//                                                      (BuildContext context) =>
//                                                          new Nominal()));
//                            String documentId = widget.documentId;
//                            String namaDonasi = widget.namaDonasi;
//                            String deskripsi = widget.deskripsi;

                            
                            
                            int danaDonasi =
                                int.parse(widget.danaDonasi.toString());
                            DocumentReference documentReference =
                                FirebaseFirestore.instance
                                    .collection("Donasi")
                                    .document(documentId);
                            // Map<String, dynamic> donasis = {
                            //   "namaDonasi": namaDonasi,
                            //   "deskripsi": deskripsi,
                            //   "danaDonasi": danaDonasi + 1,
                            // };

                            // documentReference
                            //     .setData(donasis)
                            //     .whenComplete(() {
                            //   print("$namaDonasi updated");
                            // }
                            // );
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return AlertDialog(
                            //         title: Text(
                            //             'Terimakasih sudah menyetujui aspirasi dan keluhan ini,silahkan liat aspirasi dan keluhan yang lain'),
                            //         actions: <Widget>[
                            //           FlatButton(
                            //             child: Text('OK'),
                            //             onPressed: () {
                            //               Navigator.of(context).push(
                            //                   new MaterialPageRoute(
                            //                       builder:
                            //                           (BuildContext context) =>
                            //                               new Nominal()));
                            //             },
                            //           ),
                            //         ],
                            //       );
                            //     });
//                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                              child: Text(
                                "Setuju",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),

                


                              
                            // onPressed : (){
                            //   Navigator.of(context).push(
                            //                   new MaterialPageRoute(
                            //                       builder:
                            //                           (BuildContext context) =>
                            //                               new InfoScreen()));
                            // }
                 
                          

                        
                    // FadeAnimation(
                    //     1.5,
                    //     Text(
                    //       "Deskripsi",
                    //       style: TextStyle(
                    //           color: Color.fromRGBO(49, 39, 79, 1),
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20),
                    //     )),
              ]),
            ),
            // FadeAnimation(
            //     1.8,
            //     Card(
            //         child: ListTile(
            //             title: Text(widget.MyStudent.data()["name"])))),
          ],
        ),
      ),
    );
  }
}

