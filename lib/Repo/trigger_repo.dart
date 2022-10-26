import 'package:coins_app/controllers/trigger_controller.dart';
import 'package:coins_app/model/t_alarm.dart';

class TriggerRepo{
  static addTriggerRequest(Map<String,dynamic>body) async{
    final response =  await TriggerController.addTriggerRequest(body);
    if(response.statusCode==200){
      print('done');
    }
  }
  static Future<List<TAlarm>> getTriggersRequest() async{
    List<TAlarm> triggerList = [];
    final response =  await TriggerController.getTriggerRequest();
    if(response.statusCode==200){
      (response.data['triggers'] as List).forEach((e) { triggerList.add(TAlarm.fromJson(e)); });
    }
    return triggerList;
  }
  static deleteTriggerRequest(int id) async{
    final response =  await TriggerController.deleteTriggerRequest(id);
    if(response.statusCode==200){
      print('done');
    }
  }
}