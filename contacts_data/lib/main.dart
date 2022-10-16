import 'package:contacts_data/update.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'contact.dart';
import 'dart:async';
import 'data_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 late String contact_name;
  late int contact_number;
   late String url;


late Dphelper help;
  @override
void initState() {
    // TODO: implement initState
    super.initState();
   help=Dphelper();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
          centerTitle: true,
          title: Text('Contacts',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),

          ),
        ),




    body: FutureBuilder(
      future: help.allcontacts(),
      builder:  (context, AsyncSnapshot snapshot)
{
   
        if(!snapshot.hasData){
        return CircularProgressIndicator();}

        else{
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount:  snapshot.data.length,
          
              itemBuilder: (context,index)
              {
              Contact my_cont=Contact.fromMap(snapshot.data[index]);
              return Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,

                 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      
                      
                      children: [
                       
                       Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          
                           image:DecorationImage(
                           fit: BoxFit.cover,
         
                           image:NetworkImage(my_cont.url2!))

                       )), 
                       Text(my_cont.name,
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize:20,
                       ),
                       
                       
                       ),

                       Text(my_cont.phone_number.toString(),
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize:20,
                       ),
                       
                       
                       ),
                        IconButton(
                            onPressed: (
                             
                            ) {
                              if (my_cont.id!=null)
                              {
                                help.delete(my_cont.id!);
                              }
                              setState(() {
                                
                              });
                            },
                            icon: Icon(Icons.delete,
                            size: 30,
                            color: Colors.red,
                            
                            ) ),
          









                      ]),
                  ),
                 
                 onTap: ()  async{
                 await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=>Update(my_cont))
                  );
                  setState(() {
                    
                  });
                 },

                ),


                

                 




                );
              }
       
        
        
        );
}}

      ),
































      floatingActionButton:  FloatingActionButton (
          child: Icon(Icons.add),
          onPressed:(){
            showModalBottomSheet(
              isScrollControlled: true,
                context: context,
                 builder: (BuildContext context)  {
                    return Padding(
                     padding: MediaQuery.of(context).viewInsets,
                    
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          height: 400,
                          child: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
           
            children: [
                  TextFormField(
                                      maxLines: null,
                                      decoration: InputDecoration(
                                        hintText: 'Contact Name',
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                 
                                 onChanged: (value)
                                 {
                                       contact_name=value;
                                 },
                                      
                                     //   controller:textController

                                    ),
                                     TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Contact Number',
                                         hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                           onChanged: (value){
                                       contact_number= int.parse(value);
                           },
                           
                                    // controller: datecontroller,
                                      
                                    ),
                                    TextFormField(
                                      maxLines: null,
                                      decoration: InputDecoration(
                                        
                                        hintText: 'Contact image url',
                                         hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                           onChanged: (value){
                                       url= value;
                           },),
                           
                              RaisedButton(
                                child: Text('save',
                                style: TextStyle(
              
                                  color: Colors.blue
                                ),
                                ),
                                onPressed:()
                                 async{
                                
                                setState(() {
                                  
                                Contact  mine = Contact({'name':contact_name,'number':contact_number,'url':url});
                                  
                                help.create_book(mine).then((value) =>  Navigator.of(context).pop());
                               // task_s.id=d;

                                 
                                });
                                
                              }  )
                              ]
              
                              ),
                              ),
                             ),
                        ),
                      ),
      
    );
           } );
   } )
     );
          
  }
}