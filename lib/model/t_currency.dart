
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:objectbox/objectbox.dart';

class TCurrency{
  TCurrency({required this.name, required this.imgUrl, required this.price, required this.desc, required this.state,this.id = 0});
  String name;
  String imgUrl;
  double price;
  String desc;
  bool state;
  int id;
}
// To parse this JSON data, do
//
//     final baseResponse = baseResponseFromJson(jsonString);

BaseResponse baseResponseFromJson(String str) => BaseResponse.fromJson(json.decode(str));

String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
  BaseResponse({
    /*required this.status,
    required this.pagination,*/
    required this.currencies,
    //this.news,
  });

  /*Status status;
  Pagination pagination;*/
  List<Currency> currencies;
  //List<News>? news;
  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
    /*status: Status.fromJson(json["status"]),
    pagination: Pagination.fromJson(json["pagination"]),*/
    currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
    //news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    /*"status": status.toJson(),
    "pagination": pagination.toJson(),*/
    "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
    //"news": List<dynamic>.from(news!.map((x) => x.toJson())),
  };
}

@Entity()

class Currency {
  Currency({
    required this.pkIId,
    required this.sCode,
    required this.sName,
    required this.dValue,
    required this.dTrading,
    required this.sIcon,
    this.id = 0,

  });
  int pkIId;
  String sCode;
  String sName;
  String dValue;
  String dTrading;
  String sIcon;
  int id;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    pkIId: json["pk_i_id"],
    sCode: json["s_code"],
    sName: json["s_name"],
    dValue: json["d_value"],
    dTrading: json["d_trading"],
    sIcon: json["s_icon"],
  );

  Map<String, dynamic> toJson() => {
    "pk_i_id": pkIId,
    "s_code": sCode,
    "s_name": sName,
    "d_value": dValue,
    "d_trading": dTrading,
    "s_icon": sIcon
  };
}

class News {
  News({
    required this.pkIId,
    required this.sTitle,
    required this.sImage,
    required this.sDescription,
    required this.bEnabled,
    required this.dtCreatedDate,
    required this.dtModifiedDate,
    required this.dtDeletedDate,
  });

  int pkIId;
  String sTitle;
  String sImage;
  String sDescription;
  bool bEnabled;
  DateTime dtCreatedDate;
  DateTime dtModifiedDate;
  dynamic dtDeletedDate;

  factory News.fromJson(Map<String, dynamic> json) => News(
    pkIId: json["pk_i_id"],
    sTitle: json["s_title"],
    sImage: json["s_image"],
    sDescription: json["s_description"],
    bEnabled: json["b_enabled"],
    dtCreatedDate: DateTime.parse(json["dt_created_date"]),
    dtModifiedDate: DateTime.parse(json["dt_modified_date"]),
    dtDeletedDate: json["dt_deleted_date"],
  );

  Map<String, dynamic> toJson() => {
    "pk_i_id": pkIId,
    "s_title": sTitle,
    "s_image": sImage,
    "s_description": sDescription,
    "b_enabled": bEnabled,
    "dt_created_date": dtCreatedDate.toIso8601String(),
    "dt_modified_date": dtModifiedDate.toIso8601String(),
    "dt_deleted_date": dtDeletedDate,
  };
}


/*
class Pagination {
  Pagination({
    @required this.iTotalObjects,
    @required this.iItemsOnPage,
    @required this.iPerPages,
    @required this.iCurrentPage,
    @required this.iTotalPages,
  });

  int iTotalObjects;
  int iItemsOnPage;
  int iPerPages;
  int iCurrentPage;
  int iTotalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    iTotalObjects: json["i_total_objects"],
    iItemsOnPage: json["i_items_on_page"],
    iPerPages: json["i_per_pages"],
    iCurrentPage: json["i_current_page"],
    iTotalPages: json["i_total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "i_total_objects": iTotalObjects,
    "i_items_on_page": iItemsOnPage,
    "i_per_pages": iPerPages,
    "i_current_page": iCurrentPage,
    "i_total_pages": iTotalPages,
  };
}
*/

/*class Status {
  Status({
    @required this.success,
    @required this.code,
    @required this.message,
  });*/

 /* bool success;
  int code;
  String message;*/

 /* factory Status.fromJson(Map<String, dynamic> json) => Status(
    success: json["success"],
    code: json["code"],
    message: json["message"],
  );
*/
  /*Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
  };*/

