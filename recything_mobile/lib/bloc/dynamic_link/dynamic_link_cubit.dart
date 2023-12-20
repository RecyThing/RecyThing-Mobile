import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:meta/meta.dart';

part 'dynamic_link_state.dart';

class DynamicLinkCubit extends Cubit<DynamicLinkState> {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  String? idArtikel;

  DynamicLinkCubit() : super(DynamicLinkInitial());

  void saveIdArticle(String id) {
    try {
      // final initialLink = await dynamicLinks.getInitialLink();
      // idArtikel = initialLink?.link.pathSegments.last.toString();
      idArtikel = id;
      emit(DynamicLinkSuccess(id_artikel: idArtikel ?? ""));
    } catch (e) {}
    idArtikel = id;
  }

  void clearIdArticle() {
    idArtikel = "";
  }
}
