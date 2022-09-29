import 'package:flutter/material.dart';
import 'package:tmdb/text.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.vote,
    required this.launchUrl,
  });
  final String name, description, bannerUrl, posterUrl, vote, launchUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: [
                Positioned(
                    child: SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    bannerUrl,
                    fit: BoxFit.contain,
                  ),
                )),
                Positioned(
                    bottom: 10,
                    child: ModifiedText(
                        text: 'Average Rating \t $vote',
                        color: Colors.red,
                        size: 18)),
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ModifiedText(text: name, color: Colors.redAccent, size: 15),
              ModifiedText(
                  text: 'Relesing On\t$launchUrl',
                  color: Colors.white,
                  size: 12),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 250,
                width: 150,
                child: Image.network(posterUrl),
              ),
              Flexible(
                  child: ModifiedText(
                      text: description, color: Colors.grey, size: 13))
            ],
          )
        ],
      ),
    );
  }
}
