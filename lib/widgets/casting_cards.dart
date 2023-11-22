import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final BasicMovie movie;

  // Constructor for CastingCards widget taking a BasicMovie object as a parameter
  const CastingCards({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(
        context); // Accessing the MoviesProvider using Provider.of

    return FutureBuilder<List<Actor>>(
      future: moviesProvider.getMovieCast(
          movie.hashCode), // Fetching movie cast based on movie hash code
      initialData: [], // Providing initial empty data for the snapshot
      builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
        if (!snapshot.hasData) {
          // Displaying a loading indicator if data is not available
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Displaying the cast cards in a horizontal ListView
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          height: 180,
          // color: Colors.red, // (Optional) Uncomment to set a background color for debugging
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => _CastCard(
                actor:
                    snapshot.data![index]), // Displaying individual cast cards
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Actor actor;

  // Constructor for _CastCard widget taking an Actor object as a parameter
  const _CastCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 100,
      // color: Colors.green, // (Optional) Uncomment to set a background color for debugging
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name', // Label for actor's name
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomText(text: actor.primaryName), // Displaying actor's name
              SizedBox(height: 5),
              Text(
                'Profession', // Label for actor's profession
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomText(
                  text:
                      actor.primaryProfession), // Displaying actor's profession
              SizedBox(height: 5),
              Text(
                'Birth and Death', // Label for actor's birth and death
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomText(
                  text: actor.birthYear
                      .toString()), // Displaying actor's birth year
              CustomText(
                  text: actor.deathYear
                      .toString()), // Displaying actor's death year
            ],
          ),
        ),
      ),
    );
  }
}

// Just a simpe text widget with maxLines set to 2 and overflow set to ellipsis
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
    );
  }
}
