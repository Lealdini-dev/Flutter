import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:neo_bank_oficial/models/contact.dart';
import 'package:neo_bank_oficial/models/transaction.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request \n'
        'Url: ${data.baseUrl} \n'
        'Headers: ${data.headers} \n'
        'Body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Request \n'
        'Status: ${data.statusCode} \n'
        'Headers: ${data.headers} \n'
        'Body: ${data.body}');
    return data;
  }
}

final Client client =
    HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

const String baseUrl = 'http://192.168.15.4:8080/transactions';

Future<List<Transaction>> findAll() async {
  final Response response = await client.get(baseUrl);
  final List<dynamic> decodeJson = jsonDecode(response.body);
  final List<Transaction> transactions = List();
  for (Map<String, dynamic> transactionJson in decodeJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
        transactionJson['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ));
    transactions.add(transaction);
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.name,
      'accountNumber': transaction.contact.accountNumber,
    }
  };
  final String transactionJson = jsonEncode(transactionMap);
  final Response response = await client.post(baseUrl,
      headers: {'Content-type': 'application/json', 'password': '1000'},
      body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
  return Transaction(
      json['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ));
}
