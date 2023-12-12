import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_proof_state.dart';

class UploadProofCubit extends Cubit<UploadProofState> {
  UploadProofCubit() : super(UploadProofInitial());

  final _imagePicker = ImagePicker();
  List<XFile> _images = [];

  void resetState() {
    _images.clear();
    emit(UploadProofInitial());
  }

  void selectImages() async {
    List<XFile> selectedImages = await _imagePicker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      emit(UploadProofLoading());
      _images.addAll(selectedImages);
      emit(UploadProofSuccess(images: _images));
    }
  }

  void deleteImage({required int index}) async {
    emit(UploadProofLoading());
    _images.removeAt(index);
    emit(UploadProofSuccess(images: _images));
  }
}
