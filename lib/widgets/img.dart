import 'dart:io';

import 'package:flutter/material.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/utils/theme.dart';

class CustomImagePicker extends StatefulWidget {
  final VoidCallback ontap, onCancel;
  final String description;
  final File? imageXFile;

  const CustomImagePicker({
    super.key,
    required this.ontap,
    required this.onCancel,
    required this.description,
    this.imageXFile,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  Widget build(BuildContext context) {
    String outPath;
    if (widget.imageXFile == null) {
      outPath = "";
    } else {
      final filePath = widget.imageXFile!.path;
      final splitted = filePath.split("/").last;
      outPath = splitted;
    }
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        // height: 120,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Text(
          widget.imageXFile != null ? outPath : "Upload ID details",
          style: AppStyles.general(12, FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
