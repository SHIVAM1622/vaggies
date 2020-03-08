import './newpage.dart';
import 'package:flutter/material.dart';
import './store.dart';
import 'cart_database.dart';


class Vaggies extends StatefulWidget {
  final String imageurl;
  final String names;
  
  final String price;

  Vaggies({this.names, this.price, this.imageurl});

  @override
  _VaggiesState createState() => _VaggiesState();
}

class _VaggiesState extends State<Vaggies> {

  @override
  void dispose() {
    super.dispose();

    clearamount = 0;
  }

  @override
  void initState() {
    super.initState();

    totalamount = int.parse(widget.price);
    clearamount = totalamount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
              height: 400, width: 400, child: Image.network(widget.imageurl)),
          Card(
            elevation: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.names,
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      ' ₹Kg',
                      style: TextStyle(fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        widget.price,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: DropdownButton<String>(
                    focusColor: Colors.blue,
                    value: dropdownValue,
                    icon: Icon(
                      Icons.arrow_downward,
                   
                    ),
                    elevation: 16,
                    style: TextStyle(color: Colors.orange),
                    underline: Container(
                      color: Colors.black,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        pricecalculator();
                      });
                    },
                    items: <String>['1kg', '2kg', '3kg', '4kg', '5kg']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Text(
                    "Total_amount",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text(
                    clearamount.toString(),
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: MaterialButton(
              color: Colors.red,
              onPressed: ()async{
                await getpath();
                await insertItem(widget.names, clearamount);
                senddatatocart(
               
                  clearamount,widget.names
                );
              }
              ,
             child: Text("ADD TO CART")
            ),
          )
        ],
      ),
    );
  }
  senddatatocart(int prices,String name){
    Navigator.push((context),MaterialPageRoute(builder: (context)=>
     Cart(
        prices: clearamount,
        name:widget.names,
     )
    ));
  }
}
