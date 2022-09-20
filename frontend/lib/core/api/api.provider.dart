import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:http/http.dart';
import 'package:sundephish/core/api/request.model.dart';
import 'package:sundephish/core/utils/nonce.helper.dart';

abstract class IApiProvider {
  Future<void> submit(ActionEnum action);
}

class ApiProvider implements IApiProvider {
  static final _currentSessionNonce = generateNonce();

  final String groupID;
  final String baseHostname;
  final Uri _url;

  ApiProvider({
    required this.groupID,
    required this.baseHostname,
  }) : _url = Uri.https(baseHostname, 'submit');

  @override
  Future<void> submit(ActionEnum action) async {
    final request = RequestModel(
      nonce: _currentSessionNonce,
      groupID: groupID,
      action: action,
    );

    await post(
      _url,
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        HttpHeaders.userAgentHeader: window.navigator.userAgent,
      },
      body: json.encode(request.toJson()),
    );
  }
}
