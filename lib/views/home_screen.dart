import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/api/services.dart';

import 'package:news_app/views/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NEWS APP",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: Services().fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) => Card(
                  elevation: 1,
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50,
                        child: Hero(
                          tag: index,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: snapshot.data!.articles![index].urlToImage ==
                                    null
                                ? Text("N/A")
                                : Image.network(
                                    "${snapshot.data!.articles![index].urlToImage}"),
                          ),
                        )),
                    title: Text("${snapshot.data!.articles![index].title}"),
                    subtitle:
                        Text("${snapshot.data!.articles![index].description}"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsScreen(
                              snapshot: snapshot,
                              index: index,
                            ),
                          ));
                    },
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.hasError}"));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
