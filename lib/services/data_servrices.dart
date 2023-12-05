
import 'package:http/http.dart' as http;

class DataServices  {

 Future<String> makeRequestToApi()async{

   String url = 'api.openweathermap.org';
   String url2 = '/data/2.5/weather?lat=44.34&lon=10.99&appid=c5fd9d09f2ddff12a7eec611792f3bf7';

    final uri = Uri.https(url, url2);

    final response = await http.get(uri);

    return response.body;
  }
}