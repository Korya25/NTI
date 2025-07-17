
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
