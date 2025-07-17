import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/presentation/widgets/transform_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedNetworkImageWithShimmer extends StatelessWidget {
  const CachedNetworkImageWithShimmer({
    super.key,
    required this.imageUrl,
    this.radius = 24.0,
    this.borderWidth = 2.0,
    this.borderColor = AppColors.secondaryColor,
    this.defaultIcon = Icons.person,
    this.height,
    this.width,
    this.dialogMaxWidth = 300,
    this.dialogMaxHeight = 400,
    this.dialogAspectRatio = 3 / 4,
  });

  final String imageUrl;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final IconData defaultIcon;
  final double? height;
  final double? width;
  final double dialogMaxWidth;
  final double dialogMaxHeight;
  final double dialogAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showImagePreviewDialog(context),
      child: _buildCachedNetworkImage(),
    );
  }

  Widget _buildCachedNetworkImage() {
    final imageSize = Size(width ?? radius * 2, height ?? radius * 2);

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: imageSize.width,
      height: imageSize.height,
      fit: BoxFit.cover,
      placeholder: (context, url) => _buildShimmerPlaceholder(),
      errorWidget: (context, url, error) => _buildErrorWidget(),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        color: Colors.grey[300],
        width: radius * 2,
        height: radius * 2,
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey[200],
      width: radius * 2,
      height: radius * 2,
      child: Icon(defaultIcon, size: radius, color: Colors.grey[600]),
    );
  }

  void _showImagePreviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: dialogMaxWidth,
            maxHeight: dialogMaxHeight,
          ),
          child: AspectRatio(
            aspectRatio: dialogAspectRatio,
            child: TransformAnimatedWidget(
              duration: const Duration(milliseconds: 300),
              rotation: AnimatedTransformValue(begin: 0, end: 6.28),
              child: Dialog(
                insetPadding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => _buildDialogShimmer(),
                    errorWidget: (context, url, error) =>
                        _buildDialogErrorWidget(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDialogShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(color: Colors.grey[300]),
    );
  }

  Widget _buildDialogErrorWidget() {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Icon(defaultIcon, size: 60, color: Colors.grey[600]),
      ),
    );
  }
}
