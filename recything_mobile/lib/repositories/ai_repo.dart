import 'package:dio/dio.dart';
import 'package:recything_mobile/constants/constans.dart';

Dio dio = Dio();
Future<String> getAi(String text) async {
  final res = await dio.post(
    "https://generativelanguage.googleapis.com/v1beta3/models/text-bison-001:generateText?key=$apiKey",
    data: {
      "prompt": {"text": text},
      "temperature": 1.0,
      "candidateCount": 3
    },
  );
  print(res.data);
  return res.data["candidates"][0]["output"].toString();
}
