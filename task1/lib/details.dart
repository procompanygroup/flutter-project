import 'package:flutter/material.dart';
import 'package:task1/location.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // Future<void> fetchData() async {
  // try {
  // var response = await http.get(
  //   Uri.parse('https://oras.orasweb.com/project/api/realstate/show'));
  // if (response.statusCode == 200) {
  //   var data = json.decode(response.body);
  //  print(data);
  // } else {
  //    print(response.statusCode);
  // }
  // } catch (error) {
  //  print(error);
  // }
  // }

  @override
  void initState() {
    // fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget text(String a, String b) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            a,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            b,
            style: const TextStyle(color: Colors.black38, fontSize: 12),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: Column(
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
                const Text(
                  "Property",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  width: size.width * 0.3,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Center(
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.25,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "images/img.png",
                                )),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    text("Wonderful Country Villa",
                        "Design: Swimmers Retro White Wallpaper NEW - Peel & Stick Wallpaper Removable Self Adhesive and Traditional wallpaper #53402 All wallpaper are printed on high quality."),
                    text("Developed by", "Engineering Holding Company"),
                    text("Implementation Period", "24 month"),
                    text("Total cost", "60000000"),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.65,
                        height: size.height * 0.07,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Location(),
                              ));
                              // fetchData();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.deepPurple.shade300),
                            ),
                            child: const Text(
                              "Show Location",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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
    );
  }
}
