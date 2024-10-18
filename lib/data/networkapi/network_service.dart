import 'dart:convert';

import 'package:getx_mvvm/data/appException/appexception.dart';
import 'package:getx_mvvm/data/networkapi/base_services.dart';
import 'package:http/http.dart' as http;

class NetworkService extends BaseServices {
  @override
  Future getapi(String url) {
    // TODO: implement getapi
    throw UnimplementedError();
  }

  @override
  Future postloginapi(data, String url) async {
    dynamic Responce;

    try {
      final responce = await http.post(Uri.parse(url), body: data);
      Responce = returnresponce(responce);
      return Responce;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future postsignupapi(data, String url) async {
    dynamic Responce;

    try {
      final responce = await http.post(Uri.parse(url), body: data);
      Responce = returnresponce(responce);
      return Responce;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}

dynamic returnresponce(http.Response responce) {
  switch (responce.statusCode) {
    case 200:
      dynamic tresponce = jsonDecode(responce.body);
      return tresponce;
    case 400:
      throw InvalidUserExceptation('Please check your email and Password');

    case 404:
      throw UrlExceptation('check your url');
    default:
      throw Appexception('Default something went Wrong ', responce.statusCode);
  }
}
