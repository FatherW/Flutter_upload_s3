import 'dart:io';

import 'package:http/http.dart' as http;

class UploadFile {
  bool success;
  String message;
  bool isUploaded;

  Future<void> call(String url, File image) async {
    try {
      var response = await http.put(url, body: image.readAsString());
      print(image.readAsString());
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
