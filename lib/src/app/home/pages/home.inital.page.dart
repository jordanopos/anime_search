import 'dart:io';
import 'package:anime_search/src/app/home/bloc/home_bloc.dart';
import 'package:anime_search/src/app/home/pages/home.found.page.dart';
import 'package:anime_search/src/meta/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomeInitialPage extends StatefulWidget {
  const HomeInitialPage({Key? key}) : super(key: key);

  @override
  State<HomeInitialPage> createState() => _HomeInitialPageState();
}

class _HomeInitialPageState extends State<HomeInitialPage> {
  XFile? file;

  void pickfile() async {
    ImagePicker _picker = ImagePicker();

    XFile? gottenFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      file = gottenFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    var homeBloc = context.read<HomeBloc>();
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => setState(() {
                    file = null;
                  }),
              icon: Icon(Icons.refresh))
        ], title: Text("Anime Search")),
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeLoaded) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HomeFoundPage(state.model);
              }));
            } else if (state is HomeLoadingError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(state.message),
              ));
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Container(
                  color: Colors.grey[900],
                  height: 300,
                  child: file == null
                      ? InkWell(
                          onTap: () => this.pickfile(),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud),
                                Text("Click here to Upload"),
                              ],
                            ),
                          ),
                        )
                      : kIsWeb
                          ? Image.network(file!.path)
                          : Image.file(
                              File(file!.path),
                              fit: BoxFit.cover,
                            ),
                ),
                Spacer(),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return state is HomeLoading
                        ? CircularProgressIndicator()
                        : MaterialButton(
                            color: AppContants.mainColor,
                            child: Center(child: Text("Search Anime")),
                            onPressed: file == null ? null : () => homeBloc.add(SearchAnime(file!)),
                          );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
