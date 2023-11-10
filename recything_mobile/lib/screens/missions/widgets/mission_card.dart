import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';

class MissionCard extends StatelessWidget {
  final String title;
  final Widget subTitle;

  const MissionCard({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 13,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 76,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://ichef.bbci.co.uk/news/976/cpsprodpb/1D11/production/_129014470_gettyimages-1402625142.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: 166,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: ThemeFont.bodyNormalSemiBold,
                ),
                const SizedBox(
                  height: 6,
                ),
                subTitle
              ],
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          CircleAvatar(
            backgroundColor: Pallete.mainDarker,
            child: IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/detail-mission'),
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 22,
                )),
          )
        ],
      ),
    );
  }
}
