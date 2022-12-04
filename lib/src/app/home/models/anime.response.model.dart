class AnimeResponseModel {
    AnimeResponseModel({
        required this.frameCount,
        required this.error,
        required this.result,
    });

    int frameCount;
    String error;
    List<Result> result;

    factory AnimeResponseModel.fromJson(Map<String, dynamic> json) => AnimeResponseModel(
        frameCount: json["frameCount"],
        error: json["error"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "frameCount": frameCount,
        "error": error,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.anilist,
        required this.filename,
        required this.episode,
        required this.from,
        required this.to,
        required this.similarity,
        required this.video,
        required this.image,
    });

    int anilist;
    String filename;
    double? episode;
    double? from;
    double? to;
    double similarity;
    String video;
    String image;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        anilist: json["anilist"],
        filename: json["filename"],
        episode:  json["episode"] == null? null : json["episode"].toDouble(),
        from: json["from"] == null? null: json["from"].toDouble(),
        to: json["to"] == null? null :json["to"].toDouble(),
        similarity: json["similarity"].toDouble(),
        video: json["video"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "anilist": anilist,
        "filename": filename,
        "episode": episode,
        "from": from,
        "to": to,
        "similarity": similarity,
        "video": video,
        "image": image,
    };
}
