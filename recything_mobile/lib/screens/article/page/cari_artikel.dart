import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/get_article/get_article_cubit.dart';
import 'package:recything_mobile/bloc/get_popular_article/get_popular_article_cubit.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';
import 'package:recything_mobile/screens/article/widget/searchbar.dart';
import 'package:recything_mobile/screens/article/widget/tapbar.dart';

import '../widget/cari_artikel/artikel_tidak_ditemukan.dart';

class CariArtikelScreen extends StatefulWidget {
  const CariArtikelScreen({super.key});

  @override
  State<CariArtikelScreen> createState() => _CariArtikelScreenState();
}

class _CariArtikelScreenState extends State<CariArtikelScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetArticleCubit>().getAllArticle(1);
    context.read<GetPopularArticleCubit>().getPopularArticle();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<GetArticleCubit>().getAllArticle(1);
    context.read<GetPopularArticleCubit>().getPopularArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 66, left: 16, right: 16),
        child: Column(
          children: [
            HeaderPageWidget(title: 'Cari Artikel'),
            SizedBox(height: 24),
            BlocBuilder<GetArticleCubit, GetArticleState>(
              builder: (context, state) {
                return SearchBarWidget(
                  onChanged: (value) {
                    context.read<GetArticleCubit>().searchArticle(value);
                    if (state is GetArticleSuccess) {
                    } else if (state is GetArticleFailure) {
                      return Center(child: ArtikelTidakDitemukanWidget());
                    }
                    if (value == "") {
                      context.read<GetArticleCubit>().getAllArticle(1);
                    }
                  },
                );
              },
            ),
            SizedBox(height: 8),
            TapBarWidget()
          ],
        ),
      ),
    );
  }
}
