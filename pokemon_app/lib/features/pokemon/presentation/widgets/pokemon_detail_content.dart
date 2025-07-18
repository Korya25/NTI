
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/constants/app_colors.dart';
import 'package:pokemon_app/core/constants/app_text_styles.dart';
import 'package:pokemon_app/features/pokemon/pokemon_model.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/stat_item.dart';

class PokemonDetailContent extends StatelessWidget {
  final PokemonModel pokemon;
  
  const PokemonDetailContent({super.key, required this.pokemon});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pokemon Image and Basic Info
          Card(
            color: AppColors.surface,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                    height: 200,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.catching_pokemon,
                      size: 100,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    pokemon.name.toUpperCase(),
                    style: AppTextStyles.h2,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: AppTextStyles.body2,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Stats
          Card(
            color: AppColors.surface,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stats',
                    style: AppTextStyles.h3,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatItem(
                        label: 'Height',
                        value: '${pokemon.height / 10} m',
                      ),
                      StatItem(
                        label: 'Weight',
                        value: '${pokemon.weight / 10} kg',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Types
          Card(
            color: AppColors.surface,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Types',
                    style: AppTextStyles.h3,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: pokemon.types.map((type) => Chip(
                      label: Text(
                        type.toUpperCase(),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.onPrimary,
                        ),
                      ),
                      backgroundColor: AppColors.secondary,
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Abilities
          Card(
            color: AppColors.surface,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abilities',
                    style: AppTextStyles.h3,
                  ),
                  const SizedBox(height: 12),
                  ...pokemon.abilities.map((ability) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      ability.replaceAll('-', ' ').toUpperCase(),
                      style: AppTextStyles.body2,
                    ),
                  )).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
