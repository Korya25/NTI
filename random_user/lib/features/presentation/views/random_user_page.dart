import 'package:api_task/core/api/dio_consumer.dart';
import 'package:api_task/features/data/repo/product_repo.dart';

import 'package:api_task/features/presentation/controller/random_user_cubit.dart.dart';
import 'package:api_task/features/presentation/controller/random_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomUserPage extends StatelessWidget {
  const RandomUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          RandomUserCubit(UserRepo(api: DioConsumer()))..fetchRandomUsers(),
      child: Scaffold(
          backgroundColor: Colors.black,

        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Random Users',style: TextStyle(
            color: Colors.white
          ),),
          actions: [
          
          ],
        ),
        body: BlocBuilder<RandomUserCubit, RandomUserState>(
          builder: (context, state) {
            if (state is RandomUserLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RandomUserFailure) {
              return Center(
                child: Text(
                  state.error.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state is RandomUserSuccess) {
              final users = state.users;

              return ListView.builder(
                itemCount: users.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final user = users[index];

                  return Card(
          color: Colors.blue,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.imageUrl),
                        radius: 30,
                      ),
                      title: Text(user.firstName),
                      subtitle: Text('${user.email}\n${user.city}, ${user.country}'),
                      isThreeLine: true,
                    ),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
