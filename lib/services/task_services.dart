import 'package:dio/dio.dart';
import 'package:task_api/model/model.dart';

class TaskServices {
  final Dio dio = Dio();
  final String baseUrl =
      'http://universities.hipolabs.com/search?country=United+States';

  Future<List<TaskModel>> getTask() async {
    try {
      Response response = await dio.get(baseUrl);
      print(response.data);
      return (response.data as List).map((e) => TaskModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Error:$e");
    }
  }
}
