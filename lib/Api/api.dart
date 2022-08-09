import 'dart:convert';

import 'package:eleven/Api/product_api.dart';
import 'package:http/http.dart' as http;

import 'dealer_api.dart';
import 'department_api.dart';
import 'inventory_product.dart';




class Api {

  static Future<List<Department>> getAllDepartment()async{

    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/get_all_department'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return DepartmentDecoder.fromMap(json.decode(jsonData)).data;
    }
    else {
      print(response.reasonPhrase);
      return <Department>[];
    }

  }

  static Future<Department?> getDepartmentById(int id)async{

    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/department_by_id/'+id.toString()));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return Department.fromMap(json.decode(jsonData)['data']);
    }
    else {
      print(response.reasonPhrase);
      return null;
    }

  }

  static Future<bool> AddDepartment(String name)async{

    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/add_department'));
    request.fields.addAll({
      'name': name
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<bool> editDepartment(String name,String _method ,int id)async{

    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/update_department_by_id/'+id.toString()));
    request.fields.addAll({
      'name': name,
      '_method': _method
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<bool> deleteDepartment(int id)async{

    var request = http.Request('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/delete_department_by_id/'+id.toString()));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }


  static Future<List<Product>> getAllProduct()async{

    var headers = {
      'Accept': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/get_all_products'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return ProductDecoder.fromMap(json.decode(jsonData)).data;
    }
    else {
      print(response.reasonPhrase);
      return <Product>[];
    }

  }

  static Future<Product?> getProductBtId(int id)async{
    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/product_by_id/'+id.toString()));


    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return Product.fromMap(json.decode(jsonData)['data']);
    }
    else {
      print(response.reasonPhrase);
      return null;
    }

  }

  static Future<bool> addProduct(
      String name,int dep_id,int product_code,int purchasing_price,
      int seling_price,String note,String imagePath)async{
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/add_product'));
    request.fields.addAll({
      'name': name,
      'department_id': dep_id.toString(),
      'product_code': product_code.toString(),
      'purchasing_price': purchasing_price.toString(),
      'seling_price': seling_price.toString(),
      'note': note
    });
    request.files.add(await http.MultipartFile.fromPath('image_path', imagePath));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    return true;
    }
    else {
    print(response.reasonPhrase);
    return false;
    }

  }

  static Future<bool> editProduct(String name,int dep_id,int product_code,int purchasing_price,int seling_price,String note,String imagePath,int id)async{
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/update_product_by_id/'+id.toString()));
    request.fields.addAll({
      'name': name,
      'department_id': dep_id.toString(),
      'product_code': product_code.toString(),
      'purchasing_price': purchasing_price.toString(),
      'seling_price': seling_price.toString(),
      'note': note
    });
    request.files.add(await http.MultipartFile.fromPath('image_path', imagePath));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

  static Future<bool> deleteProduct(int id)async{
    var request = http.Request('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/delete_product_by_id/'+id.toString()));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
    print(response.reasonPhrase);
    return false;
    }

  }

  static Future<List<InventoryProduct>> getAllInventoryProduct()async{

    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/get_all_inventory_products'));


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return InventoryProductDecoder.fromMap(json.decode(jsonData)).data;
    }
    else {
      print(response.reasonPhrase);
      return <InventoryProduct>[];
    }

  }

  static Future<InventoryProduct?> getInventoryProductBytId(int id)async{
    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/product_by_id/'+id.toString()));

    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return InventoryProduct.fromMap(json.decode(jsonData)['data']);
    }
    else {
      print(response.reasonPhrase);
      return null;
    }

  }

  static Future<bool> addInventoryProduct(int product_id,int qty)async{
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/add_inventory_products'));
    request.fields.addAll({
      'product_id': product_id.toString(),
      'quantity': qty.toString()
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }


  }

  static Future<bool> editInventoryProduct(int product_id,int qty,String _method,int id)async{
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/update_inventory_products_by_id/'+id.toString()));
    request.fields.addAll({
      'product_id': product_id.toString(),
      'quantity': qty.toString(),
      '_method': _method
    });



    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<bool> deleteInventoryProduct(int id )async{
    var request = http.Request('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/delete_inventory_products_by_id/'+id.toString()));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }



  static Future<List<Dealer>> getAllDealer()async{

    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/get_all_dealers'));


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return DealerDecoder.fromMap(json.decode(jsonData)).data;
    }
    else {
      print(response.reasonPhrase);
      return <Dealer>[];
    }

  }

  static Future<Dealer?> getDealerBytId(int id)async{
    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/dealer_by_id/'+id.toString()));


    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return Dealer.fromMap(json.decode(jsonData)['data']);
    }
    else {
      print(response.reasonPhrase);
      return null;
    }

  }

  static Future<bool> addDealer(String name,String adddress,String country,String city,String dealer_type,String phone)async{
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/add_dealer'));
    request.fields.addAll({
      'name': name,
      'address': adddress,
      'country': country,
      'city': city,
      'dealer_type': dealer_type,
      'mobile_number': phone
    });



    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }


  }

  static Future<bool> editDealer(String name,String adddress,String country,String city,String dealer_type,String phone,int id)async{
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/update_dealer_by_id/'+id.toString()));
    request.fields.addAll({
      'name': name,
      'address': adddress,
      'country': country,
      'city': city,
      'dealer_type': dealer_type,
      'mobile_number': phone
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<bool> deleteDealer(int id )async{
    var request = http.Request('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/delete_dealer_by_id/'+id.toString()));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }

}

