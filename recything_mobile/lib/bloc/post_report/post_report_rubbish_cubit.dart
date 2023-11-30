import 'package:bloc/bloc.dart';
import 'package:recything_mobile/bloc/post_report/post_report_rubbish_state.dart';
import 'package:recything_mobile/models/report_model.dart';
import 'package:recything_mobile/repositories/report_repo.dart';

class PostReportRubbishCubit extends Cubit<PostReportRubbishState> {
  PostReportRubbishCubit() : super(PostReportRubbishInitial());

  void reports(
      {required String reportType,
      required String location,
      required num longitude,
      required num latitude,
      required String addressPoint,
      required String trashType,
      required String desc,
      required List<ImageModel> images}) async {
    try {
      emit(PostReportRubbishLoading());
      await ReportRepo().reports(
          reportType: reportType,
          location: location,
          longitude: longitude,
          latitude: latitude,
          addressPoint: addressPoint,
          trashType: trashType,
          desc: desc,
          images: images);
      emit(PostReportRubbishSuccess());
    } catch (e) {
      emit(PostReportRubbishFailed(message: e.toString()));
    }
  }
}
