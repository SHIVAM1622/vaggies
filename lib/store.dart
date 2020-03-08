import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cart extends StatefulWidget {
  final int prices;
  final String name;

  Cart({@required this.prices, this.name});

  @override
  _CartState createState() => _CartState(prices: prices, name: name);
}

class _CartState extends State<Cart> {
  _CartState({@required this.prices, @required this.name});
  var prices;
  String name;
  Map bill = {};
  


  @override
  void initState() {
    super.initState();
    bill = {
      name : prices
    };
    

  }
    List billing = [];
  settingupcard() async {
    var _firestore = Firestore.instance;
    var cart = await _firestore.collection('bills').getDocuments();

    for (var carts in cart.documents) {
      billing.add(carts.data['bill']);
    }
    setState(() {});
    print(billing);
  }

  @override
  Widget build(BuildContext context) {
    return widget.prices == null
        ? Center(child: Text("NO  PIcked"))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                "CART",
                style: TextStyle(color: Colors.black),
              ),
            ),
             body:
            
             Container(
              child: Column(
                children: <Widget>[
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.name.toString(),
                            style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic)),
                        Text(
                          widget.prices.toString(),
                          style: TextStyle(
                              fontSize: 29, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                          color: Colors.green,
                          onPressed: () {
                           
                            uploadingbill();
                             
                          },
                          child: Text(
                              "                      PAYMENT                        ")),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  // for uploading bill
  Future uploadingbill() async {
    var _firestore = Firestore.instance;

    await _firestore.collection('bills').add({

      'bill':bill,
      'TimeStamp': Timestamp.now()
    });
  }
}
