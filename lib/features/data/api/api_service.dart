import 'dart:convert';

import 'package:resto_app_with_api/features/data/model/get_resto_detail.dart';
import 'package:resto_app_with_api/features/data/model/post_add_review.dart';

import '../model/get_resto_list.dart';
import 'package:http/http.dart' as http;

import '../model/get_search.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';
  static const String _urlList = '/list';
  static const String _urlDetail = '/detail/';
  static const String _urlDetailId = 'id';
  static const String _urlSearch = '/search?q=<query>';
  static const String _urlPostReview = '/review';

  Future<GetRestoList> getRestoList() async {
    final response = await http.get(Uri.parse(_baseUrl + _urlList));

    if (response.statusCode == 200) {
      return GetRestoList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<GetRestoDetail> getRestoDetail() async {
    final response =
        await http.get(Uri.parse(_baseUrl + _urlDetail + _urlDetailId));

    if (response.statusCode == 200) {
      return GetRestoDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future<GetSearch> getSearch() async {
    final response = await http.get(Uri.parse(_baseUrl + _urlSearch));

    if (response.statusCode == 200) {
      return GetSearch.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<PostAddReview> postAddReview() async {
    final response = await http.post(Uri.parse(_baseUrl + _urlPostReview));

    if (response.statusCode == 200) {
      return PostAddReview.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
