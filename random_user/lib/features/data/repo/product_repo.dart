import 'package:api_task/core/api/api_consumer.dart';
import 'package:api_task/core/api/end_point.dart';
import 'package:api_task/features/data/model/user_model.dart';

class UserRepo {
  final ApiConsumer api;

  UserRepo({required this.api});

  Future<List<UserModel>> fetchUsers({int count = 10}) async {
    final response = await api.get('${EndPoint.getRandomUser}?results=$count');
    final List<dynamic> usersJson = response[ApiKeys.results];
    return usersJson.map((e) => UserModel.fromJson(e)).toList();
  }
}
