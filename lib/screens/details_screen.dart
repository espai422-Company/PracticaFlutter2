import 'package:flutter/material.dart';
import 'package:movies_app/models/basic_movie.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Canviar després per una instància de Peli
    final BasicMovie peli =
        ModalRoute.of(context)?.settings.arguments as BasicMovie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            movie: peli, // Displaying a custom app bar for movie details
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitile(
                    movie: peli), // Displaying movie poster and title
                _Overview(movie: peli), // Displaying movie overview
                CastingCards(
                  movie: peli, // Displaying casting cards for the movie
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final BasicMovie movie;

  // Constructor for _CustomAppBar widget taking a BasicMovie object as a parameter
  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo, // Setting app bar background color
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12, // Background color for the title section
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            movie.title, // Displaying movie title in the app bar
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage(
              'assets/loading.gif'), // Placeholder image while loading
          image:
              NetworkImage(movie.url), // Displaying movie image in the app bar
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitile extends StatelessWidget {
  final BasicMovie movie;

  // Constructor for _PosterAndTitile widget taking a BasicMovie object as a parameter
  const _PosterAndTitile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage(
                  'assets/loading.gif'), // Placeholder image while loading
              image: NetworkImage(movie.url), // Displaying movie poster image
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: textTheme.headline5, // Styling for movie title
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                movie.originalTitle,
                style: textTheme.subtitle1, // Styling for original movie title
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                '${movie.releaseYear.year}', // Displaying movie release year
                style: textTheme.caption,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final BasicMovie movie;

  // Constructor for _Overview widget taking a BasicMovie object as a parameter
  const _Overview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        movie.releaseYear
            .toString(), // Displaying movie release year as overview
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
