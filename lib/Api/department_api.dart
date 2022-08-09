// To parse this JSON data, do
//
//     final departmentDecoder = departmentDecoderFromMap(jsonString);

import 'package:eleven/Api/product_api.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class DepartmentDecoder {
  DepartmentDecoder({
    required this.data,
    required this.message,
    required this.code,
  });

  List<Department> data;
  String message;
  int code;

  factory DepartmentDecoder.fromJson(String str) => DepartmentDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DepartmentDecoder.fromMap(Map<String, dynamic> json) => DepartmentDecoder(
    data: List<Department>.from(json["data"].map((x) => Department.fromMap(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
    "code": code,
  };
}

class Department {
  Department({
    required this.id,
    required this.name,
    required this.products,
  });

  int id;
  String name;
  List<Product> products;

  factory Department.fromJson(String str) => Department.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Department.fromMap(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
    products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "products": List<dynamic>.from(products.map((x) => x.toMap())),
  };
}
