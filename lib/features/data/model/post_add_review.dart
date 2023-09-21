// To parse this JSON data, do
//
//     final PostAddReview = PostAddReviewFromJson(jsonString);

import 'dart:convert';

PostAddReview postAddReviewFromJson(String str) =>
    PostAddReview.fromJson(json.decode(str));

String postAddReviewToJson(PostAddReview data) => json.encode(data.toJson());

class PostAddReview {
  bool error;
  String message;
  List<CustomerReview> customerReviews;

  PostAddReview({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  factory PostAddReview.fromJson(Map<String, dynamic> json) => PostAddReview(
        error: json["error"],
        message: json["message"],
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "customerReviews":
            List<dynamic>.from(customerReviews.map((x) => x.toJson())),
      };
}

class CustomerReview {
  String name;
  String review;
  String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "date": date,
      };
}
