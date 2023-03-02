import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../services/connectivity_service.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';
import '../utils/global.dart';

class RestConstants {
  RestConstants._privateConstructor();

  static final RestConstants instance = RestConstants._privateConstructor();

  //     ======================= Tokens & Others =======================     //
  String razorPayKey = '';

  //     ======================= Youtube baseurl & API EndPoints =======================     //
  final String apiBaseUrl = 'http://bhajanbank.kalakunjmandir.in:8080/api/v1';

  //     ======================= API EndPoints =======================     //
  final String splash = 'splash_screen';
  final String login = 'login';
  final String otpVerify = 'otp_verify';
  final String resendOtp = 'resend_otp';
  final String countryList = 'country_list';
  final String stateList = 'state_list';
  final String cityList = 'city_list';
  final String memberAddUpdate = 'member_add_update_profile';
  final String memberList = 'member_list';
  final String deleteMember = 'member_delete';
  final String selectNiyam = 'user_selected_niyam_history';
  final String category = 'category_list';
  final String subCategory = 'subcategory_data';
  final String subCategoryData = 'subcategory_data';
  final String deleteNiyamHistory = 'delete_niyam_history';
  final String saveNiyamHistory = 'save_niyam_history';
  final String announcement = 'announcement';
  final String informationList = 'information_list';
  final String userChartReport = 'user_chart_report';
  final String saveDailyNiyamHistory = 'save_daily_niyam_history';
  final String mukhapathList = 'mukhapath_list';
  final String saveGharMandir = 'save_ghar_mandir';
  final String photoGallery = 'photo_gallery';
  final String lessonList = 'lesson_list';
  final String dailyDarshanList = 'daily_darshan_list';
  final String logout = 'logout';
}

class RestServices {
  RestServices._privateConstructor();

  static final RestServices instance = RestServices._privateConstructor();

  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<Map<String, String>> getHeaders() async {
    String? token = await getPrefStringValue(accessTokenKey);
    return {
      'deviceId': await getPrefStringValue(deviceIdKey) ?? 'deviceId',
      'macAddress': await getPrefStringValue(macAddressKey) ?? 'macAddress',
      'deviceName': await getPrefStringValue(deviceNameKey) ?? 'deviceName',
      'imeiNo': await getPrefStringValue(imeiNumberKey) ?? 'imeiNo',
      'accessStatus': Global.getAccessStatus(),
      'language': await getPrefStringValue(languageKey) ?? 'guj',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  void showRequestAndResponseLogs(http.Response? response, Map<String, Object> requestData) {
    logs('•••••••••• Network logs ••••••••••');
    logs('Request url --> ${response!.request!.url}');
    log('Request headers --> $requestData');
    logs('Status code --> ${response.statusCode}');
    logs('Response headers --> ${response.headers}');
    logs('Response body --> ${response.body}');
    logs('••••••••••••••••••••••••••••••••••');
  }

  Future<String?>? getRestCall({required String? endpoint, String? addOns}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.apiBaseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.apiBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      Map<String, String> headers = await getHeaders();
      Response response = await http.get(requestedUri!, headers: headers);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
        case 400:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.containsKey('status') && responseMap['status'] == 1) {
            responseData = response.body;
          } else {
            errorToast('${responseMap['msg']}');
            responseData = null;
          }
          break;
        case 404:
        case 500:
        case 502:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          manageExpiredToken(response.body);
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in getRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? postRestCall(
      {required String? endpoint,
      required Map<String, dynamic>? body,
      String? addOns,
      String? stringBody,
      bool isShowMessage = true}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }

    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.apiBaseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.apiBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      logs('Body map --> $body');
      Map<String, String> headers = await getHeaders();

      Response response =
          await http.post(requestedUri!, body: stringBody ?? jsonEncode(body), headers: headers);
      showRequestAndResponseLogs(response, headers);
      switch (response.statusCode) {
        case 200:
        case 500:
        case 201:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.containsKey('status') && responseMap['status'] == 1) {
            responseData = response.body;
          } else {
            if (!isShowMessage) return responseData;
            errorToast('${responseMap['msg']}');
            responseData = null;
          }
          break;
        case 502:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          manageExpiredToken(response.body);
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in postRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? multiPartRestCall({
    required String? endpoint,
    required Map<String, String>? body,
    required String keyName,
    required String fileName,
    String? keyName1,
    String? fileName1,
  }) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = '${RestConstants.instance.apiBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      MultipartRequest request = http.MultipartRequest('POST', requestedUri!);
      Map<String, String> header = await getHeaders();
      header.remove('Content-Type');
      header['Content-Type'] = 'multipart/form-data';
      // request.headers.addAll({'Content-Type':'multipart/form-data'});
      request.headers.addAll(header);
      if (body!.isNotEmpty) {
        request.fields.addAll(body);
      }
      if(keyName.isNotEmpty && fileName.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
          keyName,
          fileName,
          // contentType: MediaType.parse('image/jpeg'),
        ));
      }
      if (keyName1 != null && fileName1 != null) {
        request.files.add(await http.MultipartFile.fromPath(
          keyName1,
          fileName1,
          // contentType: MediaType.parse('image/jpeg'),
        ));
      }
      StreamedResponse responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);
      logs("response $response");

      showRequestAndResponseLogs(response, request.headers);
      logs("request.headers ${request.headers}");

      switch (response.statusCode) {
        case 200:
        case 201:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.containsKey('status') && responseMap['status'] == 1) {
            responseData = response.body;
          } else {
            errorToast('${responseMap['msg']}');
            responseData = null;
          }
          break;
        case 500:
        case 502:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          manageExpiredToken(response.body);
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in multiPartRestCall --> ${e.message}');
    }
    return responseData;
  }

  void manageExpiredToken(String body) {
    Map<String, dynamic> responseMap = jsonDecode(body);
    if (responseMap['message'].toString().toLowerCase().contains('token')) {}
  }
}
