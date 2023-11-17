import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/komunitas/detail_event_komunitas_screen.dart';

class KomunitasEventCard extends StatelessWidget {
  const KomunitasEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const DetailEventKomunitasScreen(),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 88,
                  width: 88,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  height: 88,
                  width: 88,
                  child: Center(
                    child: SizedBox(
                      width: 60,
                      child: Text(
                        "21 Oktober",
                        textAlign: TextAlign.center,
                        style: ThemeFont.bodySmall
                            .copyWith(color: Colors.white, height: 1.6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bersih bersih Pantai Pandawa",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: ThemeFont.bodyMediumBold,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "1000 Peserta",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeFont.bodySmallRegular
                        .copyWith(color: Pallete.dark4),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Pantai Pandawa, JLn Tenku Umar, Jakarta",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeFont.bodySmallRegular
                        .copyWith(color: Pallete.dark3),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
