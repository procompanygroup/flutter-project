import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task1/tab_screen.dart';
import '../l10n/app_localizations.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var image = File('');
  final picker = ImagePicker();
  bool uploading = false;
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
                  top: size.height * 0.05, bottom: size.height * 0.02),
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
                    AppLocalizations.of(context)!.register,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
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
                  padding: EdgeInsets.only(top: size.height * 0.12),
                  child: Container(
                    height: size.height * 0.75,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        color: Colors.white),
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            Text(AppLocalizations.of(context)!.personal),
                            SizedBox(
                              height: size.height * 0.07,
                              child: TextFormField(
                                  // key: const ValueKey("Email"),
                                  decoration: InputDecoration(
                                      labelText:
                                          AppLocalizations.of(context)!.first,
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
                                          AppLocalizations.of(context)!.last,
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
                                      labelText: "Mobile",
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
                                  // key: const ValueKey("E"),
                                  decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)!
                                          .personal,
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
                            Text(AppLocalizations.of(context)!.login),
                            SizedBox(
                              height: size.height * 0.07,
                              child: TextFormField(
                                  // key: const ValueKey("Email"),
                                  decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)!
                                          .username,
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
                                      labelText: AppLocalizations.of(context)!
                                          .password,
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 48.0, right: 48),
                              child: SizedBox(
                                width: 250,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TabScreen(),
                                          ));
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepPurple.shade300),
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!.register,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.18,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: FileImage(image)),
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.blueGrey),
                    child: IconButton(
                        onPressed: () {
                          getImagefromGallery();
                        },
                        icon: const Icon(Icons.camera_alt_outlined)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  getImagefromGallery() async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      setState(() {
        image = File(pickedfile.path);
        print(image);
      });
      setState(() {
        uploading = true;
      });
    } else {
      print("No image Selected");
    }
  }
}
