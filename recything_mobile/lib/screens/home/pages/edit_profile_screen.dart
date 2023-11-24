import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:recything_mobile/bloc/get_user_profile/get_user_profile_cubit.dart';
import 'package:recything_mobile/bloc/update_user_profile/update_user_profile_cubit.dart';
import 'package:recything_mobile/constants/pallete.dart';
import 'package:recything_mobile/widgets/forms/custom_back_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _dateController = "Masukan tanggal lahir";
  String selectedValue = " ";

  @override
  Widget build(BuildContext context) {
    Future<void> selectDate() async {
      DateTime currentDate = DateTime.now();
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      setState(() {
        _dateController =
            DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now());
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomBackButton(),
        ),
        title: Text(
          "Edit Profile",
          style: ThemeFont.heading6Medium,
        ),
        centerTitle: true,
        backgroundColor: Pallete.textMainButton,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocListener<UpdateUserProfileCubit, UpdateUserProfileState>(
          listener: (context, state) {
            if (state is UpdateUserProfileLoading) {
              const CircularProgressIndicator();
            } else if (state is UpdateUserProfileFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else if (state is UpdateUserProfileSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Pallete.main,
                  content: Text(
                    state.data,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
              Navigator.pushNamed(context, '/profile');
            }
          },
          child: BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
            builder: (context, state) {
              if (state is GetUserProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetUserProfilefailure) {
                return Text(state.message);
              } else if (state is GetUserProfileSuccess) {
                TextEditingController nameEcd =
                    TextEditingController(text: state.data.fullname);
                TextEditingController emailEcd =
                    TextEditingController(text: state.data.email);
                TextEditingController alamatEcd =
                    TextEditingController(text: state.data.address);
                selectedValue = state.data.purpose;
                _dateController = state.data.dateOfBirth;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 69, 196, 169),
                                shape: BoxShape.circle),
                            child: Text(
                              state.data.fullname.characters.first,
                              style: ThemeFont.heading3Bold.copyWith(
                                  fontSize: 60, color: Pallete.textMainButton),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Pallete.main,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2, color: Pallete.textMainButton)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    IconlyLight.camera,
                                    color: Pallete.textMainButton,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24, top: 40),
                      child: Text("Detail Akun",
                          style: ThemeFont.bodyNormalSemiBold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: MainTextField(
                        controller: nameEcd,
                        label: "Nama Lengkap",
                        prefixIcon: IconlyLight.profile,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: MainTextField(
                        controller: emailEcd,
                        enable: false,
                        label: "email",
                        prefixIcon: IconlyLight.message,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: MainTextField(
                        controller: alamatEcd,
                        maxLines: 4,
                        label: "Alamat",
                        prefixIcon: IconlyLight.location,
                      ),
                    ),
                    GestureDetector(
                      onTap: selectDate,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Pallete.dark3)),
                        child: MainTextField(
                          enable: false,
                          label: _dateController,
                          prefixIcon: IconlyLight.calendar,
                        ),
                      ),
                    ),
                    DropdownMenu(
                        width: MediaQuery.of(context).size.width * 0.9,
                        initialSelection: tujuanList.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectedValue = value ?? " ";
                          });
                        },
                        inputDecorationTheme: InputDecorationTheme(
                          contentPadding: const EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(),
                          ),
                        ),
                        label: const Text("Tujuan"),
                        leadingIcon: const Icon(IconlyLight.document),
                        dropdownMenuEntries: tujuanList
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList()),
                    Text(selectedValue),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: MainButton(
                              onPressed: () {
                                context
                                    .read<UpdateUserProfileCubit>()
                                    .updateProfile(
                                        context: context,
                                        fullname: nameEcd.text,
                                        address: alamatEcd.text,
                                        date: _dateController,
                                        purpose: selectedValue);
                              },
                              child: Text(
                                "Simpan",
                                style: ThemeFont.heading6Reguler.copyWith(
                                    color: Pallete.textMainButton,
                                    fontWeight: FontWeight.w700),
                              ))),
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

List<String> tujuanList = [
  "untuk daur ulang sampah",
  "melaporkan tumpukan sampah",
  "melaporkan pelanggaran sampah",
  "mengikuti misi lingkungan",
  "terhubung dengan komunitas"
];
