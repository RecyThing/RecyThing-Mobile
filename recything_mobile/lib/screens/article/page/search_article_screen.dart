import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/screens/article/widget/searchbar.dart';
import 'package:recything_mobile/widgets/list_artikel_global.dart';

import '../../../bloc/get_article/get_article_cubit.dart';
import '../widget/cari_artikel/artikel_tidak_ditemukan.dart';
import '../widget/header_page.dart';

class SearchArticleScreen extends StatefulWidget {
  const SearchArticleScreen({super.key});

  @override
  State<SearchArticleScreen> createState() => _SearchArticleScreenState();
}

class _SearchArticleScreenState extends State<SearchArticleScreen> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    context.read<GetArticleCubit>().getAllArticle(1);
    _focusNode = FocusNode();

    // Fokus pada TextField setelah widget diinisialisasi
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 66, left: 16, right: 16),
          child: Column(
            children: [
              HeaderPageWidget(title: 'Cari Artikel'),
              SizedBox(height: 24),
              SearchBarWidget(
                onChanged: (value) {
                  context.read<GetArticleCubit>().searchArticle(value);
                },
                onTap: () {},
                readOnly: false, focusNode: _focusNode,
              ),
              SizedBox(height: 10),
              BlocBuilder<GetArticleCubit, GetArticleState>(
                  builder: (context, state) {
                if (state is GetArticleSuccess) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return ListArticleGlobalWidget(
                            image: state.data[index].image,
                            title: state.data[index].title,
                            category: state.data[index].getCategoryString(),
                            like: state.data[index].like.toString(),
                            updateDate: state.data[index].updateDate,
                            id: state.data[index].id);
                      });
                } else if (state is GetArticleFailure) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: ArtikelTidakDitemukanWidget(),
                  );
                } else if (state is GetArticleLoading) {
                  return SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator());
                }
                return SizedBox();
              })
            ],
          ),
        ),
      ),
    );
  }
}
