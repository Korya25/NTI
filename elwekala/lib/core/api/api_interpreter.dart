import 'package:elwekala/core/api/end_points.dart';
import 'package:elwekala/core/errors/error_model.dart';
import 'package:elwekala/core/errors/exceptions.dart';

class ApiInterpreter {
  static void checkResponseStatus(Map<String, dynamic> data) {
    if (data[ApiKeys.status] != ApiKeys.success) {
      throw ServerException(errorModel: ErrorModel.fromJson(data));
    }
  }
}
