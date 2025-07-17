import 'package:doctor_hunt/core/constant/app_assets.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:flutter/material.dart';

class CategoryCardModel {
  final String svgPath;
  final Gradient? gradient;
  final List<DoctorModel> doctors;

  CategoryCardModel({
    required this.gradient,
    required this.svgPath,
    required this.doctors,
  }) : super();

  static List<CategoryCardModel> categories = [
    CategoryCardModel(
      svgPath: AppIconsSvgs.sprocket,
      gradient: const LinearGradient(
        colors: [Color(0xff2753F3), Color(0xff765AFC)],
      ),
      doctors: DoctorData.toothList,
    ),
    CategoryCardModel(
      svgPath: AppIconsSvgs.heart,
      gradient: const LinearGradient(
        colors: [Color(0xff0EBE7E), Color(0xff07D9AD)],
      ),
      doctors: DoctorData.heartList,
    ),
    CategoryCardModel(
      svgPath: AppIconsSvgs.eye,
      gradient: const LinearGradient(
        colors: [Color(0xffFE7F44), Color(0xffFFCF68)],
      ),
      doctors: DoctorData.eyeList,
    ),
    CategoryCardModel(
      svgPath: AppIconsSvgs.body,
      gradient: const LinearGradient(
        colors: [Color(0xffFF484C), Color(0xffFF6C60)],
      ),
      doctors: DoctorData.bodyList,
    ),
  ];
}
