import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class MovieSlider extends StatelessWidget {
  // Constructor for MovieSlider widget taking a list of NormalMovie objects
  List<NormalMovie> movies;
  MovieSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Fetching the screen size

    // Checking if the movies list is empty
    if (movies.length == 0) {
      // Displaying a loading indicator if no movies are available
      return Container(
        width: double.infinity,
        height: size.height * 0.25,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Displaying the movie slider container
    return Container(
      width: double.infinity,
      height: 260,
      // color: Colors.red, // (Optional) Uncomment to set a background color for debugging
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Nostalgic', // Title for the movie slider
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Allowing horizontal scrolling
              itemCount: movies.length,
              itemBuilder: (_, int index) => _MoviePoster(
                movie: movies[index], // Displaying individual movie posters
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final NormalMovie movie;

  // Constructor for _MoviePoster widget taking a NormalMovie object as a parameter
  const _MoviePoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green, // (Optional) Uncomment to set a background color for debugging
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'details', // Navigating to the 'details' route on tap
              arguments: BasicMovie.fromMovie2(
                  movie), // Passing movie details as arguments
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage(
                    'assets/no-image.jpg'), // Placeholder image while loading
                image: NetworkImage(
                  movie.primaryImage == null
                      ? 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg'
                      : movie.primaryImage!.url,
                ), // Displaying movie image fetched from the network
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
            movie.titleText.text, // Displaying movie title
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
