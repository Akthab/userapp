// import 'package:dio/dio.dart';
// import 'package:userapp/models/fruits_response.dart';

// class FruitsApiServices {
//   String _url = "https://fruityvice.com//api/fruit/all";
//   late Dio _dio;

//   FruitsApiServices() {
//     _dio = Dio();
//   }

//   Future<List<Nutritions>> fetchFruitsDetails() async {
//     try {
//       Response response = await _dio.get(_url);
//       FruitResponse fruitResponse = FruitResponse.fromJson(response.data);
//       return fruitResponse.nutritions;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         print(e.response!.data);
//       } else {}
//     }
//     throw '';
//   }
// }
