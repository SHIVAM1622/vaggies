import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


String cart_database_path;
Future<Database> cart_database;
 void getpath() async {
   cart_database_path = await getDatabasesPath();
  cart_database =  openDatabase(
   join(cart_database_path, 'cart_database.db'),
   onCreate: (db, version){
     return db.execute(
       "CREATE TABLE cart(item_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price INTEGER)"
     );
   },
   version: 1,
 );
 print(cart_database_path);
 }

Future insertItem(String veg_name, int veg_price) async{
  final Database db = await cart_database;
  await db.insert('cart', 
    {
      'name': veg_name,
      'price': veg_price
    }
  );

  final List<Map<String, dynamic>> maps = await db.query('cart');
  print(maps);
}

Future<List> getItems() async{
  final Database db = await cart_database;
  final List<Map<String, dynamic>> maps = await db.query('cart');
  return maps;
}

Future deleteItem(int veg_id) async{
  final Database db = await cart_database;
  await db.delete('cart',
    where: 'item_id = $veg_id',
  );
}


