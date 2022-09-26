import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'env.dart';

enum EnumMethod {
  post("POST"),
  get("GET"),
  delete("DELETE"),
  put("PUT"),
  patch("PATCH");

  final String value;

  const EnumMethod(this.value);
}

abstract class BaseApi {
  Future post(
    BuildContext context, {
    required String path,
    required Map<String, dynamic> reqBody,
  }) async {
    return await _fetchData(
      context,
      baseUrl: Env.baseUrl,
      path: path,
      header: Env().header,
      timeOut: Env.timeOut,
      reqBodyMap: reqBody,
      method: EnumMethod.post,
    );
  }

  Future get(
    BuildContext context, {
    required String path,
    required Map<String, dynamic> reqBody,
  }) async {
    return await _fetchData(
      context,
      baseUrl: Env.baseUrl,
      path: path,
      header: Env().header,
      timeOut: Env.timeOut,
      reqBodyMap: reqBody,
      method: EnumMethod.get,
    );
  }

  Future delete(
    BuildContext context, {
    required String path,
    required Map<String, dynamic> reqBody,
  }) async {
    return await _fetchData(
      context,
      baseUrl: Env.baseUrl,
      path: path,
      header: Env().header,
      timeOut: Env.timeOut,
      reqBodyMap: reqBody,
      method: EnumMethod.delete,
    );
  }

  Future put(
    BuildContext context, {
    required String path,
    required Map<String, dynamic> reqBody,
  }) async {
    return await _fetchData(
      context,
      baseUrl: Env.baseUrl,
      path: path,
      header: Env().header,
      timeOut: Env.timeOut,
      reqBodyMap: reqBody,
      method: EnumMethod.put,
    );
  }

  Future patch(
    BuildContext context, {
    required String path,
    required Map<String, dynamic> reqBody,
  }) async {
    return await _fetchData(
      context,
      baseUrl: Env.baseUrl,
      path: path,
      header: Env().header,
      timeOut: Env.timeOut,
      reqBodyMap: reqBody,
      method: EnumMethod.patch,
    );
  }

  Future _fetchData(
    BuildContext context, {
    required String baseUrl,
    required String path,
    required Map<String, String> header,
    required int timeOut,
    required Map<String, dynamic> reqBodyMap,
    required EnumMethod method,
  }) async {
    bool error = false;
    http.Response response;
    var strLog = "";
    var reqBody = json.encode(reqBodyMap);
    Uri url = Uri.parse(baseUrl + path);
    strLog += "[${method.value}] $url";
    strLog += "\t\n[Request Headers] : \n\t$header";
    strLog += "\t\n[Request] : \n\t$reqBody";
    var start = DateTime.now().millisecondsSinceEpoch;
    if (kDebugMode) {
      log("\n:: PROCESSING ::\n$strLog");
    }
    try {
      if (method == EnumMethod.post) {
        response = await http
            .post(
          url,
          headers: header,
          body: reqBody,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            error = true;
            showRequestTimeOut(context, timeOut);
            strLog += ("\n:: PROCESS TIME OUT! ::");
            return Future.error(() {});
          },
        );
      } else if (method == EnumMethod.delete) {
        response = await http
            .delete(
          url,
          headers: header,
          body: reqBody,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            error = true;
            showRequestTimeOut(context, timeOut);
            strLog += ("\n:: PROCESS TIME OUT! ::");
            return Future.error(() {});
          },
        );
      } else if (method == EnumMethod.put) {
        response = await http
            .put(
          url,
          headers: header,
          body: reqBody,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            error = true;
            showRequestTimeOut(context, timeOut);
            strLog += ("\n:: PROCESS TIME OUT! ::");
            return Future.error(() {});
          },
        );
      } else if (method == EnumMethod.patch) {
        response = await http
            .patch(
          url,
          headers: header,
          body: reqBody,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            error = true;
            showRequestTimeOut(context, timeOut);
            strLog += ("\n:: PROCESS TIME OUT! ::");
            return Future.error(() {});
          },
        );
      } else {
        response = await http
            .get(
          url,
          headers: header,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            error = true;
            showRequestTimeOut(context, timeOut);
            strLog += ("\n:: PROCESS TIME OUT! ::");
            return Future.error(() {});
          },
        );
      }
      // ignore: unnecessary_null_comparison
      if (response != null) {
        strLog += ("\n:: FINALLY ::");
        strLog += "\t\n[Response Code] : \n\t${response.statusCode}";
        strLog += "\t\n[Response Raw] : \n\t${response.body.toString()}";
        if (response.statusCode == 200) {
          // ignore: unnecessary_null_comparison
          if (response.body != null) {
            strLog +=
                "\t\n[Response Headers] : \n\t${response.headers.toString()}";
            var respDecode = json.decode(response.body);
            strLog += "\t\n[Response Body] : \n\t${response.body.toString()}";
            return respDecode;
          } else {
            error = true;
            // ignore: use_build_context_synchronously
            showErrorDialog(
              context,
              statusCode: response.statusCode,
              json: json.decode(response.body),
            );
          }
        }
        return null;
      } else {
        error = true;
        // ignore: use_build_context_synchronously
        showServerNoResponse(context);
        strLog += "\nERROR : ${response.toString()}";
      }
    } on FormatException catch (_) {
      showFormatException(context);
    } on http.ClientException catch (_) {
      showClientException(context);
    } on HttpException catch (_) {
      showHttpException(context);
    } finally {
      if (error) {
        printError(context);
      }
      var end = DateTime.now().millisecondsSinceEpoch;
      strLog += "\n--> ${end - start}ms";
      if (kDebugMode) {
        log(strLog);
      }
    }
  }

  Future showErrorDialog(
    BuildContext context, {
    int? statusCode,
    Map<String, dynamic>? json,
  });
  Future showRequestTimeOut(BuildContext context, int timeOut);
  Future showServerNoResponse(BuildContext context);
  Future showHttpException(BuildContext context);
  Future showClientException(BuildContext context);
  Future showFormatException(BuildContext context);
  Future printError(BuildContext context);
}
