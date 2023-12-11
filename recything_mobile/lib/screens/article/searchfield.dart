// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recything_mobile/bloc/get_article/get_article_cubit.dart';
// import 'package:searchfield/searchfield.dart';

// import '../../models/article_model.dart';
// import 'theme/color_style.dart';

// class SearchFieldWidget extends StatelessWidget {
//   const SearchFieldWidget({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: ThemeColor().dark3Color,
//           width: 1,
//         ),
//       ),
//       child: BlocBuilder<GetArticleCubit, GetArticleState>(
//         builder: (context, state) {
//           if (state is GetArticleSuccess) {
//             List<ArticleModel> articles = state.data;

//             // Map ArticleModel instances to suggestions
//             List<SearchFieldListItem<ArticleModel>> suggestions = articles
//                 .map<SearchFieldListItem<ArticleModel>>((ArticleModel article) {
//                   return SearchFieldListItem<ArticleModel>(
//                     value: article,
//                     builder: (BuildContext context, ArticleModel query, bool isSelected) {
//                       // You can customize the appearance of each suggestion item here
//                       return ListTile(
//                         title: Text(article.title),
//                         // Add other information as needed
//                       );
//                     },
//                   );
//                 })
//                 .toList();

//             return SearchField(suggestions: suggestions);
//           }
//           return SizedBox();
//         },
//       ),
//     );
//   }
// }
