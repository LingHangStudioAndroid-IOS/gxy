import 'package:demo/model/data_model.dart';
import 'package:demo/services/api.dart';
import 'package:dio/dio.dart';

getData() async {
  Dio dio = Dio();
  Response response;
  response = await dio.get(API.getData);
  return DataModel.fromJson(response.data);
}
