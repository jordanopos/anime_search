import 'package:anime_search/src/app/anime/pages/anime_details.page.dart';
import 'package:anime_search/src/app/home/models/anime.response.model.dart';
import 'package:anime_search/src/meta/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeFoundPage extends StatelessWidget {
  final AnimeResponseModel model;
  const HomeFoundPage(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Results")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: model.result.length,
            itemBuilder: (context, index) {
              var result = model.result[index];
              return SmallAnimeResultDisplayWidget(result);
            }),
      ),
    );
  }
}

class SmallAnimeResultDisplayWidget extends StatelessWidget {
  final Result result;
  const SmallAnimeResultDisplayWidget(this.result);

  @override
  Widget build(BuildContext context) {
    print(result.anilist);
    String getPercentage(double value) {
      double thing = (value / 1) * 100;

      String parsed = thing.round().toString();

      return parsed;
    }

    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AnimeDetails(result.anilist))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 90,
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
                  onTap: ()=> AppContants.launchUrl(result.video),
                  child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.network(result.image, fit: BoxFit.cover),
                      color: Colors.grey),
                )),
            Container(width: 10),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(result.filename,
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                    Spacer(),
                    result.episode == null
                        ? Text('')
                        : Text(
                            "Episode: " + result.episode!.toInt().toString()),
                    Text(
                        "Similarity: " + getPercentage(result.similarity) + "%")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
