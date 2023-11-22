import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<UpcommingMovie> movies;

  // Constructor for CardSwiper widget taking a list of UpcomingMovie objects as a parameter
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.length == 0) {
      // Displaying a loading indicator if no movies are available
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Displaying a swiper widget to showcase movies in a stack layout
    return Container(
      width: double.infinity,
      // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
      height: size.height * 0.5,
      // color: Colors.red, // (Optional) Uncomment to set a background color for debugging
      child: Swiper(
        itemCount:
            5, // Fixed count of items for the swiper (You may adjust this based on your requirements)
        layout: SwiperLayout.STACK, // Displaying items in a stacked layout
        itemWidth: size.width * 0.6, // Width of each swiper item
        itemHeight: size.height * 0.4, // Height of each swiper item
        itemBuilder: (BuildContext context, int index) {
          final movie =
              movies[index]; // Fetching the current movie from the list
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'details', // Navigating to the 'details' route on tap
              arguments: BasicMovie.fromMovie(
                  movies[index]), // Passing movie details as arguments
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
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
