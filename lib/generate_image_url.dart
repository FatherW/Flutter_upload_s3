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
        //  'http://localhost:5000/generatePresignedUrl',
        //For Android
        //    'http://10.0.2.2:5000/generatePresignedUrl',
        //'https://0mx3cqjlkh.execute-api.ap-northeast-1.amazonaws.com/default/getPresignedURL',
        //  "https://guoquan-upload.s3.ap-northeast-1.amazonaws.com/abcde.jpg?Content-Type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI6FDT6Z3WRGPB7QQ%2F20200902%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20200902T060249Z&X-Amz-Expires=3600&X-Amz-Signature=2ee1a6e2cfa4ddc7e9fbc81b3c8bc4e18c7a5cd3afd0518281148048fa8fc43c&X-Amz-SignedHeaders=host%3Bx-amz-acl&x-amz-acl=public-read",
        "https://0mx3cqjlkh.execute-api.ap-northeast-1.amazonaws.com/default/getPresignedURL",
        body: body,
      );

      var result = jsonDecode(response.body);

      print(result);

      if (result['success'] != null) {
        success = result['success'];
        message = result['message'];
        print(response.statusCode);
//response.statusCode LOCAL的值是201
//response.statusCode LOCAL的值是200
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
