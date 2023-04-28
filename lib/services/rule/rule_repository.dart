import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:result_dart/result_dart.dart';
import 'package:search_and_stay/core/endpoints.dart';
import 'package:search_and_stay/models/rule.dart';
import 'package:http/http.dart' as http;

abstract class RuleRepository {
  getARule();
  getListRule();
  editRule();
  deleteRule();
  insertRule();
}

class RuleService implements RuleRepository {
  @override
  deleteRule() {
    // TODO: implement deleteRule
    throw UnimplementedError();
  }

  @override
  editRule() {
    // TODO: implement editRule
    throw UnimplementedError();
  }

  @override
  getARule() {
    // TODO: implement getARule
    throw UnimplementedError();
  }

  @override
  Future<Result<List<HomeRule>, String>> getListRule() async {
    Map<String, String> header = {
      "Authorization": "Bearer ${EndPoints.BeararToken}",
      "Accept-Language": "pt"
    };

    Uri uri = Uri.https(EndPoints.baseUrl, EndPoints.homeRule);
    try {
      http.Response response = await http.get(uri, headers: header);

      var responseMapDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<HomeRule> listHomeRules = [];
        var homeRules = responseMapDecoded;
        for (var element in homeRules) {
          listHomeRules.add(HomeRule.fromMap(element));
        }
        //succes way here :)
        Success(listHomeRules);
      } else if (response.statusCode == 409) {
        //Barear Token error, review that
        return const Failure("Ocorreu um erro de falta de autenticação");
      }
    } on HttpException {
      return const Failure("Erro de requisição da API ocorrida");
    } on TimeoutException {
      return const Failure("Foi excedido o tempo  de requisição da API");
    } catch (e) {
      print("Error get by try cat: $e");
      return const Failure("Erro inesperado ocorrido, contate o administrador");
    }

    throw UnimplementedError();
  }

  @override
  insertRule() {
    // TODO: implement insertRule
    throw UnimplementedError();
  }
}

/*
 Future<Result<List<MobilityService>, String>> getListServices() async {
    String token = await NetworkUtils.getAccessToken();
    Map<String, String> header = {
      "Authorization": "Bearer $token",
      "Accept-Language": "pt"
    };

    Uri uri = Uri.https(EndPoints.urlDomain, EndPoints.listServices);

    http.Response response = await http.get(uri, headers: header);

    //services Unauthorized
    if (response.statusCode == 401) {
      if (CredentialLoggedChecker.credentialLoggedChecker.state
          is! CredentialLoggedCheckerRedirected) {
        CredentialLoggedChecker.credentialLoggedChecker
            .add(CredentialLoggedCheckerRedirectEvent());
      }
      return const Failure("Precisa realizar Login");
    }

    if (response.statusCode == 200) {
      var mapDecoded = jsonDecode(response.body);

      try {
        List<MobilityService> mobilityServices = [];
        var services = mapDecoded;
        for (var service in services) {
          mobilityServices.add(MobilityService.fromMap(service));
        }

        if (mobilityServices.isEmpty) {
          return const Failure("Nenhum registo localizado.");
        }
        return Success(mobilityServices);
      } catch (e) {
        //it will get to error if the service cant be put in mobilityServices´s list
        //then, it will message that has no data
        String erroMessage = mapDecoded["message"].toString();
        return Failure(erroMessage);
      }
    }

    return const Failure("Erro nao esperado");
  }
*/