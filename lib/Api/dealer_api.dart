// To parse this JSON data, do
//
//     final dealerDecoder = dealerDecoderFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class DealerDecoder {
  DealerDecoder({
    required this.data,
    required this.message,
    required this.code,
  });

  List<Dealer> data;
  String message;
  int code;

  factory DealerDecoder.fromJson(String str) => DealerDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DealerDecoder.fromMap(Map<String, dynamic> json) => DealerDecoder(
    data: List<Dealer>.from(json["data"].map((x) => Dealer.fromMap(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
    "code": code,
  };
}

class Dealer {
  Dealer({
    required this.id,
    required this.name,
    required this.mobileNumber,
    required this.address,
    required this.country,
    required this.city,
    required this.dealerType,
    required this.imports,
  });

  int id;
  String name;
  String mobileNumber;
  String address;
  String country;
  String city;
  String dealerType;
  List<Import> imports;

  factory Dealer.fromJson(String str) => Dealer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dealer.fromMap(Map<String, dynamic> json) => Dealer(
    id: json["id"],
    name: json["name"],
    mobileNumber: json["mobile_number"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    dealerType: json["dealer_type"],
    imports: List<Import>.from(json["imports"].map((x) => Import.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "mobile_number": mobileNumber,
    "address": address,
    "country": country,
    "city": city,
    "dealer_type": dealerType,
    "imports": List<dynamic>.from(imports.map((x) => x.toMap())),
  };
}

class Import {
  Import({
    required this.id,
    required this.dealerId,
    required this.billNumber,
    required this.shippingChargePrice,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int dealerId;
  int billNumber;
  int shippingChargePrice;
  int totalPrice;
  DateTime createdAt;
  DateTime updatedAt;

  factory Import.fromJson(String str) => Import.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Import.fromMap(Map<String, dynamic> json) => Import(
    id: json["id"],
    dealerId: json["dealer_id"],
    billNumber: json["bill_number"],
    shippingChargePrice: json["shipping_charge_price"],
    totalPrice: json["total_price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "dealer_id": dealerId,
    "bill_number": billNumber,
    "shipping_charge_price": shippingChargePrice,
    "total_price": totalPrice,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
