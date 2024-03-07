import 'package:counter_getx/models/Quote.dart';
import 'package:dio/dio.dart';

const index_quotes = {
  "data": [
    {
      "id": 1,
      "desc_ar": "Ms. Abbigail Padberg",
      "desc_en": "Miss Annie Lemke Sr.",
      "source_ar": "Prof. Julie Lehner",
      "source_en": "Dr. Toby Keebler",
      "category_id": 9,
    },
    {
      "id": 2,
      "desc_ar": "Price Hartmann",
      "desc_en": "Dane Harber",
      "source_ar": "Dr. Vella Eichmann III",
      "source_en": "Dr. Jovany Abshire",
      "category_id": 2,
    },
    {
      "id": 3,
      "desc_ar": "Jarrod Mayer",
      "desc_en": "Imelda Bogisich I",
      "source_ar": "Kaylah Doyle",
      "source_en": "Tamara Stoltenberg",
      "category_id": 3,
    },
    {
      "id": 4,
      "desc_ar": "Dr. Alisa Fay II",
      "desc_en": "Queenie Moore",
      "source_ar": "Mathilde Bradtke",
      "source_en": "Cassie Thiel",
      "category_id": 4,
    },
    {
      "id": 5,
      "desc_ar": "Lesley Pollich",
      "desc_en": "Fermin Flatley",
      "source_ar": "Mr. Ephraim Rogahn I",
      "source_en": "Braden Langworth",
      "category_id": 3,
    },
    {
      "id": 6,
      "desc_ar": "Enola Lockman",
      "desc_en": "Therese Shields",
      "source_ar": "Fred Steuber PhD",
      "source_en": "Nathan Pfeffer",
      "category_id": 1,
    },
    {
      "id": 7,
      "desc_ar": "Ola Feest",
      "desc_en": "Skylar Stracke",
      "source_ar": "Prof. Selmer McGlynn",
      "source_en": "Ms. Isobel Lockman IV",
      "category_id": 7,
    },
    {
      "id": 8,
      "desc_ar": "Evert Kihn",
      "desc_en": "Lucy Towne I",
      "source_ar": "Dr. Marty Durgan",
      "source_en": "Alycia Ullrich",
      "category_id": 1,
    },
    {
      "id": 9,
      "desc_ar": "Jarod Nienow",
      "desc_en": "Gilberto Oberbrunner",
      "source_ar": "Mauricio Christiansen",
      "source_en": "Kariane Greenfelder",
      "category_id": 9,
    },
    {
      "id": 10,
      "desc_ar": "Taryn Kertzmann",
      "desc_en": "Rae Greenfelder",
      "source_ar": "Cecil Schneider",
      "source_en": "Daniella Buckridge II",
      "category_id": 7,
    }
  ]
};

class QuoteTestRepository {
  final Dio _dio = Dio();

  Future<List<Quote>> fetchQuotes() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      List<Quote> quotes =
          (response.data as List).map((json) => Quote.fromJson(json)).toList();
      return quotes;
    } catch (e) {
      throw Exception('Failed to fetch posts');
    }
  }
}

