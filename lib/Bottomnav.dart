
import 'package:flash_chat/newpage.dart';
import 'package:flutter/material.dart';
import './FrontScreen.dart';
import './store.dart';



class Bottomnav extends StatefulWidget {
  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Padding(
          padding: const EdgeInsets.only(top:25.0),
          child: DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: TabBar(
            // labelStyle: TextStyle( decoration:TextDecoration.overline, decorationThickness: double.infinity),
            labelColor: Colors.orange,
              tabs: [
                Tab(icon: Icon(Icons.show_chart)),
                Tab(icon: Icon(Icons.add_shopping_cart)),
              ],
            ),
          
          body:
           TabBarView(
            children: [
              FrontScreen(),
                Cart(prices: clearamount,
             
                )
            ],
          ),
      ),
    ),
        ));
  }
}
