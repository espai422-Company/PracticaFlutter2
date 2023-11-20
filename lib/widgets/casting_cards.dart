import 'package:flutter/material.dart';
import 'package:movies_app/models/actor.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/movieOLD.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final Movie movie;
  const CastingCards({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final movies_provider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder<List<Actor>>(
      // future: movies_provider.getMovieCast(movie.id.),
      future: movies_provider.getMovieCast(1),
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
          width: double.infinity,
          height: 180,
          // color: Colors.red,
          child: ListView.builder(
              itemCount: 10,
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
      width: 110,
      height: 100,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.fullPosterPath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
