import 'dart:convert';

import 'package:http/http.dart' as http;

class GenerateImageUrl {
  bool success;
  String message;

  bool isGenerated;

  String uploadUrl;
  String downloadUrl;

  Future<void> call(String fileType) async {
    try {
      Map body = {"fileType": fileType};

      var response = await http.post(
        //For IOS
        'http://localhost:5000/generatePresignedUrl',
        //For Android
        //    'http://10.0.2.2:5000/generatePresignedUrl',
        //'https://0mx3cqjlkh.execute-api.ap-northeast-1.amazonaws.com/default/getPresignedURL',
        body: body,
      );

      var result = jsonDecode(response.body);

      print(result);

      if (result['success'] != null) {
        success = result['success'];
        message = result['message'];

        if (response.statusCode == 200) {
          isGenerated = true;
          uploadUrl = result["uploadUrl"];
          downloadUrl = result["downloadUrl"];
        }
      }
    } catch (e) {
      throw ('Error getting url');
    }
  }
}
