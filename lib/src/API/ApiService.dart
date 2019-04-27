import 'dart:async';
import 'dart:convert';
import 'package:flutter_poc/src/API/Model/Kids.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://devapi.calltechapp.com/api/";
const urlKids = baseUrl + "studentdetail/11312/true";
const urlNotifications = baseUrl + "notification/11312";

const Map<String, String> requestHeader = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiIxMjY4OCIsIlVzZXJUeXBlIjoidXNlciIsIm5iZiI6MTU1NjAzOTczMiwiZXhwIjoxNTU4NjQyNTMxLCJpYXQiOjE1NTYwNTA1MzEsImlzcyI6IkNhbGxUZWNoIn0.0UD_3c3ldBOiBED5UTAj7chLG__QBxjvQ-MN36hYphU'
};
class ApiService {

  static Future<http.Response> getKids()  {
    var url = urlKids;
    return http.get(Uri.encodeFull(url), headers: requestHeader);

  }

  static Future<http.Response> getNotifications()  {
    var url = urlNotifications;
    return http.get(Uri.encodeFull(url), headers: requestHeader);

  }
}