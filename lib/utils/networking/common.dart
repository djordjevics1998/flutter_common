import 'package:flutter/material.dart';

const httpStatusCodeOk = 200,
    httpStatusCodeBadRequest = 400,
    httpStatusCodeUnauthorizedRequest = 401,
    httpStatusCodeNotFound = 404,
    httpStatusCodeTimeout = 408,
    httpStatusCodeServerInternalError = 500,
    httpStatusCodeServerTimeout = 504;

typedef ErrorMessage = String Function(BuildContext);