import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    late bool select = false;
    List type = ["Villa", "Apartment", "Commercial", "Home"];
    TextStyle tStyle(bool active) {
      print(active);
      //print(isSelected);
      return TextStyle(color: active ? Colors.deepPurple : Colors.black38);
    }

    final controller = PageController(viewportFraction: 0.8, keepPage: false);
    final pages = List.generate(
        2,
        (index) => Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("images/img.png"), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06, vertical: size.height * 0.01),
              child: SizedBox(
                height: size.height * 0.2,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.08, top: size.height * 0.08),
                  child: const Text(
                    "5 % off",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ));
    late int isSelected = 0;
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          Container(
            height: size.height * 0.12,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade300,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          ),
          SizedBox(
              height: size.height * 0.06,
              child: Wrap(
                direction: Axis.horizontal,
                children: List.generate(type.length, (index) {
                  return TextButton(
                      onPressed: () {
                        setState(() {
                          isSelected = index;
                          print(isSelected);
                          print(index);
                        });
                      },
                      child: Text(
                        type[index],
                        style: tStyle(isSelected == index),
                      ));
                }),
              )),
          SizedBox(
            height: size.height * 0.2,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.17,
                  child: PageView.builder(
                    controller: controller,
                    // itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    type: WormType.underground,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Details(),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                      height: size.height * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("images/img.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white),
                            height: size.height * 0.12,
                          ),
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      "Wonderful Country Villa",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 7),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Text(
                                      "period : 24 month",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 7,
                                          color: Colors.black38),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    select = !select;
                                  });
                                  print(select);
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: select
                                      ? Colors.deepPurple
                                      : Colors.black38,
                                ),
                                //disabledColor: Colors.black,
                                //isSelected: select,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
