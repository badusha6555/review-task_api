import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_api/model/model.dart';
import 'package:task_api/services/task_services.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskList = [];
  TaskServices taskServices = TaskServices();

  bool isLoading = false;

  final Dio dio = Dio();

  Future<List<TaskModel>> getTask() async {
    isLoading = true;
    notifyListeners();
    try {
      taskList = await taskServices.getTask();
      print(taskList);
      notifyListeners();
    } catch (e) {
      throw Exception("Error:$e");
    }
    isLoading = false;
    notifyListeners();
    return taskList;
  }
}
