// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:path/path.dart';
// import 'dart:async';

// class FirstScreen extends StatefulWidget {
//   @override
//   _FirstScreenState createState() => _FirstScreenState();
// }

// class _FirstScreenState extends State<FirstScreen> {
//   var picture, errorMsg;
//   List photos = [];
//   List price = [];
//   List names = [];
//   List picturesnames = [];
//   var name ;

//   var namesofvaggies;

//   @override
//   void initState() {
//     super.initState();
//     uploadingTostorage();
//     amount();
//   }

//   amount() async {
//     var _firestore = Firestore.instance;
//     final money = await _firestore.collection('Price').getDocuments();
//     for (var m in money.documents) {
//       for (var value in m.data.values) {
//         price.add(value);
//       }

//       for (var key in m.data.keys) {
//         names.add(key);
      
//       }
     
//     }
//   }

//   Future uploadingTostorage() async {
//     FirebaseStorage _storage = FirebaseStorage.instance;
//     setState(() {});
//     StorageReference firebaseStorageReffff =
//         FirebaseStorage.instance.ref().child("Testing");
//     var map = await firebaseStorageReffff.listAll();

//     var map2 = map['items'];
    
    
           
//     for (var key in map2.keys) {
       
//       var dowloadurlref = _storage.ref().child(map2[key]['path']);
//       var url2 = await dowloadurlref.getDownloadURL() as String;
//       photos.add(url2);
//       picturesnames.add(basename(url2));
     
    

//     }
//       print(picturesnames);
//   } 
//    sattingimages(){
//       for (var i = 0; i < names.length; i++) {
//           if(names[i] == picturesnames[1]){
             
//           }
//       }
//    }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       child: Column(
//         children: <Widget>[
         
//           Expanded(
//             child: Container(
      
//               child: ListView.builder(
                
//                 itemCount: price.length,
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.all(10.0),
                 
//                   child: Card(
//                       elevation: 16,
//                       color: Colors.white,
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: <Widget>[
//                             photos == null
//                                 ? Icon(Icons.image)
//                                 : CircleAvatar(
//                                     radius: 38,
//                                     backgroundImage:
//                                         NetworkImage(photos[index])),
//                             Column(
//                               children: <Widget>[
//                                 Text(
//                                   names[index],
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 Text('Details')
//                               ],
//                             ),
                         
//                             Text(
//                               price[index],
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                           ])),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
