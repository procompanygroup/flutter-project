import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task1/Bloc/Bloc_profile/profile_cubit.dart';
import 'package:task1/data/personal_information.dart';

import '../l10n/app_localizations.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  Personal? person;
  var image = File('');
  final picker = ImagePicker();
  bool uploading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    context.read<ProfileCubit>().profileInfo();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              print("Loading");
            } else if (state is ProfileSuccess) {
              person = state.fetchedPerson;
              // print(token);
              print("Success");
            } else if (state is ProfileFailure) {
              print("Failure");
            }
            return Scaffold(
              backgroundColor: Colors.deepPurple.shade300,
              body: state is ProfileSuccess
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.038,
                                bottom: size.height * 0.038),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    )),
                                Text(
                                  AppLocalizations.of(context)!.personal,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  width: size.width * 0.3,
                                ),
                                const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.11),
                                child: Column(
                                  children: [
                                    Container(
                                      height: size.height * 0.7,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              topLeft: Radius.circular(30)),
                                          color: Colors.white),
                                      child: Form(
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              12.0, size.height * 0.15, 12, 12),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Email"),
                                                  Text(
                                                    person!.email,
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.deepPurple),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Mobile"),
                                                  Text(
                                                    person!.mobile,
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.deepPurple),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Marital State"),
                                                  Text(
                                                    person!.maritalStatus,
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.deepPurple),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Gender"),
                                                  Text(person!.gender == 0
                                                      ? "Female"
                                                      : "Male")
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(AppLocalizations.of(
                                                          context)!
                                                      .favorite),
                                                  const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.deepPurple,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "${AppLocalizations.of(context)!.change} ${AppLocalizations.of(context)!.password}",
                                                style: const TextStyle(
                                                    color: Colors.black38),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.07,
                                                child: TextFormField(
                                                    // key: const ValueKey("Email"),
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            "${AppLocalizations.of(context)!.new_} ${AppLocalizations.of(context)!.password} ",
                                                        labelStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black38),
                                                        filled: true,
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                        border:
                                                            InputBorder.none)),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.07,
                                                child: TextFormField(
                                                  // key: const ValueKey("Email"),
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          "${AppLocalizations.of(context)!.confirm} ${AppLocalizations.of(context)!.password}",
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .black38),
                                                      filled: true,
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      border: InputBorder.none),
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 48.0, right: 48),
                                                child: SizedBox(
                                                  width: size.width * 0.65,
                                                  height: size.height * 0.06,
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .deepPurple
                                                                    .shade300),
                                                      ),
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .save,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 140,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(person!.image)),
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          color: Colors.blueGrey),
                                      child: IconButton(
                                          onPressed: () {
                                            getImagefromGallery();
                                            context
                                                .read<ProfileCubit>()
                                                .upload(imagePath, person!.id);
                                          },
                                          icon: const Icon(
                                              Icons.camera_alt_outlined)),
                                    ),
                                    Text(
                                      person!.userName,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          color: Colors.deepPurple),
                                    ),
                                    Text(
                                      person!.nationality,
                                      style: const TextStyle(
                                          color: Colors.black38),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: Text("error network"),
                    ),
            );
          },
        );
      },
    );
  }

  String imagePath = "";
  getImagefromGallery() async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      image = File(pickedfile.path);
      imagePath = pickedfile.path;
      // print(image);
      uploading = true;
    }
  }
}
