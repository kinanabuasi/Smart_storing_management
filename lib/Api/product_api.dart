// To parse this JSON data, do
//
//     final productDecoder = productDecoderFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ProductDecoder {
  ProductDecoder({
    required this.data,
    required this.message,
    required this.code,
  });

  List<Product> data;
  String message;
  int code;

  factory ProductDecoder.fromJson(String str) => ProductDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductDecoder.fromMap(Map<String, dynamic> json) => ProductDecoder(
    data: List<Product>.from(json["data"].map((x) => Product.fromMap(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
    "code": code,
  };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.departmentName,
    required this.departmentId,
    required this.imagePath,
    required this.productCode,
    required this.purchasingPrice,
    required this.selingPrice,
    required this.note,
  });

  int id;
  String name;
  String departmentName;
  int departmentId;
  String imagePath;
  int productCode;
  int purchasingPrice;
  int selingPrice;
  String note;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    departmentName: json["department_name"]==null?"":json["department_name"],
    departmentId: json["department_id"],
    imagePath: json["image_path"],
    productCode: json["product_code"],
    purchasingPrice: json["purchasing_price"],
    selingPrice: json["seling_price"],
    note: json["note"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "department_name": departmentName,
    "department_id": departmentId,
    "image_path": imagePath,
    "product_code": productCode,
    "purchasing_price": purchasingPrice,
    "seling_price": selingPrice,
    "note": note,
  };
}
