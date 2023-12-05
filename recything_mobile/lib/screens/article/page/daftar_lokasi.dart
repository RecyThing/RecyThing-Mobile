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
  void initState() {
    super.initState();
    context
        .read<GetAllDropPointCubit>()
        .fetchData(context: context, limit: 10, page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 66),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  HeaderPageWidget(title: 'Daftar Lokasi'),
                  SizedBox(height: 24),
                  SearchBarWidget(),
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
                    return CircularProgressIndicator();
                  } else if (state is GetAllDropPointFailure) {
                    return Text(state.msg);
                  } else if (state is GetAllDropPointSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.67,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return ListLokasiWidget(item: state.data[index]);
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
    );
  }
}
