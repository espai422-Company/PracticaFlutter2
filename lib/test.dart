import 'package:http/http.dart' as http;

void main() async {
  final String apiKey = 'e261fe5c1cmsheeb3731d4a3b275p15f337jsnb6c825996c77';
  final String apiUrl =
      'https://moviesdatabase.p.rapidapi.com/titles/x/upcoming';

  Map<String, String> headers = {
    'X-RapidAPI-Key': apiKey,
    'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com',
  };

  try {
    var response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      // Handle the API response data here
    } else {
      print('Request failed with status: ${response.statusCode}');
      // Handle error response here
    }
  } catch (error) {
    print('Error fetching data: $error');
    // Handle any errors that occur during the API call
  }
}
