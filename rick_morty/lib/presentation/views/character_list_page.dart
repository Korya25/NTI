import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty/core/app_routes.dart';
import '../cubit/character_cubit.dart';
import '../cubit/character_state.dart';
import '../widgets/character_card.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<CharacterCubit>().loadCharacters();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<CharacterCubit>().loadMoreCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Rick and Morty',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is CharacterError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<CharacterCubit>().loadCharacters(),
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is CharacterLoaded) {
            return ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(16),
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CharacterCard(
                    character: character,
                    onTap: () => context.pushNamed(
                      AppRoutes.characterDetail,
                      extra: character,
                    ),
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
