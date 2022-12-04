class AnilistResponseModel {
    AnilistResponseModel({
        required this.media,
    });

    Media media;

    factory AnilistResponseModel.fromJson(Map<String, dynamic> json) => AnilistResponseModel(
        media: Media.fromJson(json["Media"]),
    );

    Map<String, dynamic> toJson() => {
        "Media": media.toJson(),
    };
}

class Media {
    Media({
        required this.status,
        required this.seasonYear,
        required this.genres,
        required this.title,
        required this.bannerImage,
        required this.coverImage,
        required this.episodes,
        required this.streamingEpisodes,
        required this.description,
        required this.characters,
    });

    String status;
    int seasonYear;
    List<String> genres;
    Title title;
    String? bannerImage;
    CoverImage coverImage;
    int episodes;
    List<StreamingEpisode> streamingEpisodes;
    String description;
    Characters characters;

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        status: json["status"],
        seasonYear: json["seasonYear"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        title: Title.fromJson(json["title"]),
        bannerImage: json["bannerImage"] ?? null,
        coverImage: CoverImage.fromJson(json["coverImage"]),
        episodes: json["episodes"],
        streamingEpisodes: List<StreamingEpisode>.from(json["streamingEpisodes"].map((x) => StreamingEpisode.fromJson(x))),
        description: json["description"],
        characters: Characters.fromJson(json["characters"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "seasonYear": seasonYear,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "title": title.toJson(),
        "bannerImage": bannerImage,
        "coverImage": coverImage.toJson(),
        "episodes": episodes,
        "streamingEpisodes": List<dynamic>.from(streamingEpisodes.map((x) => x.toJson())),
        "description": description,
        "characters": characters.toJson(),
    };
}

class Characters {
    Characters({
        required this.nodes,
    });

    List<Node> nodes;

    factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
    };
}

class Node {
    Node({
        required this.name,
        required this.image,
    });

    Name name;
    AImage image;

    factory Node.fromJson(Map<String, dynamic> json) => Node(
        name: Name.fromJson(json["name"]),
        image: AImage.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "image": image.toJson(),
    };
}

class AImage {
    AImage({
        required this.large,
        required this.medium,
    });

    String large;
    String medium;

    factory AImage.fromJson(Map<String, dynamic> json) => AImage(
        large: json["large"],
        medium: json["medium"],
    );

    Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
    };
}

class Name {
    Name({
        required this.first,
        required this.middle,
        required this.last,
        required this.full,
        required this.native,
        required this.userPreferred,
    });

    String? first;
    String? middle;
    String? last;
    String? full;
    String? native;
    String? userPreferred;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json["first"] ?? null,
        middle: json["middle"] ?? null,
        last: json["last"] == null ? null : json["last"],
        full: json["full"] ?? null,
        native: json["native"] ?? null,
        userPreferred: json["userPreferred"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "middle": middle,
        "last": last == null ? null : last,
        "full": full,
        "native": native,
        "userPreferred": userPreferred,
    };
}

class CoverImage {
    CoverImage({
        required this.extraLarge,
        required this.large,
        required this.medium,
        required this.color,
    });

    String extraLarge;
    String large;
    String medium;
    String color;

    factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        extraLarge: json["extraLarge"],
        large: json["large"],
        medium: json["medium"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "extraLarge": extraLarge,
        "large": large,
        "medium": medium,
        "color": color,
    };
}

class StreamingEpisode {
    StreamingEpisode({
        required this.title,
        required this.thumbnail,
        required this.url,
    });

    String title;
    String thumbnail;
    String url;

    factory StreamingEpisode.fromJson(Map<String, dynamic> json) => StreamingEpisode(
        title: json["title"],
        thumbnail: json["thumbnail"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "thumbnail": thumbnail,
        "url": url,
    };
}

class Title {
    Title({
        required this.romaji,
        required this.english,
        required this.native,
        required this.userPreferred,
    });

    String romaji;
    String? english;
    String native;
    String userPreferred;

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        romaji: json["romaji"],
        english: json["english"] ?? null,
        native: json["native"],
        userPreferred: json["userPreferred"],
    );

    Map<String, dynamic> toJson() => {
        "romaji": romaji,
        "english": english,
        "native": native,
        "userPreferred": userPreferred,
    };
}
