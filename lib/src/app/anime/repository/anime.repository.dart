import 'dart:convert';

import 'package:anime_search/src/app/anime/models/anilist.response.model.dart';
import 'package:anime_search/src/meta/graphql/connection.dart';
import 'package:anime_search/src/meta/graphql/operations.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

abstract class AnimeRepository {
  Future<AnilistResponseModel> getFullAnime(int id);
}

class AnimeImpl extends AnimeRepository {
  Logger _logger = Logger();
  @override
  Future<AnilistResponseModel> getFullAnime(int id) async {
    QueryOptions options = QueryOptions(
        document: gql(AnimeOperations.getFullAnime), variables: {"id": id});

    QueryResult result = await client.query(options);

    if (result.hasException) {
      _logger.e(result.exception?.graphqlErrors.toString());
      _logger.e(result.exception?.linkException!.originalException.toString());
    }

    _logger.i(result.data);
    AnilistResponseModel model = AnilistResponseModel.fromJson(result.data!);

    return model;
  }
}
