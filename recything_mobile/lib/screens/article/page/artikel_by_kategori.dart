import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/get_article/get_article_cubit.dart';
import 'package:recything_mobile/screens/article/widget/cari_artikel/artikel_tidak_ditemukan.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';
import 'package:recything_mobile/screens/article/widget/list_artikel.dart';
import 'package:recything_mobile/screens/article/widget/searchbar.dart';

class ArtikelByKategoriScreen extends StatefulWidget {
  const ArtikelByKategoriScreen({super.key});

  @override
  State<ArtikelByKategoriScreen> createState() =>
      _ArtikelByKategoriScreenState();
}

class _ArtikelByKategoriScreenState extends State<ArtikelByKategoriScreen> {
  @override
  Widget build(BuildContext context) {

    final Map<String, String?> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final String category = arguments['category']!;
    final String title = arguments['title']!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 66, left: 16, right: 16),
        child: Column(
          children: [
            HeaderPageWidget(title: title),
            SizedBox(height: 24),
            BlocBuilder<GetArticleCubit, GetArticleState>(
              builder: (context, state) {
                return SearchBarWidget(
                  onChanged: (value) {
                    context
                        .read<GetArticleCubit>()
                        .searchArticleByCategory(category, value);
                    if (state is GetArticleFailure) {
                      return Center(child: ArtikelTidakDitemukanWidget());
                    } else if (state is GetArticleLoading) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 150),
                            SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator()),
                          ]);
                    }
                    if (value == "") {
                      context
                          .read<GetArticleCubit>()
                          .getArticleByCategory(category);
                    }
                  },
                );
              },
            ),
            SizedBox(height: 8),
            BlocBuilder<GetArticleCubit, GetArticleState>(
              builder: (context, state) {
                if (state is GetArticleLoading) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 150),
                        SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator()),
                      ]);
                } else if (state is GetArticleFailure) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 150),
                      ArtikelTidakDitemukanWidget(),
                    ],
                  );
                } else if (state is GetArticleSuccess) {
                  return ListArtikelWidget();
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
