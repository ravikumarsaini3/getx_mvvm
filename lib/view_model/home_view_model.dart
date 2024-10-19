import 'package:get/get.dart';
import 'package:getx_mvvm/data/home_service/homeservice.dart';
import 'package:getx_mvvm/model/usermodel.dart';
import 'package:getx_mvvm/utilis/utils.dart';

class HomeViewModel extends GetxController {
  Homeservice homeservice = Homeservice();
  var userlist = UserModel().obs; // Declare as Rx to observe changes

  Future<UserModel?> gethomeapi(context) async {
    try {
      var response = await homeservice.homeapi();
      userlist.value = response; // Update the userlist with the fetched data
      Utils.showFlushbar(context, 'Success', 'Data fetched successfully');
      return response; // Return the fetched data
        } catch (e) {
      Utils.showFlushbarerror(context, 'Error', e.toString());
    }
    return null; // Return null in case of failure
  }
}
