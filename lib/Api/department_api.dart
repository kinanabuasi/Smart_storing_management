// To parse this JSON data, do
//
//     final departmentDecoder = departmentDecoderFromMap(jsonString);

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
  List<DepartmentProduct> products;

  factory Department.fromJson(String str) => Department.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Department.fromMap(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
    products: List<DepartmentProduct>.from(json["products"].map((x) => DepartmentProduct.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "products": List<dynamic>.from(products.map((x) => x.toMap())),
  };
}

class DepartmentProduct {
  DepartmentProduct({
    required this.id,
    required this.departmentId,
    required this.name,
    required this.imagePath,
    required this.productCode,
    required this.purchasingPrice,
    required this.selingPrice,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int departmentId;
  String name;
  String imagePath;
  int productCode;
  int purchasingPrice;
  int selingPrice;
  String note;
  DateTime createdAt;
  DateTime updatedAt;

  factory DepartmentProduct.fromJson(String str) => DepartmentProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DepartmentProduct.fromMap(Map<String, dynamic> json) => DepartmentProduct(
    id: json["id"],
    departmentId: json["department_id"],
    name: json["name"],
    imagePath: json["image_path"],
    productCode: json["product_code"],
    purchasingPrice: json["purchasing_price"],
    selingPrice: json["seling_price"],
    note: json["note"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "department_id": departmentId,
    "name": name,
    "image_path": imagePath,
    "product_code": productCode,
    "purchasing_price": purchasingPrice,
    "seling_price": selingPrice,
    "note": note,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
