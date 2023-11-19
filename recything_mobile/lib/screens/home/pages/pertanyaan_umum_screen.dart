import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/bloc/get_all_faq/get_all_faq_cubit.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/screens/home/widgets/pertanyaan_card.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

class PertanyaanUmumScren extends StatefulWidget {
  const PertanyaanUmumScren({super.key});

  @override
  State<PertanyaanUmumScren> createState() => _PertanyaanUmumScrenState();
}

class _PertanyaanUmumScrenState extends State<PertanyaanUmumScren> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllFaqCubit>().fetchFaq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Pallete.textMainButton,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomBackButton(),
        ),
        title: Text(
          "Pertanyaan Umum",
          style: ThemeFont.heading6Medium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const MainTextField(
                prefixIcon: IconlyLight.search, label: "Cari Pertanyaan..."),
            BlocBuilder<GetAllFaqCubit, GetAllFaqState>(
                builder: (context, state) {
              if (state is GetAllFaqLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetAllFaqFailure) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is GetAllFaqSuccess) {
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.data.length,
                    itemBuilder: ((context, index) => PertanyaanCard(
                          item: state.data[index],
                        )));
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
