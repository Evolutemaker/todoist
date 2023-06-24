import 'dart:convert';
import 'package:todoist/constants/constants.dart';
import 'package:todoist/constants/exception_messages.dart';
import 'package:todoist/constants/exceptions.dart';
import 'package:todoist/constants/repo_constants.dart';
import 'package:todoist/models/task_element/task_element_model.dart';
import 'package:todoist/models/task_model/task_model.dart';
import 'package:todoist/models/tasks_list/tasks_list_model.dart';
import 'package:http/http.dart' as http;

class TasksRepo {
  Future<TasksListModel> getTasksList() async {
    const baseUrl = RepoConstants.baseURL;
    final headers = {
      'Authorization': 'Bearer bring',
    };

    try {
      http.Request request = http.Request('GET', Uri.parse('$baseUrl/list'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResult = json.decode(await response.stream.bytesToString());

        return TasksListModel.fromJson(jsonResult);
      } else if (response.statusCode == 401) {
        throw WrongAuthException(messageException[401]!);
      } else if (response.statusCode == 500) {
        throw ServerException(messageException[500]!);
      } else {
        throw NetworkException(ExceptionMessages.networkExceptionMessage);
      }
    } catch (e) {
      if (e is ComplexException) {
        logger.e(e);
        // Handle database-related exception
        // Log or perform specific actions
      } else if (e is WrongAuthException) {
        logger.e(e);
      } else if (e is ServerException) {
        logger.e(e);
      } else if (e is NetworkException) {
        logger.e(e);
      } else {
        logger.e(e);
      }

      rethrow;
    }
  }

  Future<TasksListModel> updateTasksListWithRevision(int revision) async {
    const baseUrl = RepoConstants.baseURL;
    final headers = {
      'Authorization': 'Bearer bring',
      'X-Last-Known-Revision': revision.toString(),
    };

    try {
      http.Request request = http.Request('PATCH', Uri.parse('$baseUrl/list'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResult = json.decode(await response.stream.bytesToString());

        return TasksListModel.fromJson(jsonResult);
      } else if (response.statusCode == 400) {
        throw ComplexException(messageException[400]!);
      } else if (response.statusCode == 401) {
        throw WrongAuthException(messageException[401]!);
      } else if (response.statusCode == 500) {
        throw ServerException(messageException[500]!);
      } else {
        throw NetworkException(ExceptionMessages.networkExceptionMessage);
      }
    } catch (e) {
      if (e is ComplexException) {
        logger.e(e);
        // Handle database-related exception
        // Log or perform specific actions
      } else if (e is WrongAuthException) {
        logger.e(e);
      } else if (e is ServerException) {
        logger.e(e);
      } else if (e is NetworkException) {
        logger.e(e);
      } else {
        logger.e(e);
      }

      rethrow;
    }
  }

  Future<TaskElementModel> getSingleTaskById(String taskId) async {
    const baseUrl = RepoConstants.baseURL;
    final headers = {
      'Authorization': 'Bearer bring',
    };

    try {
      http.Request request =
          http.Request('GET', Uri.parse('$baseUrl/list/$taskId'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResult = json.decode(await response.stream.bytesToString());

        return TaskElementModel.fromJson(jsonResult);
      } else if (response.statusCode == 400) {
        throw ComplexException(messageException[400]!);
      } else if (response.statusCode == 401) {
        throw WrongAuthException(messageException[401]!);
      } else if (response.statusCode == 404) {
        throw NoElementFoundException(messageException[404]!);
      } else if (response.statusCode == 500) {
        throw ServerException(messageException[500]!);
      } else {
        throw NetworkException(ExceptionMessages.networkExceptionMessage);
      }
    } catch (e) {
      if (e is ComplexException) {
        logger.e(e);
        // Handle database-related exception
        // Log or perform specific actions
      } else if (e is WrongAuthException) {
        logger.e(e);
      } else if (e is NoElementFoundException) {
        logger.e(e);
      } else if (e is ServerException) {
        logger.e(e);
      } else if (e is NetworkException) {
        logger.e(e);
      } else {
        logger.e(e);
      }

      rethrow;
    }
  }

  Future<TaskElementModel> addSingleTaskWithRevision(
      TaskModel task, int revision) async {
    const baseUrl = RepoConstants.baseURL;
    final headers = {
      'Authorization': 'Bearer bring',
      'X-Last-Known-Revision': revision.toString(),
    };
    final body = jsonEncode(task.toJson());

    try {
      final response = await http.post(Uri.parse('$baseUrl/list'),
          headers: headers, body: body);

      if (response.statusCode == 200) {
        return TaskElementModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        throw ComplexException(messageException[400]!);
      } else if (response.statusCode == 401) {
        throw WrongAuthException(messageException[401]!);
      } else if (response.statusCode == 404) {
        throw NoElementFoundException(messageException[404]!);
      } else if (response.statusCode == 500) {
        throw ServerException(messageException[500]!);
      } else {
        throw NetworkException(ExceptionMessages.networkExceptionMessage);
      }
    } catch (e) {
      if (e is ComplexException) {
        logger.e(e);
        // Handle database-related exception
        // Log or perform specific actions
      } else if (e is WrongAuthException) {
        logger.e(e);
      } else if (e is NoElementFoundException) {
        logger.e(e);
      } else if (e is ServerException) {
        logger.e(e);
      } else if (e is NetworkException) {
        logger.e(e);
      } else {
        logger.e(e);
      }

      rethrow;
    }
  }

  Future<TaskElementModel> changeSingleTaskByIdWithRevision(
      String id, TaskModel task, int revision) async {
    const baseUrl = RepoConstants.baseURL;
    final headers = {
      'Authorization': 'Bearer bring',
      'X-Last-Known-Revision': revision.toString(),
    };
    final body = jsonEncode(task.toJson());
    try {
      final response = await http.put(Uri.parse('$baseUrl/list/$id'),
          headers: headers, body: body);

      if (response.statusCode == 200) {
        return TaskElementModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        throw ComplexException(messageException[400]!);
      } else if (response.statusCode == 401) {
        throw WrongAuthException(messageException[401]!);
      } else if (response.statusCode == 404) {
        throw NoElementFoundException(messageException[404]!);
      } else if (response.statusCode == 500) {
        throw ServerException(messageException[500]!);
      } else {
        throw NetworkException(ExceptionMessages.networkExceptionMessage);
      }
    } catch (e) {
      if (e is ComplexException) {
        logger.e(e);
        // Handle database-related exception
        // Log or perform specific actions
      } else if (e is WrongAuthException) {
        logger.e(e);
      } else if (e is NoElementFoundException) {
        logger.e(e);
      } else if (e is ServerException) {
        logger.e(e);
      } else if (e is NetworkException) {
        logger.e(e);
      } else {
        logger.e(e);
      }

      rethrow;
    }
  }

  Future<TaskElementModel> deleteSingleTask(String id, int revision) async {
    const baseUrl = RepoConstants.baseURL;
    final headers = {
      'Authorization': 'Bearer bring',
      'X-Last-Known-Revision': revision.toString(),
    };

    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/list/$id'), headers: headers);

      if (response.statusCode == 200) {
        return TaskElementModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        throw ComplexException(messageException[400]!);
      } else if (response.statusCode == 401) {
        throw WrongAuthException(messageException[401]!);
      } else if (response.statusCode == 404) {
        throw NoElementFoundException(messageException[404]!);
      } else if (response.statusCode == 500) {
        throw ServerException(messageException[500]!);
      } else {
        throw NetworkException(ExceptionMessages.networkExceptionMessage);
      }
    } catch (e) {
      if (e is ComplexException) {
        logger.e(e);
        // Handle database-related exception
        // Log or perform specific actions
      } else if (e is WrongAuthException) {
        logger.e(e);
      } else if (e is NoElementFoundException) {
        logger.e(e);
      } else if (e is ServerException) {
        logger.e(e);
      } else if (e is NetworkException) {
        logger.e(e);
      } else {
        logger.e(e);
      }

      rethrow;
    }
  }
}
