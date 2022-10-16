import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'contact.dart';


class Dphelper{

static final Dphelper instance=Dphelper.internal();

factory Dphelper()=>instance;

Dphelper.internal(){}



 createDatabase()


async{
  Database db;
  WidgetsFlutterBinding.ensureInitialized();
  
  String path= join(await getDatabasesPath(),'book.db');


   db=await openDatabase(path,version: 1,onCreate: (Database Db,int v){ 
    Db.execute('CREATE TABLE contacts (id INTEGER PRIMARY KEY, name TEXT, url TEXT , number INTEGER)');

   });
   return db;


}



Future <Contact> create_book(Contact my_contact)

async {
   Database DP= await createDatabase();

   my_contact.id = await DP.insert('contacts', my_contact.toMap());
   return my_contact;

}


Future<List> allcontacts()
async {
   Database DP= await createDatabase();
     return DP.query('contacts');


}









Future <int> delete(int id)

async {
  Database DP= await createDatabase();
return await DP.delete('contacts',where: 'id=?' , whereArgs: [id]);
}



Future <int> update(Contact my_contact)

async {
  Database DP= await createDatabase();
return await DP.update('contacts', my_contact.toMap() ,where: 'id=?' , whereArgs: [my_contact.id] );
}




}