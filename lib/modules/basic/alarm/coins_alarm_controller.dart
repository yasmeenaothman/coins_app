import 'package:coins_app/Repo/trigger_repo.dart';
import 'package:coins_app/model/t_alarm.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../app/constants.dart';
import '../../../model/t_currency.dart';

class CoinsAlarmController extends GetxController {
  String selectedDropItem = Constants.dropItems[3];
  List<Currency> suggestions = [];
  List<TAlarm> alarms = [];
  Currency? selectedCurrency;
  bool isLoading = false;
  updateSelected(String item){
    selectedDropItem = item;
    update();
  }
  updateSuggestions(List<Currency> suggestions){
    this.suggestions = suggestions;
    update();
  }
  updateSelectedCurrency(Currency currency){
    selectedCurrency = currency;
    update();
  }
  addAlarm(TAlarm alarm){
    //alarms.add(alarm);
   /* Map<String,dynamic> body = {
      's_code': alarm.s_code,
      'i_type': alarm.i_type,
      'd_value': alarm.d_value,
      's_udid': Constants.udid,
    };*/
    TriggerRepo.addTriggerRequest(alarm.toJson());
    update();
  }

  getAlarms() async {
    isLoading = true;
    update();
    try{
      alarms = await TriggerRepo.getTriggersRequest();
      isLoading  = false;
      update();
    }
    catch(e){
      /*isConnect = false;
      update();*/
    }
  }

  removeAlarm(TAlarm alarm) async{
    //alarms.remove(alarm);
   // await TriggerRepo.deleteTriggerRequest(alarm.s_code); //Todo id

    getAlarms();
  }
}