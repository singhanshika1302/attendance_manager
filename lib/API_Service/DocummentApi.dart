import 'package:edumarshals/Model/Document_Model.dart';
import 'package:http/http.dart' as http;
var base="https://dummyjson.com/products";

getdocument() async{
  Uri url=Uri.parse(base);
  var res=await http.get(url);


try{
if(res.statusCode==200){
  var data=documentModelFromJson(res.body);
  return data.products;
}
else{
  print("error durig connection");
}
} catch(e){
  print(e.toString());
  print("erororororo");
}
}
