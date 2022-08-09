// To parse this JSON data, do
//
//     final inventoryProductDecoder = inventoryProductDecoderFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class InventoryProductDecoder {
  InventoryProductDecoder({
    required this.data,
    required this.message,
    required this.code,
  });

  List<InventoryProduct> data;
  String message;
  int code;

  factory InventoryProductDecoder.fromJson(String str) => InventoryProductDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InventoryProductDecoder.fromMap(Map<String, dynamic> json) => InventoryProductDecoder(
    data: List<InventoryProduct>.from(json["data"].map((x) => InventoryProduct.fromMap(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
    "code": code,
  };
}

class InventoryProduct {
  InventoryProduct({
    required this.id,
    required this.productId,
    required this.productName,
    required this.quantity,
  });

  int id;
  int? productId;
  String? productName;
  int? quantity;

  factory InventoryProduct.fromJson(String str) => InventoryProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InventoryProduct.fromMap(Map<String, dynamic> json) => InventoryProduct(
    id: json["id"],
    productId: json["product_id"],
    productName: json["product_name"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "product_name": productName,
    "quantity": quantity,
  };
}
