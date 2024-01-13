import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/Bloc/Bloc_details/details_cubit.dart';
import 'package:task1/Screen/location.dart';
import 'package:task1/data/home_details.dart';

class Details extends StatelessWidget {
  final String token;
  final int id;
  Details(this.id, this.token, {super.key});
  @override
  Widget build(BuildContext context) {
    late HomeDetails? homeDetails = HomeDetails(
        realModel: "",
        name: "",
        periodTime: "",
        desc: "",
        owner: "",
        price: "",
        id: id,
        location: "",
        image: "");
    context.read<DetailsCubit>().fetchDetails(id, token);
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

    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsLoading) {
          print("Loading");
        } else if (state is DetailsSuccess) {
          homeDetails = state.fetchedDetails;
          print(id);
          // print("Success");
        } else if (state is DetailsFailure) {
          print("Failure");
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
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      homeDetails!.image,
                                    )),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        text(homeDetails!.name, homeDetails!.desc),
                        text("Owner", homeDetails!.owner),
                        text("Implementation Period",
                            "${homeDetails!.periodTime} month"),
                        text("Total Price", homeDetails!.price),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
      },
    );
  }
}
