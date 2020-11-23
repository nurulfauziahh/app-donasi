// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hmtif/donasi/info_screen.dart';
import 'package:hmtif/Animation/FadeAnimation.dart';

class DetailDonasi extends StatefulWidget {
  // final DocumentSnapshot MyStudent;
  // DetailDonasi({this.MyStudent});
  final String namaDonasi, deskripsi, documentId, kategori, gambarDonasi,danaDonasi;
  // final int danaDonasi;
  DetailDonasi({
    // @required this.isEdit,
    @required this.documentId,
    @required this.namaDonasi,
    @required this.deskripsi,
    @required this.danaDonasi,
    @required this.kategori,
    @required this.gambarDonasi,
  });
  @override
  _DetailDonasiState createState() => _DetailDonasiState();
}

class _DetailDonasiState extends State<DetailDonasi> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeAnimation(
                        1,
                        Container(
                           child: Image.network(widget.gambarDonasi.toString(),
                                                                      // width: 300,
                                                                        height: 150,
                                                                        fit:BoxFit.fill

                    ),
                        )
                        ),
                  ),
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
                          widget.namaDonasi,
                          style: TextStyle(
                              color: Color.fromRGBO(49, 39, 79, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    // Text(
                    //   "Dana terkumpul",
                    //           style:
                    //               TextStyle(color: Colors.grey, fontSize: 10),
                    // ),
                    FadeAnimation(
                        1.5,
                        Row(
                          children: <Widget>[
                            new Text(
                              "Rp. 2000000 dana terkumpul dari "+ widget.danaDonasi,
                              style: TextStyle(color: Colors.grey, fontSize: 10),
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
                        Text(
                          "Deskripsi",
                          style: TextStyle(
                              color: Color.fromRGBO(49, 39, 79, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    FadeAnimation(
                        1.5,
                        Text(
                          widget.deskripsi,
                          style: TextStyle(
                              color: Color.fromRGBO(49, 39, 79, 1),
                              fontSize: 12),
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),

                    FadeAnimation(
                        2,
                        GestureDetector(
                          onTap: () {
                            String documentId = widget.documentId;
                            String namaDonasi = widget.namaDonasi;
                            String deskripsi = widget.deskripsi;
                            String kategori = widget.kategori;
                            String gambarDonasi = widget.gambarDonasi.toString();

                            int danaDonasi =
                                int.parse(widget.danaDonasi.toString());
                            DocumentReference documentReference =
                                FirebaseFirestore.instance
                                    .collection("Donasi")
                                    .document(documentId);
                            Map<String, dynamic> students = {
                              "namaDonasi": namaDonasi,
                              "deskripsi": deskripsi,
                              "danaDonasi": danaDonasi + 1,
                            };

                            documentReference
                                .setData(students)
                                .whenComplete(() {
                              print("$namaDonasi updated");
                            });
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        'Terimakasih sudah menyetujui aspirasi dan keluhan ini,silahkan liat aspirasi dan keluhan yang lain'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          new DetailDonasi()));
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
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
                                "Donasi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
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





// class DetailDonasi extends StatefulWidget {
//   // final DocumentSnapshot MyStudent;
//   // DetailDonasi({this.MyStudent});
//   final String namaDonasi, deskripsi, documentId, gambarDonasi, kategori;
//   final int danaDonasi;
//   DetailDonasi({
//     // @required this.isEdit,
//     @required this.documentId,
//     @required this.namaDonasi,
//     @required this.deskripsi,
//     @required this.danaDonasi,
//     @required this.kategori,
//     @required this.gambarDonasi,
//   });
//   @override
//   _DetailDonasiState createState() => _DetailDonasiState();
// }

// class _DetailDonasiState extends State<DetailDonasi> {
//  @override
//   Widget build(BuildContext context) {
//     // final ControllerDatabase database = new ControllerDatabase();

//     final width = MediaQuery.of(context).size.width;
//     Size size = MediaQuery.of(context).size;
//     var delay = 1.5;
//     // final progress = widget.danaDonasi;
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: false,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Text("Detail Aspirasi dan Keluhan",
//               style: TextStyle(color: Colors.black)),
//           leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Navigator.of(context).push(new MaterialPageRoute(
//                     builder: (BuildContext context) => new InfoScreen()));
//               })),
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           decoration: new BoxDecoration(
//               gradient: new LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromARGB(255, 116, 198, 157),
//               Color.fromARGB(237, 8, 28, 21)
//             ],
//           )),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(40),
//                       bottomRight: Radius.circular(40),
//                     )),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 0),
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Stack(children: <Widget>[
//                           Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Image.asset("img/orang.jpg"),
//                                     Center(
//                                       child: Text(widget.namaDonasi,
//                                           style: TextStyle(
//                                               color:
//                                                   Color.fromRGBO(49, 39, 79, 1),
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 20)),
//                                     ),
//                                     new Padding(
//                                         padding:
//                                             EdgeInsets.fromLTRB(0, 10, 0, 0)),
//                                     FadeAnimation(
//                                         1.5,
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: <Widget>[
//                                             Center(
//                                               child: new Text(
//                                                 "widget.danaDonasi.toString()",
//                                                 style: TextStyle(
//                                                     color: Colors.green,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                             Center(
//                                               child: new Text(
//                                                 " mahasiswa telah menyetujui aspirasi dan keluhan ini",
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 10),
//                                               ),
//                                             ),
//                                           ],
//                                         )),
//                                     new Padding(padding: EdgeInsets.all(3)),
//                                     FadeAnimation(
//                                         1.5,
//                                         Stack(
//                                           children: <Widget>[
//                                             Container(
//                                               width: 350,
//                                               height: 10,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.grey[200],
//                                                   borderRadius:
//                                                       BorderRadius.circular(5)),
//                                             ),
//                                             // Material(
//                                             //   borderRadius:
//                                             //       BorderRadius.circular(5),
//                                             //   child: AnimatedContainer(
//                                             //     height: 10,
//                                             //     width: progress * 1.0,
//                                             //     duration:
//                                             //         Duration(milliseconds: 100),
//                                             //     decoration: BoxDecoration(
//                                             //         color: Colors.lightGreen,
//                                             //         borderRadius:
//                                             //             BorderRadius.circular(
//                                             //                 5)),
//                                             //   ),
//                                             // )
//                                           ],
//                                         )),
//                                     new Padding(
//                                         padding:
//                                             EdgeInsets.fromLTRB(0, 10, 0, 0)),
//                                     FadeAnimation(
//                                         1.5,
//                                         Center(
//                                           child: Text(
//                                             "Deskripsi",
//                                             style: TextStyle(
//                                                 color: Color.fromRGBO(
//                                                     49, 39, 79, 1),
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 20),
//                                           ),
//                                         )),
//                                     FadeAnimation(
//                                         1.5,
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 5, horizontal: 10),
//                                           child: Center(
//                                             child: Text(
//                                               widget.deskripsi,
//                                               style: TextStyle(
//                                                   color: Color.fromRGBO(
//                                                       49, 39, 79, 1),
//                                                   fontSize: 12),
//                                             ),
//                                           ),
//                                         )),
//                                   ]))
//                         ]),
//                       )
//                     ]),
//               ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         //
              //         new Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),

              //         FadeAnimation(
              //             2,
              //             GestureDetector(
              //               onTap: () {
              //                 String documentId = widget.documentId;
              //                 String name = widget.name;
              //                 String deskripsi = widget.deskripsi;

              //                 int jumlahLike =
              //                     int.parse(widget.jumlahLike.toString());
              //                     database.updateJumlah(name, deskripsi, jumlahLike, documentId);
              //                 // DocumentReference documentReference =
              //                 //     FirebaseFirestore.instance
              //                 //         .collection("Aspirasi")
              //                 //         .document(documentId);
              //                 // Map<String, dynamic> students = {
              //                 //   "name": name,
              //                 //   "deskripsi": deskripsi,
              //                 //   "jumlahLike": jumlahLike + 1,
              //                 //   "status": status,
              //                 // };

              //                 // documentReference
              //                 //     .setData(students)
              //                 //     .whenComplete(() {
              //                 //   print("$name updated");
              //                 // });
              //                 showDialog(
              //                     context: context,
              //                     builder: (BuildContext context) {
              //                       return AlertDialog(
              //                         title: Text(
              //                             'Terimakasih sudah menyetujui aspirasi dan keluhan ini'),
              //                         actions: <Widget>[
              //                           FlatButton(
              //                             child: Text('OK'),
              //                             onPressed: () {
              //                               Navigator.of(context).push(
              //                                   new MaterialPageRoute(
              //                                       builder: (BuildContext
              //                                               context) =>
              //                                           new Home()));
              //                             },
              //                           ),
              //                         ],
              //                       );
              //                     });
              //               },
              //               child: Container(
              //                 height: 50,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   gradient: LinearGradient(colors: [
              //                     Color.fromARGB(200, 218, 215, 205),
              //                     Color.fromARGB(255, 163, 177, 138),
              //                   ]),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Colors.white.withOpacity(0.2),
              //                       spreadRadius: 2,
              //                       blurRadius: 2,
              //                       offset: Offset(
              //                           0, 2), // changes position of shadow
              //                     ),
              //                   ],
              //                 ),
              //                 child: Center(
              //                   child: Text(
              //                     "Setuju",
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ),
              //               ),
              //             )),
              //       ]),
              // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
