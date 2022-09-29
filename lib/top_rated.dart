import 'package:flutter/material.dart';
import 'package:tmdb/text.dart';

import 'description.dart';

class TopratedMovies extends StatelessWidget {
  const TopratedMovies({super.key, required this.toprated});
  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(
            text: 'Top rated Movies', color: Colors.red, size: 18),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemCount: toprated.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return toprated[index]['title'] != null
                  ? InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: toprated[index]['title'].toString(),
                                  description:
                                      toprated[index]['overview'].toString(),
                                  bannerUrl: imageAppendURL +
                                      toprated[index]['backdrop_path'],
                                  posterUrl: imageAppendURL +
                                      toprated[index]['poster_path'],
                                  vote: toprated[index]['vote_average']
                                      .toString(),
                                  launchUrl: toprated[index]['release_date']))),
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    imageAppendURL +
                                        toprated[index]['poster_path'],
                                  ),
                                ),
                              ),
                            ),
                            ModifiedText(
                                text: toprated[index]['title'] ?? 'loading',
                                color: Colors.redAccent,
                                lines: 10,
                                size: 15)
                          ],
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
