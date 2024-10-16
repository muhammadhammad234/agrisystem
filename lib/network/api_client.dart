import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  
  Future<http.Response> getWithoutBearer({required String url}) async {
    final Uri uri = Uri.parse(url);

    try {
      final http.Response response = await http.get(uri);
      _handleResponse(response);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }
  Future<http.Response> postWithoutBearer({required String url, required dynamic body}) async {
    final Uri uri = Uri.parse(url);

    try {
      final http.Response response = await http.post(
       
        uri,
        body: body,
        //  headers: {
        //   "Accept": "application/json",
        //   "content-type": "application/json"
        // },
      );
      print(body);
      _handleResponse(response);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }
  Future<http.Response> putWithoutBearer({required String url, required dynamic body}) async {
    final Uri uri = Uri.parse(url);

    try {
      final http.Response response = await http.put(
       
        uri,
        body: body,
         headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
      );
      _handleResponse(response);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }
  
  
  Future<http.Response> deleteWithoutBearer({required String url}) async {
    final Uri uri = Uri.parse(url);

    try {
      final http.Response response = await http.delete(
       
        uri,
         headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
      );
      _handleResponse(response);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode == 429) {
      debugPrint('Too Many Requests: $response');
      throw 'Too Many Requests. Please try again later.';
    }else if(response.statusCode==302){
      debugPrint("redirected");
      throw "Please log in and try again.";
    } 
    
    else if (response.statusCode >= 500) {
      debugPrint("Response.body: ${response.body}");
      debugPrint('Server error: ${response.statusCode}');
      throw 'Oops! Something went wrong.';
    }
  }

  void _handleError(dynamic error) {
    debugPrint('Error: $error');
  if (error is SocketException) {
    debugPrint('No internet connection: $error');
    throw 'No internet connection. Please check your network and try again.';
  } else if (error is HttpException) {
    debugPrint('Failed to connect to the server: $error');
    throw 'Failed to connect to the server. Please try again later.';
  } else if (error is FormatException) {
    debugPrint('Invalid response format: $error');
    throw 'Invalid response format. Please log in and try again.';
  } else if (error is PlatformException) {
    debugPrint('Platform error: $error');
    throw 'Something went wrong. Please try again.';
  } else if (error is TimeoutException) {
    debugPrint('Platform error: $error');
    throw 'Oops! Please check your network and try again.';
  } else if (error is http.ClientException) {
    // Handles ClientException, including those with SocketException like connection timeouts.
    if (error.message.contains('SocketException')) {
      debugPrint('Connection timeout: $error');
      throw 'Oops! Please check your network and try again.';
    }
    debugPrint('HTTP Client Error: $error');
    throw 'Failed to send request. Please try again later.';
  } else {
    debugPrint('Unexpected error: $error');
    throw 'Something went wrong. Please try again.';
  }
}
}
