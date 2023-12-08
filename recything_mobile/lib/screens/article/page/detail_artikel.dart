import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/get_article/get_article_cubit.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/article/widget/detail_artikel/konten_detail_artikel.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';
import 'package:social_share/social_share.dart';

class DetailArtikelScreen extends StatefulWidget {
  const DetailArtikelScreen({super.key});

  @override
  State<DetailArtikelScreen> createState() => _DetailArtikelScreenState();
}

class _DetailArtikelScreenState extends State<DetailArtikelScreen> {
  final List<Map<String, dynamic>> socialMedia = [
    {
      "color": Pallete.primaryBlue,
      "image": "assets/icons/icon_copyLink.png",
      "share": "link"
    },
    {
      "color": Pallete.purpleIG,
      "image": "assets/icons/icon_instagram.png",
      "share": "instagram"
    },
    {
      "color": Pallete.greenWA,
      "image": "assets/icons/icon_whatsapp.png",
      "share": "wa"
    },
    {
      "color": Pallete.blueFB,
      "image": "assets/icons/icon_facebook.png",
      "share": "fb"
    },
    {
      "color": Pallete.blueTelegram,
      "image": "assets/icons/icon_telegram.png",
      "share": "telegram"
    }
  ];
  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int? ?? 0;

    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 42, left: 16, right: 16),
            child: HeaderPageWidget(title: 'Detail Artikel'),
          ),
          const SizedBox(height: 24),
          const KontenDetailArtikelWidget()
        ],
      ),
      bottomNavigationBar: Container(
        height: 88,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: Pallete.main,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    'Share',
                    style: ThemeFont.heading6Bold.copyWith(color: Colors.white),
                  )),
                ),
                onTap: () {
                  showModalBottomSheet<void>(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 46),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 31,
                                      child: Text(
                                        "Bagikan ke teman kamu",
                                        style: ThemeFont.bodyMediumMedium,
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    BlocBuilder<GetArticleCubit,
                                        GetArticleState>(
                                      builder: (context, state) {
                                        if (state is GetArticleSuccess) {
                                          return Row(
                                            children: [
                                              SizedBox(
                                                  height: 80,
                                                  width: 80,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: Image.network(
                                                      state.data[index].image,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            140,
                                                    child: Text(
                                                      state.data[index].title,
                                                      style: ThemeFont
                                                          .heading6Medium,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        state.data[index]
                                                            .createDate,
                                                        style: ThemeFont
                                                            .bodySmallRegular,
                                                      ),
                                                      SizedBox(width: 10),
                                                      Image.asset(
                                                          'assets/icons/icon_vertical_divider.png'),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        state.data[index]
                                                            .getCategoryString(),
                                                        style: ThemeFont
                                                            .bodySmallRegular,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          );
                                        }
                                        return SizedBox();
                                      },
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 24),
                              Divider(),
                              SizedBox(height: 24),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mau bagikan lewat mana?",
                                      style: ThemeFont.heading6Medium,
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                        height: 60,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: socialMedia.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                SizedBox(
                                                  height: 60,
                                                  width: 60,
                                                  child: GestureDetector(
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          socialMedia[index]
                                                              ["color"],
                                                      child: SizedBox(
                                                        height: 24,
                                                        width: 24,
                                                        child: Image.asset(
                                                            socialMedia[index]
                                                                ["image"]),
                                                      ),
                                                    ),
                                                    onTap: () async {
                                                      if (socialMedia[index]
                                                              ["share"] ==
                                                          "link") {
                                                        SocialShare
                                                            .copyToClipboard(
                                                                text:
                                                                    "ini link");
                                                      } else if (socialMedia[
                                                              index]["share"] ==
                                                          "instagram") {
                                                      } else if (socialMedia[
                                                              index]["share"] ==
                                                          "wa") {
                                                        SocialShare
                                                                .shareWhatsapp(
                                                                    "ini link")
                                                            .then((value) {
                                                          print(value);
                                                        });
                                                      } else if (socialMedia[
                                                              index]["share"] ==
                                                          "fb") {
                                                      } else if (socialMedia[
                                                              index]["share"] ==
                                                          "telegram") {
                                                        SocialShare
                                                                .shareTelegram(
                                                                    "ini link")
                                                            .then((value) {
                                                          print(value);
                                                        });
                                                      }
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 15)
                                              ],
                                            );
                                          },
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
              ),
            ),
            const SizedBox(width: 15),
            Container(
              height: 56,
              width: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: Pallete.main),
                  borderRadius: BorderRadius.circular(12)),
              child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    'assets/icons/icon_green_like_outline.png',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
