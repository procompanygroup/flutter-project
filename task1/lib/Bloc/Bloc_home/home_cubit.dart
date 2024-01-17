import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/all_home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());
  List<HomeData> fetchedHomes = [];
  List<HomeData> filterHomes = [];
  int isSelected = 0;

  void updateSelectedIndex(int selectedIndex, String type) {
    if (type == "All") {
      filterHomes = fetchedHomes;
    } else {
      filterHomes =
          fetchedHomes.where((element) => element.category == type).toList();
    }
    isSelected = selectedIndex;
    emit(HomeCategorySelected(selectedIndex, filterHomes));
  }

  void isFavorite(int i) {
    if (filterHomes.isEmpty) {
      if (fetchedHomes[i].isFavorite == 0) {
        fetchedHomes[i].isFavorite = 1;
      } else {
        fetchedHomes[i].isFavorite = 0;
      }
    } else {
      if (filterHomes[i].isFavorite == 0) {
        filterHomes[i].isFavorite = 1;
      } else {
        filterHomes[i].isFavorite = 0;
      }
    }

    emit(HomeIsFavorite(isSelected, filterHomes, fetchedHomes));
  }

  void fetchHomes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      print(prefs.getString("token"));
      String token = prefs.getString("token")!;
      var response = await http.post(
        Uri.parse('https://oras.orasweb.com/project/api/realstate/show'),
        headers: {'Authorization': 'Bearer $token'},
      );
      emit(HomeLoading());
      if (response.statusCode == 200) {
        var data = json.decode(response.body)["list"];
        fetchedHomes.clear();
        isSelected = 0;
        filterHomes.clear();
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
