class Contact {

late String name;
 int? id;
late int phone_number;
 String ? url2;

Contact(Map <String,dynamic> contact)

{
  if (contact['id']!=null)
{
  this.id=contact['id'];}

  if (contact['url']!=null)
  {this.url2=contact['url'];}
  this.name=contact['name'];

  this.phone_number=contact['number'];




}

Contact.fromMap(Map <String,dynamic> contacts)
{
  this.id=contacts['id'];

  this.name=contacts['name'];

  this.phone_number=contacts['number'];

  this.url2=contacts['url'];
}

Map <String,dynamic> toMap()

{
 
Map <String,dynamic> map={'number':this.phone_number,'name':this.name};

if (this.id!=null)
{
  map['id']=this.id;
}

if (this.url2!=null)
{
  map['url']=this.url2;
}

return map;
}




}











