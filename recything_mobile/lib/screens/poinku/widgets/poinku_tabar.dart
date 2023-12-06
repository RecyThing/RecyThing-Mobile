import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/get_vouchers/get_vouchers_cubit.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/models/get_vouchers_model.dart';
import 'package:recything_mobile/repositories/get_vouchers.dart';
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
  final _scrollController = ScrollController();
  // List<GetVouchersModel> vouchers = [];
  // bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    context.read<GetVouchersCubit>().getVouchers();
    _scrollPagination();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _scrollPagination() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<GetVouchersCubit>().getVouchers();
      }
    });
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
              BlocBuilder<GetVouchersCubit, GetVouchersState>(
                  builder: ((context, state) {
                if (state is GetVouchersLoading && state.isFirstFetch) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Pallete.main,
                  ));
                }

                List<GetVouchersModel> vouchers = [];
                bool isLoadMore = false;

                if (state is GetVouchersLoading) {
                  vouchers = state.oldVouchersData ?? [];
                  isLoadMore = true;
                } else if (state is GetVouchersLoaded) {
                  vouchers = state.vouchers;
                }

                return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(0),
                    itemCount: vouchers.length + (isLoadMore ? 1 : 0),
                    itemBuilder: ((context, index) {
                      if (index < vouchers.length) {
                        final dataIndexed = vouchers[index];
                        return PoinkuVoucher(
                          imageUrl: dataIndexed.image,
                          voucherTitle: dataIndexed.rewardName,
                          point: dataIndexed.point.toString(),
                          expiredDate: dataIndexed.endDate,
                          description: dataIndexed.description,
                        );
                      } else {
                        Timer(Duration(milliseconds: 30), () {
                          _scrollController.jumpTo(
                              _scrollController.position.maxScrollExtent);
                        });

                        return Center(
                          child: CircularProgressIndicator(
                            color: Pallete.main,
                          ),
                        );
                      }
                    }));
              })),
              ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: 3,
                  itemBuilder: ((context, index) => const PoinkuRiwayat())),
            ],
          ))
        ],
      ),
    );
  }

  // Future<void> _getVouchers() async {
  //   final response = await GetVouchersRepo().getVouchers(page: page.toString());
  //   setState(() {
  //     vouchers = vouchers + response;
  //   });
  // }
}
