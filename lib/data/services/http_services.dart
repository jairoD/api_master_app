import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:api_master_app/data/services/shared_preferences_service.dart';
import 'package:api_master_app/models/request_model.dart';
import 'package:api_master_app/models/response_model.dart';
import 'package:api_master_app/setup.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class MyHttpClient {
  final client;
  final _baseUrl = dotenv.env['API_URL'];
  final _sharedService = getIt<SharedPreferencesService>();
  MyHttpClient(this.client);
  //GET POTST PUT DELETE

  String sound() => "Meow";
  getMethod(HTTPMethods method) {
    switch (method) {
      case HTTPMethods.GET:
        return client.get;
      case HTTPMethods.POST:
        return client.post;
      case HTTPMethods.PUT:
        return client.put;
      case HTTPMethods.DELETE:
        return client.delete;
      default:
    }
  }

  Future<ResponseModel?> get(RequestModel req) {
    return sendRequest(req.copyWith(method: HTTPMethods.GET));
  }

  Future<ResponseModel?> post(RequestModel req) {
    return sendRequest(req.copyWith(method: HTTPMethods.POST));
  }

  Future<ResponseModel?> put(RequestModel req) {
    return sendRequest(req.copyWith(method: HTTPMethods.PUT));
  }

  Future<ResponseModel?> del(RequestModel req) {
    return sendRequest(req.copyWith(method: HTTPMethods.DELETE));
  }

  Future<ResponseModel> sendRequest(RequestModel req) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      if (req.headers != null) headers.addAll(req.headers!);
      String? token =
          await _sharedService.getData(StorageTypes.STRING, 'token');
      if (token != null) {
        headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $token'});
      }
      Function method = getMethod(req.method!);
      Response response;
      if (req.body != null) {
        response = await method(
            Uri.http(_baseUrl!, req.path ?? '', req.queryParams),
            headers: headers,
            body: jsonEncode(req.body));
      } else {
        response = await method(
            Uri.http(_baseUrl!, req.path ?? '', req.queryParams),
            headers: headers);
      }
      return ResponseModel(
          data: jsonDecode(response.body),
          message: response.reasonPhrase,
          statusCode: response.statusCode,
          succes: (response.statusCode >= 200 && response.statusCode <= 299));
    } on HttpException catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 404, succes: false);
    } on ClientException catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 404, succes: false);
    } on SocketException catch (e) {
      return ResponseModel(
          data: null,
          message: e.message,
          statusCode: e.osError?.errorCode ?? 404,
          succes: false);
    } on TimeoutException catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 404, succes: false);
    } on Exception catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 404, succes: false);
    } catch (e) {
      return ResponseModel(
          data: null, message: e.toString(), statusCode: 408, succes: false);
    }
  }
}
