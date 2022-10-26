import '../app/constants.dart';

class TAlarm{
  TAlarm({required this.s_code,required this.i_type, required this.d_value});
  String s_code;
  int i_type;
  double d_value;
  String s_udid = Constants.udid!;
  //String s_pns_token;
  factory TAlarm.fromJson(Map<String, dynamic> json) => TAlarm(
    s_code: json["s_code"],
    i_type: json["i_type"],
    d_value: json["d_value"],
  );

  Map<String, dynamic> toJson() => {
    "s_code": s_code,
    "i_type": i_type,
    "d_value": d_value,
    "s_udid": s_udid,
  };

}