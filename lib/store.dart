import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart_database.dart';

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
  // added by alankrit
  List items = [];
  bool isloading = true;
  // added by alankrit
  @override
  void initState() {
    super.initState();
    bill = {
      name : prices
    };
  // added by alankrit
    intialize();
  // added by alankrit  
  }
  
  // added by alankrit 
  void intialize() async{
    await getpath();
    items = await getItems();
    isloading = false;
    setState(() {
      
    });
    print(isloading);
  }
  // added by alankrit 

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
    return isloading
        ? // earlier // Center(child: Text("NO  PIcked"))
          /*now*/ Center(child: CircularProgressIndicator(),)
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
                  /* earlier 
                  >>>>>>>>>
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
                  <<<<<<<<<<<<<
                  */



                  // added by Alankrit >>>>>>>>>>>
                  Expanded(
                    child: 
                  ListView.builder( itemCount: items.length, 
                    itemBuilder: (BuildContext context, index){
                      return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: <Widget>[
                              Text('Rs. ${items[index]['price']}'),
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    await deleteItem(items[index]['item_id']);
                                    intialize();
                                    setState(() {
                                    
                                    });
                                  }),
                            ],
                          ),
                        ),
                        title: Text(items[index]['name']),
                      ),
                    ),
                  );
                    },
                  )
                  ,),
                  //<<<<<<<<<<<<<<<<< added by alankrit
                  //
                  //  ABOVE CODE WAS ADDED BY ALANKRIT
                  //
                  //      

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
