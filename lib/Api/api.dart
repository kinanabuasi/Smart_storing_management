import 'dart:convert';

import 'package:eleven/Api/product_api.dart';
import 'package:eleven/Api/import.dart';
import 'package:eleven/Api/export_decoder.dart';
import 'package:eleven/Api/user.dart';
import 'package:eleven/sales/export.dart';
import 'package:http/http.dart' as http;

import 'dealer_api.dart';
import 'department_api.dart';
import 'inventory_product.dart';




class Api {

  static String token="";
  static User? user;

  static Future<List<Department>> getAllDepartment()async{

    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/get_all_department'));
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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

  static Future<List<ExportData>> getAllExport()async{

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };

    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/get_all_exports'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return ExportDecoder.fromMap(json.decode(jsonData)).data;
    }
    else {
      print(response.reasonPhrase);
      return <ExportData>[];
    }

  }

  static Future<List<ImportData>> getAllImport()async{

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };

    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/get_all_imports'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      print(jsonData);
      return ImportDecoder.fromMap(json.decode(jsonData)).data;
    }
    else {
      print(response.reasonPhrase);
      return <ImportData>[];
    }

  }

  static Future<Department?> getDepartmentById(int id)async{

    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/department_by_id/'+id.toString()));
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);
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
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);
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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);
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

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      return DealerDecoder.fromMap(json.decode(jsonData)).data;
    }
    else {
      print(response.reasonPhrase);
      return <Dealer>[];
    }

  }

  static Future<Dealer?> getDealerBytId(int id)async{
    var request = http.Request('GET', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/dealer_by_id/'+id.toString()));
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };
    request.headers.addAll(headers);

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


  ///------------------------------------------------------------------


  static Future<bool> login(String email,String pass)async{
    var headers = {
      'Accept': 'application/json'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/login'));
    request.fields.addAll({
      'email': email,
      'password': pass
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      var data = json.decode(jsonData);
      UserDecoder userDecoder = UserDecoder.fromMap(data);
      user = userDecoder.data.user;
      token = userDecoder.data.token;
      print(jsonData);

      print(token);
      return true;
    }
    else {
    print(response.reasonPhrase);
    return false;
    }

  }

  static Future<bool> regester(String email,String name,String pass)async{
    var headers = {
      'Accept': 'application/json'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/register'));
    request.fields.addAll({
      'email': email,
      'name': name,
      'password': pass,
      'password_confirmation': pass
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonData = await response.stream.bytesToString();
      var data = json.decode(jsonData);
      UserDecoder userDecoder = UserDecoder.fromMap(data);
      user = userDecoder.data.user;
      token = userDecoder.data.token;
      print(token);
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }


  static Future<Result> addExport(String bill_number,String shipping_charge_price,String dealer_id,String inventory_products,String inventory_products_qty)async{
    var headers = {
      'Authorization': 'Bearer '+token
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/add_export'));
    request.fields.addAll({
      'bill_number': bill_number,
      'shipping_charge_price': shipping_charge_price,
      'dealer_id': dealer_id,
      'inventory_products[0][id]': inventory_products,
      'inventory_products[0][quantity]': inventory_products_qty,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return Result("succ", true);
    }
    else {
      String data = await response.stream.bytesToString();
      var decoded = json.decode(data);
    print(response.reasonPhrase);
    return Result(decoded['message'], false);
    }

  }


  static Future<Result> addImport(String bill_number,String shipping_charge_price,String dealer_id,String inventory_products,String inventory_products_qty)async{
    var headers = {
      'Authorization': 'Bearer '+token
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://smart-warehouse-management.herokuapp.com/api/add_export'));
    request.fields.addAll({
      'bill_number': bill_number,
      'shipping_charge_price': shipping_charge_price,
      'dealer_id': dealer_id,
      'inventory_products[0][id]': inventory_products,
      'inventory_products[0][quantity]': inventory_products_qty,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return Result("succ", true);
    }
    else {
      String data = await response.stream.bytesToString();
      var decoded = json.decode(data);
      print(response.reasonPhrase);
      return Result(decoded['message'], false);
    }

  }
}


class Result {
  String msg;
  bool succ;

  Result(this.msg, this.succ);
}

