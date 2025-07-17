import 'package:elwekala/features/home/presentation/widgets/condition_section.dart';
import 'package:elwekala/features/home/presentation/widgets/filter_buttons.dart';
import 'package:elwekala/features/home/presentation/widgets/filter_dialog_header.dart';
import 'package:elwekala/features/home/presentation/widgets/filter_product.dart';
import 'package:elwekala/features/home/presentation/widgets/price_range_section.dart';
import 'package:flutter/material.dart';
import 'package:elwekala/core/constants/app_colors.dart';

class FilterDialog extends StatefulWidget {
  final Function(ProductFilterOptions)? onFilterApplied;
  final ProductFilterOptions? initialOptions;

  const FilterDialog({super.key, this.onFilterApplied, this.initialOptions});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? _selectedStatus;
  late RangeValues _priceRange;
  final double _minPriceLimit = 0;
  final double _maxPriceLimit = 1000;

  @override
  void initState() {
    super.initState();

    _priceRange = RangeValues(
      widget.initialOptions?.minPrice ?? _minPriceLimit,
      widget.initialOptions?.maxPrice ?? _maxPriceLimit,
    );
    _selectedStatus = widget.initialOptions?.status;
  }

  void _clearFilters() {
    setState(() {
      _selectedStatus = null;
      _priceRange = RangeValues(_minPriceLimit, _maxPriceLimit);
    });
  }

  void _applyFilters() {
    final filterOptions = ProductFilterOptions(
      status: _selectedStatus,
      minPrice: _priceRange.start,
      maxPrice: _priceRange.end,
    );
    widget.onFilterApplied?.call(filterOptions);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 24,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColors.surfaceColor,
      title: const FilterDialogHeader(),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ConditionSectionHeader(),
              const SizedBox(height: 12),
              ConditionCards(
                selectedStatus: _selectedStatus,
                onStatusChanged: (status) {
                  setState(() {
                    _selectedStatus = status;
                  });
                },
              ),
              const SizedBox(height: 24),
              const PriceRangeSectionHeader(),
              const SizedBox(height: 12),
              PriceRangeSlider(
                priceRange: _priceRange,
                minPriceLimit: _minPriceLimit,
                maxPriceLimit: _maxPriceLimit,
                onChanged: (range) {
                  setState(() {
                    _priceRange = range;
                  });
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      actions: [
        ClearFiltersButton(onPressed: _clearFilters),
        ApplyFiltersButton(onPressed: _applyFilters),
      ],
      actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
    );
  }
}
