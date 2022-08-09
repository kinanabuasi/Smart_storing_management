// To parse this JSON data, do
//
//     final importDecoder = importDecoderFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ImportDecoder {
  ImportDecoder({
    required this.data,
    required this.message,
    required this.code,
  });

  List<ImportData> data;
  String message;
  int code;

  factory ImportDecoder.fromJson(String str) => ImportDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImportDecoder.fromMap(Map<String, dynamic> json) => ImportDecoder(
    data: List<ImportData>.from(json["data"].map((x) => ImportData.fromMap(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<ImportData>.from(data.map((x) => x.toMap())),
    "message": message,
    "code": code,
  };
}

class ImportData {
  ImportData({
    required this.id,
    required this.dealerId,
    required this.dealerName,
    required this.billNumber,
    required this.shippingChargePrice,
    required this.totalPrice,
    required this.importProduct,
  });

  int id;
  int dealerId;
  String dealerName;
  int billNumber;
  int shippingChargePrice;
  int totalPrice;
  List<ImportProduct> importProduct;

  factory ImportData.fromJson(String str) => ImportData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImportData.fromMap(Map<String, dynamic> json) => ImportData(
    id: json["id"],
    dealerId: json["dealer_id"],
    dealerName: json["dealer_name"],
    billNumber: json["bill_number"],
    shippingChargePrice: json["shipping_charge_price"],
    totalPrice: json["total_price"],
    importProduct: List<ImportProduct>.from(json["import_product"].map((x) => ImportProduct.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "dealer_id": dealerId,
    "dealer_name": dealerName,
    "bill_number": billNumber,
    "shipping_charge_price": shippingChargePrice,
    "total_price": totalPrice,
    "import_product": List<dynamic>.from(importProduct.map((x) => x.toMap())),
  };
}

class ImportProduct {
  ImportProduct({
    required this.id,
    required this.pruductsId,
    required this.pruductsName,
    required this.importId,
    required this.importBillNumber,
    required this.quantity,
  });

  int id;
  int pruductsId;
  String pruductsName;
  int importId;
  int importBillNumber;
  int quantity;

  factory ImportProduct.fromJson(String str) => ImportProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImportProduct.fromMap(Map<String, dynamic> json) => ImportProduct(
    id: json["id"],
    pruductsId: json["pruducts_id"],
    pruductsName: json["pruducts_name"],
    importId: json["import_id"],
    importBillNumber: json["import_bill_number"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "pruducts_id": pruductsId,
    "pruducts_name": pruductsName,
    "import_id": importId,
    "import_bill_number": importBillNumber,
    "quantity": quantity,
  };
}
