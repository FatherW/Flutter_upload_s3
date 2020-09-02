import 'dart:io';

import 'package:http/http.dart' as http;

class UploadFile {
  bool success;
  String message;
  bool isUploaded;

  Future<void> call(String url, File image) async {
    try {
      // var url =
      //     "https://guoquan-upload.s3.ap-northeast-1.amazonaws.com/abcde.jpg?Content-Type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAI6FDT6Z3WRGPB7QQ%2F20200902%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20200902T060249Z&X-Amz-Expires=3600&X-Amz-Signature=2ee1a6e2cfa4ddc7e9fbc81b3c8bc4e18c7a5cd3afd0518281148048fa8fc43c&X-Amz-SignedHeaders=host%3Bx-amz-acl&x-amz-acl=public-read";
      var response = await http.put(url, body: image.readAsBytesSync());
      print(response.statusCode);
//此处local的返回CODE是200
//LAMBDA的返回值是403，原因未知
      if (response.statusCode == 200) {
        isUploaded = true;
      } else {
        print('upload_file 出错, reponse status code 是');
        print(response.statusCode);
      }
    } catch (e) {
      throw ('Error uploading photo');
    }
  }
}
