import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/Bloc/Bloc_home/home_cubit.dart';
import 'package:task1/Screen/details.dart';
import 'package:task1/data/all_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List type = ["All", "Villa", "Apartment", "Commercial"];
    List<HomeData> allHome = [];
    final controller = PageController(viewportFraction: 0.8, keepPage: false);
    final pages = List.generate(
        4,
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

    context.read<HomeCubit>().fetchHomes();
    return Scaffold(
      backgroundColor: Colors.black12,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
          } else if (state is HomeSuccess) {
            allHome = state.fetchedHomes;
          } else if (state is HomeFailure) {
            print("Failure");
          } else if (state is HomeCategorySelected) {
            allHome = state.filterHomes;
          }
          return Column(
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
                            context
                                .read<HomeCubit>()
                                .updateSelectedIndex(index, type[index]);
                          },
                          child: Text(
                            type[index],
                            style: TextStyle(
                                color: index == state.isSelected
                                    ? Colors.deepPurple
                                    : Colors.black38),
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
              state is HomeLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: GridView.builder(
                        itemCount: allHome.length,
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Details(allHome[index].id),
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
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  allHome[index].image),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: Colors.white),
                                      height: size.height * 0.12,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text(
                                                allHome[index].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: Text(
                                                "${allHome[index].periodtime} month",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: Colors.black38),
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            context
                                                .read<HomeCubit>()
                                                .isFavorite(index);
                                          },
                                          icon: Icon(
                                            allHome[index].isFavorite == 0
                                                ? Icons.favorite_border
                                                : Icons.favorite,
                                            color:
                                                allHome[index].isFavorite == 1
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
          );
        },
      ),
    );
  }
}
