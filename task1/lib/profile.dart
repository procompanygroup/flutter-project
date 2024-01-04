import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: SingleChildScrollView(
        child: Column(
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
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ))
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .contribution),
                                    const Text(
                                      "127",
                                      style:
                                          TextStyle(color: Colors.deepPurple),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(AppLocalizations.of(context)!.payment),
                                    const Text(
                                      "15",
                                      style:
                                          TextStyle(color: Colors.deepPurple),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .languages),
                                    const Text(
                                      "English",
                                      style:
                                          TextStyle(color: Colors.deepPurple),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!.location),
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.deepPurple,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!.favorite),
                                    const Icon(
                                      Icons.favorite_border,
                                      color: Colors.deepPurple,
                                    )
                                  ],
                                ),
                                Text(
                                  "${AppLocalizations.of(context)!.change} ${AppLocalizations.of(context)!.password}",
                                  style: const TextStyle(color: Colors.black38),
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
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
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
                                    keyboardType: TextInputType.visiblePassword,
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
                                              MaterialStateProperty.all(
                                                  Colors.deepPurple.shade300),
                                        ),
                                        child: Text(
                                          AppLocalizations.of(context)!.save,
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
                            borderRadius: BorderRadius.circular(80),
                            color: Colors.blueGrey),
                      ),
                      const Text(
                        "Mark Steve",
                        style:
                            TextStyle(fontSize: 25, color: Colors.deepPurple),
                      ),
                      const Text(
                        "Arch,Engineering",
                        style: TextStyle(color: Colors.black38),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
