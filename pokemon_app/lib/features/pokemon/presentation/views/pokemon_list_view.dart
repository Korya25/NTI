import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/constants/app_colors.dart';
import 'package:pokemon_app/core/constants/app_text_styles.dart';
import 'package:pokemon_app/features/pokemon/presentation/cubit/pokemon_cubit.dart';
import 'package:pokemon_app/features/pokemon/presentation/cubit/pokemon_state.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/pokemon_card.dart';


class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  void initState() {
    super.initState();
    context.read<PokemonCubit>().loadPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Pokemon',
          style: AppTextStyles.h2.copyWith(color: AppColors.onPrimary),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              
              ),
            );
          }
          
          if (state is PokemonError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: AppTextStyles.body1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PokemonCubit>().loadPokemonList();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      'Retry',
                      style: AppTextStyles.button,
                    ),
                  ),
                ],
              ),
            );
          }
          
          if (state is PokemonListLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokemonList[index];
                return PokemonCard(pokemon: pokemon);
              },
            );
          }
          
          return const Center(
            child: Text('No Pokemon found'),
          );
        },
      ),
    );
  }
}