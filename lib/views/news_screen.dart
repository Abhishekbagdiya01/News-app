import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({required this.snapshot, required this.index, super.key});
  AsyncSnapshot snapshot;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(children: [
            Hero(
                tag: index,
                child: snapshot.data!.articles![index].urlToImage == null
                    ? const Text("N/A")
                    : Image.network(
                        snapshot.data!.articles![index].urlToImage)),
            Positioned(
              top: 10,
              child: Chip(
                label: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Text(
                  snapshot.data!.articles![index].title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                snapshot.data!.articles![index].description == null
                    ? const Text("N/A")
                    : Text(
                        snapshot.data!.articles![index].description,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                snapshot.data!.articles![index].content == null
                    ? const Text("N/A")
                    : Text(
                        snapshot.data!.articles![index].content,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Text("Author : ${snapshot.data!.articles![index].author}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "Publish At ${snapshot.data!.articles![index].publishedAt}",
                    style: const TextStyle(
                      fontSize: 15,
                    )),
                const SizedBox(
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
