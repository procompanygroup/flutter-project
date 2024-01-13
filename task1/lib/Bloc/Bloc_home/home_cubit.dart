import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../data/all_home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HomeData> fetchedHomes = [];
  List<HomeData> filterHomes = [];

  void updateSelectedIndex(int selectedIndex, String type) {
    if (type == "All") {
      filterHomes = fetchedHomes;
    } else {
      filterHomes =
          fetchedHomes.where((element) => element.category == type).toList();
    }
    print(fetchedHomes);
    emit(HomeCategorySelected(selectedIndex, filterHomes));
  }

  void isFavorite(int i) {
    if (filterHomes[i].isFavorite == 0) {
      filterHomes[i].isFavorite = 1;
    } else {
      filterHomes[i].isFavorite = 0;
    }
    emit(HomeIsFavorite());
  }

  void fetchHomes(String token) async {
    try {
      //print(token);
      var response = await http.post(
        Uri.parse('https://oras.orasweb.com/project/api/realstate/show'),
        headers: {'Authorization': 'Bearer $token'},
      );
      emit(HomeLoading());
      if (response.statusCode == 200) {
        var data = json.decode(response.body)["list"];
        for (var item in data) {
          HomeData home = HomeData.fromJson(item);
          fetchedHomes.add(home);
        }
        emit(HomeSuccess(fetchedHomes));
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      emit(HomeFailure());
      print(error);
    }
  }
}
