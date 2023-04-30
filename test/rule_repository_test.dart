import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';
import 'package:search_and_stay/core/endpoints.dart';
import 'package:search_and_stay/models/rule.dart';
import 'package:http/http.dart' as http;

void main() {
  Future<Result<List<HomeRule>, String>> getListRule() async {
    Map<String, String> header = {
      "Authorization": "Bearer ${EndPoints.beararToken}",
      "Accept-Language": "pt"
    };

    Uri uri = Uri.https(EndPoints.baseUrl, EndPoints.homeRule);
    try {
      http.Response response = await http.get(uri, headers: header);

      var responseMapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<HomeRule> listHomeRules = [];
        var homeRules = responseMapDecoded["data"]["entities"];
        for (var element in homeRules) {
          listHomeRules.add(HomeRule.fromMap(element));
        }
        //succes way here :)
        return Success(listHomeRules);
      } else if (response.statusCode == 409) {
        //Barear Token error, review that
        return const Failure("Ocorreu um erro de falha de autenticação");
      }
    } on HttpException {
      return const Failure("Erro de requisição da API ocorrida");
    } on TimeoutException {
      return const Failure("Foi excedido o tempo  de requisição da API");
    } catch (e) {
      print("Error get by try cat: $e");
    }
    return const Failure("Erro inesperado ocorrido, contate o administrador");
  }

  group('test rule repositoryt test', () {
    test("test rule", () async {
      var responseTest = await getListRule();
      print(responseTest);
      expect(responseTest, isA<Success>());
    });
  });
}
