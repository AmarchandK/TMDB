import 'package:flutter/material.dart';
import 'package:tmdb/description.dart';
import 'package:tmdb/text.dart';

class TvMovies extends StatelessWidget {
  const TvMovies({super.key, required this.tv});
  final List tv;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(text: 'Tv Shows', color: Colors.red, size: 18),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemCount: tv.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return tv[index]['name'] != null
                  ? InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: tv[index]['name'].toString(),
                                  description: tv[index]['overview'].toString(),
                                  bannerUrl: imageAppendURL +
                                      tv[index]['backdrop_path'],
                                  posterUrl:
                                      imageAppendURL + tv[index]['poster_path'],
                                  vote: tv[index]['vote_average'].toString(),
                                  launchUrl: tv[index]['first_air_date']))),
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    imageAppendURL + tv[index]['poster_path'],
                                  ),
                                ),
                              ),
                            ),
                            ModifiedText(
                                text: tv[index]['original_name'] ?? 'loading',
                                color: Colors.redAccent,
                                size: 15)
                          ],
                        ),
                      ),
                    )
                  : SizedBox();
            },
          ),
        )
      ],
    );
  }
}
