// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:recything_mobile/constants/pallete.dart';

// import '../../../../bloc/get_article/get_article_cubit.dart';

// class KontenDetailArtikelWidget extends StatelessWidget {
//   const KontenDetailArtikelWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final int index = ModalRoute.of(context)!.settings.arguments as int? ?? 0;

//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: BlocBuilder<GetArticleCubit, GetArticleState>(
//         builder: (context, state) {
//           if (state is GetArticleSuccess) {
//             return Column(
//               children: [
//                 SizedBox(
//                   height: 240,
//                   width: double.infinity,
//                   child: Image.network(
//                     state.data[index].image,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         state.data[index].title,
//                         style: ThemeFont.bodyLargeBold,
//                         textAlign: TextAlign.justify,
//                       ),
//                       const SizedBox(height: 24),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                             child: Row(
//                               children: [
//                                 Text(
//                                   state.data[index].getCategoryString(),
//                                   style: ThemeFont.bodySmallRegular
//                                       .copyWith(color: Pallete.main),
//                                 ),
//                                 const SizedBox(
//                                   width: 8,
//                                 ),
//                                 const Text(
//                                   '|',
//                                   style: TextStyle(color: Pallete.dark4),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   state.data[index].updateDate,
//                                   style: ThemeFont.bodySmallRegular
//                                       .copyWith(color: Pallete.dark3),
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   height: 24,
//                                   width: 24,
//                                   child: Image.asset(
//                                     'assets/icons/icon_like_outline.png',
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 5),
//                                 Text(
//                                   state.data[index].like.toString(),
//                                   style: ThemeFont.bodySmallRegular
//                                       .copyWith(color: Pallete.dark3),
//                                 ),
//                                 const SizedBox(width: 5),
//                                 // const Icon(Icons.share_outlined),
//                                 // const SizedBox(width: 5),
//                                 // Text(
//                                 //   state.data[index].share.toString(),
//                                 //   style: ThemeFont.bodySmallRegular
//                                 //       .copyWith(color: Pallete.dark3),
//                                 // ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       const Divider(),
//                       Html(
//                         data: state.data[index].content,
//                         style: {
//                           "p": Style(textAlign: TextAlign.justify),
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }
//           return SizedBox();
//         },
//       ),
//     );
//   }
// }
