import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/Bloc/Bloc_profile/profile_cubit.dart';
import 'package:task1/data/personal_information.dart';

import '../l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Personal person = Personal(
      userName: "",
      mobile: "",
      nationality: "",
      image: "",
      gender: 1,
      email: "",
      password: "",
      maritalStatus: "",
      id: 1);

  var image = File('');

  final picker = ImagePicker();

  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    context.read<ProfileCubit>().profileInfo();
    return Scaffold(
        backgroundColor: Colors.deepPurple.shade300,
        body: SingleChildScrollView(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                print("Loading");
              } else if (state is ProfileSuccess) {
                person = state.fetchedPerson;
                // print(token);
                print("Success");
              } else if (state is ProfileFailure) {
                print("Failure");
              } else if (state is UploadedImageState) {
                print("Uploaded Image");
              }
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.038, bottom: size.height * 0.038),
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
                        padding: EdgeInsets.only(top: size.height * 0.11),
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Email"),
                                          Text(
                                            person.email,
                                            style: const TextStyle(
                                                color: Colors.deepPurple),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Mobile"),
                                          Text(
                                            person.mobile,
                                            style: const TextStyle(
                                                color: Colors.deepPurple),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Marital State"),
                                          Text(
                                            person.maritalStatus,
                                            style: const TextStyle(
                                                color: Colors.deepPurple),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Gender"),
                                          Text(person.gender == 0
                                              ? "Female"
                                              : "Male")
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(AppLocalizations.of(context)!
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
                                                labelStyle: const TextStyle(
                                                    color: Colors.black38),
                                                filled: true,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                border: InputBorder.none)),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.07,
                                        child: TextFormField(
                                          // key: const ValueKey("Email"),
                                          decoration: InputDecoration(
                                              labelText:
                                                  "${AppLocalizations.of(context)!.confirm} ${AppLocalizations.of(context)!.password}",
                                              labelStyle: const TextStyle(
                                                  color: Colors.black38),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              border: InputBorder.none),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.deepPurple
                                                            .shade300),
                                              ),
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .save,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              )),
                                          ElevatedButton(
                                              onPressed: () async {
                                                final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                //print(prefs.getString("token"));
                                                prefs.clear();
                                                SystemNavigator.pop();
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red),
                                              ),
                                              child: const Text(
                                                "Log out",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ))
                                        ],
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
                            Stack(children: [
                              Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                    image: imagePath == ""
                                        ? DecorationImage(
                                            image: NetworkImage(person.image))
                                        : DecorationImage(
                                            image: FileImage(image)),
                                    borderRadius: BorderRadius.circular(80),
                                    color: Colors.blueGrey),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.25,
                                    top: size.height * 0.12),
                                child: IconButton(
                                    onPressed: () {
                                      getImagefromGallery();
                                      print(imagePath);
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.deepPurple,
                                    )),
                              ),
                            ]),
                            Text(
                              person.userName,
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.deepPurple),
                            ),
                            Text(
                              person.nationality,
                              style: const TextStyle(color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ));
  }

  String imagePath = "";

  getImagefromGallery() async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      setState(() {
        image = File(pickedfile.path);
        imagePath = pickedfile.path;
        context.read<ProfileCubit>().upload(imagePath, person.id);
        // print(image);
      });
      setState(() {
        uploading = true;
      });
    }
  }
}
