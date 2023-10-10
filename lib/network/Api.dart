import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:duckgo/network/enviroment.dart';
// import 'package:get/get.dart';


final String baseUrl = Environment().config.baseUrl;
final String apiUrl = Environment().config.apiUrl;

class Api {

  Future<dynamic> get(String url, {fullUrl}) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
        fullUrl ?? '$apiUrl$url',
      );
      if (response.data != null) {
        // print(response.data);
        return response;
      } else {
        print("error icon");
        errorIcon(response);
        errorIcon(response.data);
        return response;
      }
    } on SocketException catch (e) {
      return errorIcon(e.message.toString());
    } on DioException catch (e) {
      print("error dio");
      print(e.response!.data);
      return errorIcon(e.response!.data['error']);
    }
  }

  Future<dynamic> post(formData, url,
      {fullUrl, multiPart = false}) async {
    Dio dio = Dio();
    try {
      var response = await dio.post(
        fullUrl ?? '$apiUrl$url',
        data: formData,
        options: Options(
                headers: {
                  Headers.acceptHeader: "application/json",
                },
              ),
      );
      if (response.data != null) {
        return response;
      } else {
        errorIcon(response.data['error']);
        return response;
      }
    } on SocketException catch (e) {
      return errorIcon(e.message.toString());
    } on DioException catch (e) {
      print(e.response!);
      print(e);
      print(e.response!.data);
      return errorIcon(e.response!);
    }
  }

  dynamic _returnResponse(Response response) {
    if (response.statusCode! < 500) {
      // BotToast.showText(text: response.body);
    } else {
      BotToast.showText(text: "Error communicating with the server");
    }
  }

  errorIcon(message) async {
    Timer(const Duration(seconds: 3), () {});
    if (message.runtimeType == String) {
      BotToast.showText(text: message);
    } else {
      BotToast.showText(
          duration: const Duration(seconds: 3), text: message['error']);
    }
  }
}