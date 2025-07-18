import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/core/constants/app_colors.dart';
import 'package:pokemon_app/core/constants/app_text_styles.dart';
import 'package:pokemon_app/features/pokemon/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonListModel pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          context.go('/pokemon/${pokemon.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.catching_pokemon,
                    size: 48,
                    color: AppColors.textSecondary,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                pokemon.name.toUpperCase(),
                style: AppTextStyles.body1.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '#${pokemon.id.padLeft(3, '0')}',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
