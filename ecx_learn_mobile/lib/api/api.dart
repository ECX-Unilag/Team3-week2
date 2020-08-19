import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  getQuizQuestions(String difficulty, int numberOfQuestions) async {
    difficulty = difficulty.toLowerCase();
    String baseUrl =
        "https://opentdb.com/api.php?amount=$numberOfQuestions&difficulty=$difficulty&type=multiple";
    http.Response getQuestions = await http.get(baseUrl);
    var response = jsonDecode(getQuestions.body);
    if (response["response_code"] == 0) {
      return response["results"];
    } else {
      return "error";
    }
  }
}
