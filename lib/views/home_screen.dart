import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/views/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<NewsModel> fetchNews() async {
    final url =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=e07033cdb6d54aa6bc21490cf0106bf2";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return NewsModel.fromJson(result);
    } else {
      return NewsModel();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNews();
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
          future: fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) => ListTile(
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
