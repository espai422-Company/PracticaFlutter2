import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/movie2.dart';

class BasicMovie {
  String title;
  String originalTitle;
  String url;
  ReleaseYear releaseYear;

  BasicMovie({
    required this.title,
    required this.originalTitle,
    required this.url,
    required this.releaseYear,
  });

  factory BasicMovie.fromMovie(Movie movie) => BasicMovie(
        title: movie.titleText == null ? 'NO TITLE' : movie.titleText!.text,
        originalTitle: movie.originalTitleText == null
            ? 'NO ORIGINAL TITLE'
            : movie.originalTitleText!.text,
        url: movie.primaryImage?.url ?? '',
        releaseYear:
            movie.releaseYear ?? ReleaseYear(year: 0, typename: '', endYear: 0),
      );

  factory BasicMovie.fromMovie2(Movie2 movie) => BasicMovie(
        title: movie.titleText == null ? 'NO TITLE' : movie.titleText.text,
        originalTitle: movie.originalTitleText == null
            ? 'NO ORIGINAL TITLE'
            : movie.originalTitleText.text,
        url: movie.primaryImage?.url ?? '',
        releaseYear: movie.releaseYear,
      );
}
