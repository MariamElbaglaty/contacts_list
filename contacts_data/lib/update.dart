
import 'package:flutter/material.dart';
import 'contact.dart';
import 'dart:async';
import 'data_base.dart';
class Update extends StatefulWidget {
  Contact contacts;
  Update(this.contacts)
  {}
 

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

late Dphelper help;

TextEditingController tename=TextEditingController();
TextEditingController tenumber=TextEditingController();
TextEditingController teurl=TextEditingController();


  @override
void initState() {
    // TODO: implement initState
    super.initState();
      tename.text=widget.contacts.name;

      tenumber.text=widget.contacts.phone_number.toString();

      teurl.text=widget.contacts.url2!;

   help=Dphelper();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Contact Details', 
        
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.blue
        ),
        
        
        
        ) ,
      ),
    
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              
                               image:DecorationImage(
                               fit: BoxFit.cover,
             
                               image:NetworkImage(widget.contacts.url2!))
      
                           )), 
      
      
                  TextField(
                    controller: tename,
                  ),
      
                    TextField(
                    controller: tenumber,
                  ),
      
                   TextField(
                    maxLines: null,
                    controller: teurl,

                  ),
      
                 RaisedButton(
                  child: Text('Save',
                    
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    
                    ), 
                  
                  onPressed: () async{
                     
                    
                    setState(() {
                      Contact my_contacts=Contact(
                       {
                       'id':widget.contacts.id,
                       'url': teurl.text,
                       'name': tename.text,
                        'number': int.parse(tenumber.text)
                       }
                      );
                      
                      help.update(my_contacts).then((value) =>   Navigator.of(context).pop());
                    
                    });
      
      
      
      
      
      
      
      
                  }
                  ),
      
      
                  RaisedButton(
                  
                    child: Text('Cancel',
                    
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    
                    ),
      
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  }
                  ),
      
      
      
      
      
      
      
      
      
      
      
      
                ],
      
      
      
      
      
      
      
      
      
          ),
        ),
      ),











    );
  }
}