import 'package:flutter/material.dart';
import 'package:movies_app/models/basic_movie.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/movie2.dart';

class MovieSlider extends StatelessWidget {
  // const MovieSlider({Key? key}) : super(key: key);
  List<Movie2> movies;
  MovieSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.25,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populars',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, int index) => _MoviePoster(
                      movie: movies[index],
                    )),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie2 movie;

  const _MoviePoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: BasicMovie.fromMovie2(movie)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.primaryImage == null
                    ? 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'
                    : movie.primaryImage!.url),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.titleText.text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
