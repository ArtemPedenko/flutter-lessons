import 'package:dio/dio.dart';
import 'package:flutter_lessons/core/network/dio_client.dart';
import 'models/todo_model.dart';

class TodoRepository {
  final Dio _dio = DioClient.dio;
  
  Future<List<Todo>> getTodos() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/todos');

    final List data = response.data;

    return data.map((e) => Todo.fromJson(e)).toList();
  }
}