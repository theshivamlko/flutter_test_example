import 'dart:convert';
import 'package:http/http.dart' as http;

String fetchBooksURL =
    'https://raw.githubusercontent.com/Richa0305/mock-json/main/book.json';

Future<List<BooksListModel>> fetchBooks(http.Client client) async {
  try {
    final response = await client.get(Uri.parse(fetchBooksURL)); // Call API

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return List<BooksListModel>.from(
          json.decode(response.body).map((x) => BooksListModel.fromJson(x)));
    } else {
      print("11111111");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  } catch (error) {
    print("222222222");
    rethrow;
    Exception('Failed to load album');
  }
}

class BooksListModel {
  BooksListModel({
    required this.name,
    required this.auther,
    required this.decription,
    required this.amazon,
  });

  String name;
  String auther;
  String decription;
  String amazon;

  factory BooksListModel.fromJson(Map<String, dynamic> json) => BooksListModel(
        name: json["name"],
        auther: json["auther"],
        decription: json["decription"],
        amazon: json["amazon"],
      );
}
