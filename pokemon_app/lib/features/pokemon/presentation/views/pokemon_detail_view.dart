import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/core/constants/app_colors.dart';
import 'package:pokemon_app/core/constants/app_text_styles.dart';
import 'package:pokemon_app/core/router/app_routes.dart';
import 'package:pokemon_app/features/pokemon/presentation/cubit/pokemon_cubit.dart';
import 'package:pokemon_app/features/pokemon/presentation/cubit/pokemon_state.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/pokemon_detail_content.dart';

class PokemonDetailPage extends StatefulWidget {
  final String pokemonId;

  const PokemonDetailPage({super.key, required this.pokemonId});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<PokemonCubit>().loadPokemonDetail(widget.pokemonId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.go(AppRoutes.pokemonList);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Pokemon Details',
          style: AppTextStyles.h3.copyWith(color: AppColors.onPrimary),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.onPrimary),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state is PokemonError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: AppColors.error),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: AppTextStyles.body1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PokemonCubit>().loadPokemonDetail(
                        widget.pokemonId,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text('Retry', style: AppTextStyles.button),
                  ),
                ],
              ),
            );
          }

          if (state is PokemonDetailLoaded) {
            return PokemonDetailContent(pokemon: state.pokemon);
          }

          return const Center(child: Text('No Pokemon details found'));
        },
      ),
    );
  }
}
