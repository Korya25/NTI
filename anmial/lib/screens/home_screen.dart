import 'package:anmial/cubit/pet_cubit.dart';
import 'package:anmial/cubit/pet_state.dart';
import 'package:anmial/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PetImageData> petImages = [];
  CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          'Pet Gallery',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.clear_all, color: Colors.white70),
            onPressed: () {
              setState(() {
                petImages.clear();
                currentIndex = 0;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Action Buttons
            _buildActionButtons(),

            SizedBox(height: 16.h),

            // Carousel Display
            Expanded(
              child: BlocListener<PetCubit, PetState>(
                listener: (context, state) {
                  if (state is PetLoaded) {
                    setState(() {
                      petImages.add(
                        PetImageData(
                          imageUrl: state.imageUrl,
                          petType: state.petType,
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                        ),
                      );
                    });
                  }
                },
                child: _buildCarouselSection(),
              ),
            ),

            // Bottom Controls
            if (petImages.isNotEmpty) _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              'Dog',
              Icons.pets,
              const Color(0xFFFF6B35),
              () => context.read<PetCubit>().fetchRandomPet(PetType.dog),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: _buildActionButton(
              'Cat',
              Icons.pets,
              const Color(0xFF7B68EE),
              () => context.read<PetCubit>().fetchRandomPet(PetType.catImage),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: _buildActionButton(
              'Cat GIF',
              Icons.gif,
              const Color(0xFF20B2AA),
              () => context.read<PetCubit>().fetchRandomPet(PetType.catGif),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        elevation: 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20.sp),
          SizedBox(height: 4.h),
          Text(
            text,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSection() {
    return BlocBuilder<PetCubit, PetState>(
      builder: (context, state) {
        if (state is PetLoading) {
          return _buildLoadingState();
        } else if (state is PetError) {
          return _buildErrorState(state.message);
        } else if (petImages.isEmpty) {
          return _buildEmptyState();
        }

        return Column(
          children: [
            // Carousel
            Expanded(
              child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 0.85,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: petImages.map((petData) {
                  return _buildCarouselItem(petData);
                }).toList(),
              ),
            ),

            // Dots Indicator
            if (petImages.length > 1) _buildDotsIndicator(),
          ],
        );
      },
    );
  }

  Widget _buildCarouselItem(PetImageData petData) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.pets, size: 18.sp, color: Colors.white70),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    petData.petType,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, size: 18.sp, color: Colors.white54),
                  onPressed: () => _editPetData(petData),
                ),
                IconButton(
                  icon: Icon(Icons.delete, size: 18.sp, color: Colors.red[400]),
                  onPressed: () => _deletePetImage(petData.id),
                ),
              ],
            ),
          ),

          // Image
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  petData.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: const Color(0xFF2A2A2A),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white70,
                          ),
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF2A2A2A),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 48.sp,
                            color: Colors.red[400],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Failed to load image',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: petImages.asMap().entries.map((entry) {
          return Container(
            width: 8.w,
            height: 8.h,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == entry.key ? Colors.white : Colors.white30,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white70),
            onPressed: petImages.length > 1
                ? () {
                    carouselController.previousPage();
                  }
                : null,
          ),
          Text(
            '${currentIndex + 1} / ${petImages.length}',
            style: TextStyle(fontSize: 14.sp, color: Colors.white70),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white70),
            onPressed: petImages.length > 1
                ? () {
                    carouselController.nextPage();
                  }
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.pets, size: 64.sp, color: Colors.white30),
          SizedBox(height: 16.h),
          Text(
            'No pets yet',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Tap a button above to add pet images',
            style: TextStyle(fontSize: 14.sp, color: Colors.white54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
          ),
          SizedBox(height: 16.h),
          Text(
            'Loading pet...',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Container(
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.red[900]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.sp, color: Colors.red[400]),
          SizedBox(height: 16.h),
          Text(
            'Error',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.red[400],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              message,
              style: TextStyle(fontSize: 14.sp, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void _editPetData(PetImageData petData) {
    showDialog(
      context: context,
      builder: (context) => _EditPetDialog(
        petData: petData,
        onSave: (newName, newUrl) {
          setState(() {
            int index = petImages.indexWhere((p) => p.id == petData.id);
            if (index != -1) {
              petImages[index] = PetImageData(
                id: petData.id,
                petType: newName,
                imageUrl: newUrl,
              );
            }
          });
        },
      ),
    );
  }

  void _deletePetImage(String id) {
    setState(() {
      petImages.removeWhere((p) => p.id == id);
      if (currentIndex >= petImages.length && petImages.isNotEmpty) {
        currentIndex = petImages.length - 1;
      }
    });
  }
}

class PetImageData {
  final String id;
  final String petType;
  final String imageUrl;

  PetImageData({
    required this.id,
    required this.petType,
    required this.imageUrl,
  });
}

class _EditPetDialog extends StatefulWidget {
  final PetImageData petData;
  final Function(String, String) onSave;

  const _EditPetDialog({required this.petData, required this.onSave});

  @override
  __EditPetDialogState createState() => __EditPetDialogState();
}

class __EditPetDialogState extends State<_EditPetDialog> {
  late TextEditingController nameController;
  late TextEditingController urlController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.petData.petType);
    urlController = TextEditingController(text: widget.petData.imageUrl);
  }

  @override
  void dispose() {
    nameController.dispose();
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF1E1E1E),
      title: Text('Edit Pet Data', style: TextStyle(color: Colors.white)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Pet Type',
              labelStyle: TextStyle(color: Colors.white70),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          TextField(
            controller: urlController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Image URL',
              labelStyle: TextStyle(color: Colors.white70),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel', style: TextStyle(color: Colors.white70)),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(nameController.text, urlController.text);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7B68EE),
          ),
          child: Text('Save', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
