import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ThirdPartyService {
  Future<String> uploadImageOnCloudinary(File image) async {
    try {
      final url = Uri.parse('https://api.cloudinary.com/v1_1/dhc0siki5/upload');

      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = 'uzbfy5aa'
        ..files.add(
          await http.MultipartFile.fromPath(
            'file',
            image.path,
          ),
        );

      final response = await request.send();

      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      final imgUrl = jsonMap['url'];

      return imgUrl;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
