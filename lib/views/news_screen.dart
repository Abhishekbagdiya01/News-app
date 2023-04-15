import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({required this.snapshot, required this.index, super.key});
  AsyncSnapshot snapshot;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Hero(
              tag: index,
              child: snapshot.data!.articles![index].urlToImage == null
                  ? Text("N/A")
                  : Image.network(snapshot.data!.articles![index].urlToImage)),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Text(
                  snapshot.data!.articles![index].title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                snapshot.data!.articles![index].description == null
                    ? Text("N/A")
                    : Text(
                        snapshot.data!.articles![index].description,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                snapshot.data!.articles![index].content == null
                    ? Text("N/A")
                    : Text(
                        snapshot.data!.articles![index].content,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                Text("Author : ${snapshot.data!.articles![index].author}",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Publish At ${snapshot.data!.articles![index].publishedAt}",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(snapshot.data!.articles![index].url)
              ],
            ),
          )
        ],
      ),
    );
  }
}
