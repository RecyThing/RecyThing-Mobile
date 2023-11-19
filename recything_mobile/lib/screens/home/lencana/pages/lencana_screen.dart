import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/lencana/pages/lencana_bronze_screen.dart';
import 'package:recything_mobile/screens/home/lencana/pages/lencana_gold_screen.dart';
import 'package:recything_mobile/screens/home/lencana/pages/lencana_platinum_screen.dart';
import 'package:recything_mobile/screens/home/lencana/pages/lencana_silver_screen.dart';

import 'package:recything_mobile/widgets/forms/custom_back_button.dart';

class LencanaScreen extends StatelessWidget {
  const LencanaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Pallete.textMainButton,
            leading: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: CustomBackButton(),
            ),
            title: Text(
              "Lencana",
              style: ThemeFont.heading6Medium,
            ),
            bottom: const TabBar(
                indicatorColor: Pallete.main,
                labelColor: Pallete.main,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: "Bronze"),
                  Tab(text: "Silver"),
                  Tab(text: "Gold"),
                  Tab(text: "Platinum")
                ]),
          ),
          body: const TabBarView(
            children: [
              LencanaBronzeScreen(),
              LencanaSilverScreen(),
              LencanaGoldScreen(),
              LencanaPlatinumScreen()
            ],
          )),
    );
  }
}
