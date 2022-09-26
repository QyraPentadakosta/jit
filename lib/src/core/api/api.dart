import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../component/snackbar/i_snackbar.dart';
import 'base_api.dart';

class Api extends BaseApi {
  @override
  Future showClientException(BuildContext context) async {
    iShowSnackBar(context, title: "Error: Client Exception");
  }

  @override
  Future showErrorDialog(
    BuildContext context, {
    int? statusCode,
    Map<String, dynamic>? json,
  }) async {
    iShowSnackBar(context, title: "$statusCode: $json");
  }

  @override
  Future showFormatException(BuildContext context) async {
    iShowSnackBar(context, title: "Error: Format Exception");
  }

  @override
  Future showHttpException(BuildContext context) async {
    iShowSnackBar(context, title: "Error: Http Exception");
  }

  @override
  Future showRequestTimeOut(BuildContext context, int timeOut) async {
    iShowSnackBar(context, title: "Time Out");
  }

  @override
  Future showServerNoResponse(BuildContext context) async {
    iShowSnackBar(context, title: "Server Not Response");
  }

  @override
  Future printError(BuildContext context) async {
    if (kDebugMode) {
      log("ERROR");
    }
  }
}
