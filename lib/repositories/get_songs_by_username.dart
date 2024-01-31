import 'dart:convert';

import 'package:http/http.dart';
import '../api/url.dart';
import '../methods/get_response.dart';
import '../models/song_model.dart';

class GetSongsByUsername {
  Future<List<SongModel>> getSongsByUsername(String username) async {
    final Map<String, String> query = {
      "page": 0.toString(),
      "limit": 4.toString()
    };

    Response res = await getResponse(
        Uri.https(baseUrl, '$basePath/songs/$username', query));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      final songs = (body['results'] as List)
          .map<SongModel>((song) => SongModel.fromJson(song))
          .toList();
      print(body);
      
      return songs;
    } else {
      throw Exception("failed fetch songs by username ");
    }
  }
}
