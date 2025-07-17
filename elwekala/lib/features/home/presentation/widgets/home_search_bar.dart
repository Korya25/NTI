
import 'package:elwekala/core/constants/app_colors.dart';
import 'package:elwekala/core/constants/app_strings.dart';
import 'package:elwekala/core/widgets/custom_text_form_field.dart';
import 'package:elwekala/features/home/presentation/widgets/filter_dialog.dart';
import 'package:elwekala/features/home/presentation/widgets/filter_product.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController _searchController;
  final Function(String) onChanged;
  final Function(ProductFilterOptions)? onFilterApplied;

  const HomeSearchBar({
    super.key,
    required TextEditingController searchController,
    required this.onChanged,
    this.onFilterApplied,
  }) : _searchController = searchController;

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => FilterDialog(onFilterApplied: onFilterApplied),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: _searchController,
      hintText: AppStrings.searchHint,
      prefixIcon: Icon(Icons.search, color: AppColors.iconColor),
      onChanged: onChanged,
      suffixIcon: IconButton(
        icon: Icon(Icons.filter_list, color: AppColors.iconColor),
        onPressed: () => _showFilterDialog(context),
      ),
    );
  }
}
/*
class FilterOptions {
  final String? condition;
  final double? minPrice;
  final double? maxPrice;

  FilterOptions({this.condition, this.minPrice, this.maxPrice});

  FilterOptions copyWith({
    String? condition,
    double? minPrice,
    double? maxPrice,
  }) {
    return FilterOptions(
      condition: condition ?? this.condition,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }

  bool get hasActiveFilters =>
      condition != null || minPrice != null || maxPrice != null;
}

class FilterDialog extends StatefulWidget {
  final Function(FilterOptions)? onFilterApplied;
  final FilterOptions? initialOptions;

  const FilterDialog({super.key, this.onFilterApplied, this.initialOptions});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog>
    with SingleTickerProviderStateMixin {
  String? _selectedCondition;
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.initialOptions != null) {
      _selectedCondition = widget.initialOptions!.condition;
      _minPriceController.text =
          widget.initialOptions!.minPrice?.toString() ?? '';
      _maxPriceController.text =
          widget.initialOptions!.maxPrice?.toString() ?? '';
    }

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    _animationController.dispose();
    
    super.dispose();
  }

  void _clearFilters() {
    setState(() {
      _selectedCondition = null;
      _minPriceController.clear();
      _maxPriceController.clear();
    });
  }

  void _applyFilters() {
    final filterOptions = FilterOptions(
      condition: _selectedCondition,
      minPrice: _minPriceController.text.isNotEmpty
          ? double.tryParse(_minPriceController.text)
          : null,
      maxPrice: _maxPriceController.text.isNotEmpty
          ? double.tryParse(_maxPriceController.text)
          : null,
    );
    widget.onFilterApplied?.call(filterOptions);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        elevation: 24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: colorScheme.surface,
        title: Container(
          padding: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.tune, color: colorScheme.primary, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                'Filter Options',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Condition Section
                _buildSectionHeader('Condition', Icons.verified_outlined),
                const SizedBox(height: 12),
                _buildConditionCards(colorScheme),
                const SizedBox(height: 24),

                // Price Range Section
                _buildSectionHeader('Price Range', Icons.attach_money_outlined),
                const SizedBox(height: 12),
                _buildPriceRangeSection(theme, colorScheme),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        actions: [
          // Clear Filters Button
          TextButton.icon(
            onPressed: _clearFilters,
            icon: const Icon(Icons.clear_all),
            label: const Text('Clear'),
            style: TextButton.styleFrom(foregroundColor: colorScheme.error),
          ),

          // Cancel Button
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),

          // Apply Button
          ElevatedButton.icon(
            onPressed: _applyFilters,
            icon: const Icon(Icons.check),
            label: const Text('Apply'),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildConditionCards(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: _buildConditionCard('New', Icons.star_outlined, colorScheme),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildConditionCard(
            'Used',
            Icons.history_outlined,
            colorScheme,
          ),
        ),
      ],
    );
  }

  Widget _buildConditionCard(
    String condition,
    IconData icon,
    ColorScheme colorScheme,
  ) {
    final isSelected = _selectedCondition == condition;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCondition = _selectedCondition == condition
              ? null
              : condition;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withOpacity(0.1)
              : colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurface.withOpacity(0.7),
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              condition,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? colorScheme.primary : colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRangeSection(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildPriceTextField(
                  controller: _minPriceController,
                  label: 'Min Price',
                  hint: '0',
                  prefixIcon: Icons.money_outlined,
                  theme: theme,
                  colorScheme: colorScheme,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.arrow_forward,
                  color: colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
              Expanded(
                child: _buildPriceTextField(
                  controller: _maxPriceController,
                  label: 'Max Price',
                  hint: '∞',
                  prefixIcon: Icons.money_outlined,
                  theme: theme,
                  colorScheme: colorScheme,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Leave empty for no limit',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData prefixIcon,
    required ThemeData theme,
    required ColorScheme colorScheme,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(prefixIcon, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      style: theme.textTheme.bodyMedium,
    );
  }
}
*/