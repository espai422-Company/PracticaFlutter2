import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final BasicMovie movie;
  const CastingCards({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final movies_provider = Provider.of<MoviesProvider>(context);
    return FutureBuilder<List<Actor>>(
      future: movies_provider.getMovieCast(movie.hashCode),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          height: 180,
          // color: Colors.red,
          child: ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  _CastCard(actor: snapshot.data![index])),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Actor actor;
  const _CastCard({Key? key, required this.actor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 100,
      // color: Colors.green,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomText(text: actor.primaryName),
              SizedBox(height: 5),
              Text(
                'Profession',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomText(text: actor.primaryProfession),
              SizedBox(height: 5),
              Text(
                'Birth and Death',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomText(text: actor.birthYear.toString()),
              CustomText(text: actor.deathYear.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

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
