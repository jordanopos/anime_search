import 'package:anime_search/src/app/anime/bloc/anime_bloc.dart';
import 'package:anime_search/src/app/anime/models/anilist.response.model.dart';
import 'package:anime_search/src/meta/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeDetails extends StatefulWidget {
  final int id;

  const AnimeDetails(this.id);

  @override
  State<AnimeDetails> createState() => _AnimeDetailsState();
}

class _AnimeDetailsState extends State<AnimeDetails> {
  AnimeBloc? animeBloc;

  @override
  void initState() {
    animeBloc = context.read<AnimeBloc>()..add(GetFullAnime(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(actions: [
      //   IconButton(
      //       onPressed: () => animeBloc!.add(GetFullAnime(widget.id)),
      //       icon: Icon(Icons.refresh))
      // ], title: Text("details")),
      body: BlocBuilder<AnimeBloc, AnimeState>(
        builder: (context, state) {
          if (state is AnimeLoaded) {
            return AnimeDetailsLoadedPage(model: state.model);
          } else if (state is AnimeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AnimeLoadingError) {
            return Center(child: Text(state.message));
          }
          return Container(child: Center(child: Text(state.toString())));
        },
      ),
    );
  }
}

class AnimeDetailsLoadedPage extends StatelessWidget {
  final AnilistResponseModel model;
  const AnimeDetailsLoadedPage({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          stretch: true,
          pinned: true,
          backgroundColor: Colors.black,
          expandedHeight: 400,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [StretchMode.zoomBackground],
            title: Text(
                model.media.title.english ?? model.media.title.userPreferred,
                style: TextStyle(fontSize: 14)),
            centerTitle: true,
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(model.media.coverImage.extraLarge,
                    fit: BoxFit.cover),
                DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          end: Alignment(0.0, 0.0),
                          colors: [Color(0x60000000), Color(0x00000000)])),
                )
              ],
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(model.media.description.replaceAll("<br>", "")),
                  model.media.streamingEpisodes.length != 0
                      ? EpisodesContainer(model.media.streamingEpisodes)
                      : Container(),
                  CharactersContainer(model.media.characters.nodes)
                ],
              )),
        ]))
      ],
      // children: [

      // ],
    );
  }
}

class CharactersContainer extends StatelessWidget {
  final List<Node> nodes;
  const CharactersContainer(this.nodes);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Characters", style: TextStyle(fontSize: 15)),
        Container(height: 10),
        Container(
            height: 100,
            child: ListView.builder(
                itemCount: nodes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  NetworkImage(nodes[index].image.medium)),
                          Container(height: 5),
                          Text(nodes[index].name.full!),
                        ],
                      ));
                })),
      ],
    );
  }
}

class EpisodesContainer extends StatelessWidget {
  final List<StreamingEpisode> episodes;

  const EpisodesContainer(this.episodes);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text("Episodes", style: TextStyle(fontSize: 15)),
        Container(height: 10),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: episodes.length,
            itemBuilder: (context, index) {
              var episode = episodes[index];
              return ListTile(
                onTap: ()=>AppContants.launchUrl(episode.url),
                  contentPadding: const EdgeInsets.only(),
                  leading: Image.network(episode.thumbnail),
                  title: Text(episode.title, style: TextStyle(fontSize: 14)));
            })
      ],
    ));
  }
}
