import 'package:dio/dio.dart';

import '../app/constants.dart';
import '../dio_helper.dart';

class TriggerController{
  static Future<Response>addTriggerRequest(Map<String,dynamic>body) {
    return  DioHelper().post(Constants.addTriggerUrl,data: body);
  }
  static Future<Response>getTriggerRequest() async{
    return DioHelper().get(Constants.getTriggerUrl);
  }
  static Future<Response>deleteTriggerRequest(int id) async{
    return DioHelper().delete('${Constants.deleteTriggerUrl}$id');
  }
}