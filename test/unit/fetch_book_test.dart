import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/fetch_books.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fetch_book_test.mocks.dart';

@GenerateMocks([http.Client])
main() {
  late http.Client mockClient;

  setUp(() {
    mockClient = MockClient();
  });

  tearDown(() {
    mockClient.close();
  });

  group("Fetch Book API", () {
    test("Success API", () async {
      // Arrange

      when(mockClient.get(Uri.parse(
              "https://raw.githubusercontent.com/Richa0305/mock-json/main/book.json")))
          .thenAnswer((realInvocation) async {
        return http.Response(
            '[{"id": 4,"name": "The Art of Happiness","auther": "Dalai Lama and Howard C. Cutler","decription": "According to the Dalai Lama, the very motif of our life is towards happiness.Still, reaching that final destination can be easier said than done. Fortunately this philosophically rich,compassionately written handbook","amazon":"https://www.amazon.com/dp/B002UK6NO0?tag=reedwebs-20&linkCode=ogi&th=1&psc=1"}]',
            200,
            headers: {"content-type": "application/json"});
      });

      // Act and  Assert
      // Real fetchBooks  Will use mock client to call API
      expect(await fetchBooks(mockClient), isA<List<BooksListModel>>());
    });

    test("Error in API", () async {
      // Arrange

      http.Client mockClient = MockClient();

      when(mockClient.get(Uri.parse(
              "https://raw.githubusercontent.com/Richa0305/mock-json/main/book.json")))
          .thenAnswer((realInvocation) async {
        return http.Response("Session Expired", 401);
      });

      // Act and  Assert
      // Real fetchBooks  Will use mock client to call API
      expect(fetchBooks(mockClient), throwsException);
    });
  });
}
