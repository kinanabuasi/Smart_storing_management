// To parse this JSON data, do
//
//     final exportDecoder = exportDecoderFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ExportDecoder {
  ExportDecoder({
    required this.data,
    required this.message,
    required this.code,
  });

  List<ExportData> data;
  String message;
  int code;

  factory ExportDecoder.fromJson(String str) => ExportDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExportDecoder.fromMap(Map<String, dynamic> json) => ExportDecoder(
    data: List<ExportData>.from(json["data"].map((x) => ExportData.fromMap(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
    "code": code,
  };
}

class ExportData {
  ExportData({
    required this.id,
    required this.dealerId,
    required this.dealerName,
    required this.billNumber,
    required this.shippingChargePrice,
    required this.hasReceived,
    required this.totalPrice,
    required this.exportInventoryProducts,
  });

  int id;
  int dealerId;
  String dealerName;
  int billNumber;
  int shippingChargePrice;
  dynamic hasReceived;
  int totalPrice;
  List<ExportInventoryProduct> exportInventoryProducts;

  factory ExportData.fromJson(String str) => ExportData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExportData.fromMap(Map<String, dynamic> json) => ExportData(
    id: json["id"],
    dealerId: json["dealer_id"],
    dealerName: json["dealer_name"],
    billNumber: json["bill_number"],
    shippingChargePrice: json["shipping_charge_price"],
    hasReceived: json["has_received"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    exportInventoryProducts: List<ExportInventoryProduct>.from(json["export_inventory_products"].map((x) => ExportInventoryProduct.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "dealer_id": dealerId,
    "dealer_name": dealerName,
    "bill_number": billNumber,
    "shipping_charge_price": shippingChargePrice,
    "has_received": hasReceived,
    "total_price": totalPrice == null ? null : totalPrice,
    "export_inventory_products": List<dynamic>.from(exportInventoryProducts.map((x) => x.toMap())),
  };
}

class ExportInventoryProduct {
  ExportInventoryProduct({
    required this.id,
    required this.exportId,
    required this.exportBillNumber,
    required this.inventoryProductId,
    required this.inventoryProductProductId,
    required this.inventoryProductProductName,
    required this.inventoryProductQuantity,
    required this.exportProductPrice,
  });

  int id;
  int exportId;
  int exportBillNumber;
  int inventoryProductId;
  int inventoryProductProductId;
  String inventoryProductProductName;
  int inventoryProductQuantity;
  int exportProductPrice;

  factory ExportInventoryProduct.fromJson(String str) => ExportInventoryProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExportInventoryProduct.fromMap(Map<String, dynamic> json) => ExportInventoryProduct(
    id: json["id"],
    exportId: json["export_id"],
    exportBillNumber: json["export_bill_number"],
    inventoryProductId: json["inventory_product_id"],
    inventoryProductProductId: json["inventory_product_product_id"],
    inventoryProductProductName: json["inventory_product_product_name"],
    inventoryProductQuantity: json["inventory_product_quantity"],
    exportProductPrice: json["export_product_price"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "export_id": exportId,
    "export_bill_number": exportBillNumber,
    "inventory_product_id": inventoryProductId,
    "inventory_product_product_id": inventoryProductProductId,
    "inventory_product_product_name": inventoryProductProductName,
    "inventory_product_quantity": inventoryProductQuantity,
    "export_product_price": exportProductPrice,
  };
}
