import 'package:graphql/client.dart';

final _httpLink = HttpLink(
  'https://graphql.anilist.co',
);


final GraphQLClient client = GraphQLClient(
  cache: GraphQLCache(),
  link: _httpLink,
);
