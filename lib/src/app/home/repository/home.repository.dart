import 'package:anime_search/src/app/home/models/anime.response.model.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

abstract class HomeRepository {
  Future<AnimeResponseModel> searchAnime(XFile file);
}

class HomeImpl extends HomeRepository {
  @override
  Future<AnimeResponseModel> searchAnime(XFile file) async {
    String apiUrl = "https://api.trace.moe/search";
    Dio _dio = Dio();

    var bytes = await file.readAsBytes();

    MultipartFile uplaodingfile = MultipartFile.fromBytes(bytes, filename: file.name);

    FormData formData = FormData();

    formData.files.add(MapEntry("image", uplaodingfile));

    Response response = await _dio.post(apiUrl, options: Options(method: "POST"), data: formData);

    AnimeResponseModel model = AnimeResponseModel.fromJson(response.data);

    return model;
  }
}
