import 'package:getx_mvvm/data/networkapi/network_service.dart';
import 'package:getx_mvvm/model/usermodel.dart';
import 'package:getx_mvvm/resourses/appurl/appurl.dart';

class Homeservice {
  NetworkService service = NetworkService();
  Future<UserModel> homeapi() async {
    var responce = await service.getapi(Appurl.homeurl);
    return UserModel.fromJson(responce);
  }
}
