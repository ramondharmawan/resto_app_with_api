import 'package:flutter/material.dart';
import 'package:resto_app_with_api/features/data/api/api_service.dart';
import 'package:resto_app_with_api/features/data/model/get_resto_detail.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late GetRestoDetail _getRestoDetail;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  ResultState get state => _state;
  GetRestoDetail get getRestoDetail => _getRestoDetail;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.getRestoDetail();
      if (restaurant.restaurant.toJson().isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _getRestoDetail = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
