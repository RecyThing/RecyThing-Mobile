import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recything_mobile/bloc/get_all_drop_point/get_all_drop_point_cubit.dart';
import 'package:recything_mobile/screens/article/widget/daftar_lokasi/list_lokasi.dart';
import 'package:recything_mobile/screens/article/widget/header_page.dart';
import 'package:recything_mobile/screens/article/widget/searchbar.dart';

class DaftarLokasiScreen extends StatefulWidget {
  const DaftarLokasiScreen({super.key});

  @override
  State<DaftarLokasiScreen> createState() => _DaftarLokasiScreenState();
}

class _DaftarLokasiScreenState extends State<DaftarLokasiScreen> {
  final ScrollController _scrollController = ScrollController();

  void initState() {
    super.initState();
    context.read<GetAllDropPointCubit>().fetchData(context: context, page: 1);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context
              .read<GetAllDropPointCubit>()
              .fetchData(context: context, page: 1);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 66),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    HeaderPageWidget(title: 'Daftar Lokasi'),
                    SizedBox(height: 24),
                    SearchBarWidget(
                      onChanged: null,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              Divider(),
              // SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<GetAllDropPointCubit, GetAllDropPointState>(
                  builder: (context, state) {
                    if (state is GetAllDropPointLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is GetAllDropPointFailure) {
                      return Center(child: Text('Error: ${state.msg}'));
                    } else if (state is GetAllDropPointSuccess) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: ListView.builder(
                            controller: _scrollController,
                            padding: EdgeInsets.zero,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              if (state.data.isEmpty) {
                                return Center(
                                  child: Text('Belum ada drop points'),
                                );
                              }
                              if (index < state.data.length) {
                                return ListLokasiWidget(
                                  no: index,
                                  item: state.data[index],
                                );
                              } else {
                                Timer(Duration(milliseconds: 30), () {
                                  _scrollController.jumpTo(_scrollController
                                      .position.maxScrollExtent);
                                });
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      );
                    }
                    return SizedBox();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
