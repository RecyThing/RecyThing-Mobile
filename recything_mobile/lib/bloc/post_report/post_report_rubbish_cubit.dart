import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recything_mobile/bloc/post_report/post_report_rubbish_state.dart';
import 'package:recything_mobile/repositories/report_repo.dart';

class PostReportRubbishCubit extends Cubit<PostReportRubbishState> {
  PostReportRubbishCubit() : super(PostReportRubbishInitial());

  bool isCheckedKering = false;
  bool isCheckedBasah = false;

  void toggleCheckboxKering() {
    isCheckedKering = !isCheckedKering;
    emit(PostReportRubbishCheckboxUpdated());
  }

  void toggleCheckboxBasah() {
    isCheckedBasah = !isCheckedBasah;
    emit(PostReportRubbishCheckboxUpdated());
  }

  void reports(
      {BuildContext? context,
      required String reportType,
      required String location,
      required num longitude,
      required num latitude,
      required String addressPoint,
      required String trashType,
      required String desc,
      required List<XFile> images}) async {
    try {
      emit(PostReportRubbishLoading());
      List<File> imageFiles = images.map((xFile) => File(xFile.path)).toList();
      await ReportRepo().addReport(
          context: context!,
          reportType: reportType,
          location: location,
          longitude: longitude,
          latitude: latitude,
          addressPoint: addressPoint,
          trashType: trashType,
          desc: desc,
          images: imageFiles);
      emit(PostReportRubbishSuccess());
    } catch (e) {
      emit(PostReportRubbishFailed(message: e.toString()));
    }
  }
}
