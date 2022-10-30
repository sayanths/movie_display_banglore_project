import 'package:dio/dio.dart';
import 'package:movie_project_banglore/app/home_page/model/home_model.dart';
import 'package:movie_project_banglore/app/home_page/model/home_model_post.dart';

class GetApi {
  Future<List<Result>?> getmoviesDetailes(PostModel postData) async {
    try {
      final response = await Dio()
          .post("https://hoblist.com/api/movieList", data: postData.toJson());
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        final data = movieModelFromJson(response.data["result"]);
        return data;
      }
      return null;
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        return null;
      }
    }
    return null;
  }
}
