import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:task1/data/home_details.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  void fetchDetails(int id, String token) async {
    HomeDetails fetchedDetails;
    try {
      print(token);
      var response = await http.post(
          Uri.parse('https://oras.orasweb.com/project/api/realstate/iteminfo'),
          headers: {'Authorization': 'Bearer $token'},
          body: {"id": id.toString()});
      emit(DetailsLoading());
      //  print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body)["iteminfo"];
        print(data);
        HomeDetails home = HomeDetails.fromJson(data[0]);
        fetchedDetails = home;
        emit(DetailsSuccess(fetchedDetails));
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      emit(DetailsFailure());
      print(error);
    }
  }
}
