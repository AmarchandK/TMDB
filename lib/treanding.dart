import 'package:flutter/material.dart';
import 'package:tmdb/description.dart';
import 'package:tmdb/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});
  final List trending;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(
            text: 'Treanding Movies', color: Colors.red, size: 18),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemCount: trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return trending[index]['title'] != null
                  ? InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                                name: trending[index]['title'],
                                description: trending[index]['overview'],
                                bannerUrl: imageAppendURL +
                                    trending[index]['backdrop_path'],
                                posterUrl: imageAppendURL +
                                    trending[index]['poster_path'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                                launchUrl: trending[index]['release_date']),
                          )),
                      child: SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imageAppendURL +
                                          trending[index]['poster_path'],
                                    ),
                                  ),
                                ),
                              ),
                              ModifiedText(
                                  text: trending[index]['title'] ?? 'loading',
                                  color: Colors.redAccent,
                                  size: 15)
                            ],
                          )),
                    )
                  : const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
