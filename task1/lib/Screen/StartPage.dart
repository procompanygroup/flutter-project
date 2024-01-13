import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/Screen/LogIn.dart';
import 'package:task1/Screen/register.dart';

import '../l10n/app_localizations.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.3, bottom: size.height * 0.22),
            child: Center(
              child: SvgPicture.asset(
                "images/realestate-logo.svg",
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                width: size.width * 0.55,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.65,
            height: size.height * 0.06,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LogIn(),
                  ));
                },
                child: Text(
                  "${AppLocalizations.of(context)!.start}  >",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepPurple),
                )),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Register(),
                ));
              },
              child: Text(AppLocalizations.of(context)!.new_account,
                  style: const TextStyle(color: Colors.white, fontSize: 20)))
        ],
      ),
    );
  }
}
