import 'package:flutter/material.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/poinku/widgets/poinku_riwayat.dart';
import 'package:recything_mobile/screens/poinku/widgets/poinku_voucher.dart';

class PoinkuTabar extends StatefulWidget {
  const PoinkuTabar({super.key});

  @override
  State<PoinkuTabar> createState() => _PoinkuTabarState();
}

class _PoinkuTabarState extends State<PoinkuTabar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          TabBar.secondary(
              labelPadding: const EdgeInsets.only(bottom: 8),
              indicatorColor: Pallete.main,
              labelColor: Pallete.main,
              unselectedLabelColor: Pallete.dark3,
              controller: _tabController,
              tabs: [
                Text(
                  "Voucher",
                  style: ThemeFont.interText,
                ),
                Text(
                  "Riwayat",
                  style: ThemeFont.interText,
                )
              ]),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView.builder(
                  itemCount: 3,
                  itemBuilder: ((context, index) => const PoinkuVoucher())),
              ListView.builder(
                  itemCount: 3,
                  itemBuilder: ((context, index) => const PoinkuRiwayat())),
            ],
          ))
        ],
      ),
    );
  }
}
