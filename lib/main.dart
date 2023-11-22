import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({super.key}); // Constructor for the state of the app

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Utilizing MultiProvider to manage multiple providers
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                MoviesProvider()), // Providing MoviesProvider using ChangeNotifierProvider
      ],
      child: MyApp(), // Displaying the main app widget
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disabling the debug banner
      title: 'Pel·lícules', // Setting the app title
      initialRoute: 'home', // Defining the initial route of the app
      routes: {
        'home': (BuildContext context) =>
            HomeScreen(), // Setting the 'home' route to HomeScreen widget
        'details': (BuildContext context) =>
            DetailsScreen(), // Setting the 'details' route to DetailsScreen widget
      },
      theme: ThemeData.light().copyWith(
        // Defining the app's theme with light theme and customizing the app bar color
        appBarTheme: const AppBarTheme(color: Colors.indigo),
      ),
    );
  }
}
