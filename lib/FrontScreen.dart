import 'package:flutter/material.dart';
import './Vaggies.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


class FrontScreen extends StatefulWidget {

  @override

  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  
  List names = [];
  List imageurl = [];
   var wait = true;
  List price = [];
  @override
  void initState() {
    super.initState();
     amount();
     wait = false;
  }
   amount() async {
    var _firestore = Firestore.instance;
    final money = await _firestore.collection('veggies').getDocuments();

    for (var m in money.documents) {
      price.add(m.data['price']);
      imageurl.add(m.data.values.last);
      names.add(m.data.values.first);
    

    } 
   setState(() {
     wait = true;

   });
    
  }
   
 
  @override
  Widget build(BuildContext context) {
    
    return   Container(
      child: wait == false ? Center(child:  Image( image: AssetImage('images/loading.gif')),) : ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                      selectedata(imageurl[index], names[index],
                          price[index]);
                    },
                  child: Card(
                    elevation: 16,
                   
                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 46,
                            backgroundImage: imageurl == null ?  AssetImage('images/loading.gif') :
                             NetworkImage(
                              imageurl[index],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Text(
                              names[index],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  ' ₹',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text(
                                  price[index],
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
             
                  ),
                ),
              )),
    );
  }

  selectedata(String imageurl,String names,String price) {
    Navigator.push(
        (context),
        MaterialPageRoute(
            builder: (context) => Vaggies(
                imageurl:  imageurl,
                 names: names,
                  price: price,
                )));
  }
}
