import 'package:http/http.dart' as http;
import 'Post.dart';


class Services {
  //static Uri url =Uri.http('');
  //final uri = Uri.parse('https://api.spotify.com/v1/albums/1qwlxZTNLe1jq3b0iidlue?market=US" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer BQCaWxt5Oc5D-beVxGe_-d6qXfVBfUfJh4R7T4mJV4R11zIdpat1htVAUDmnPBeFMMUMlVDOeOpkIozGOMer72cPlg8vLn-IBgBnTy59EeInEJpHYk7DZgRG_VFcyIaOGBviwKsjwHHgTlA1NdEV3E5RqxO22Ols1oo8TgUOmwJFQbemkPHV5NWnyQZUmLwOjIs');
  static Future<List<Albom>> getAlboms() async {
    try{
      final response = await http.get(Uri.parse('https://api.spotify.com/v1/albums/1qwlxZTNLe1jq3b0iidlue?market=US" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer BQCaWxt5Oc5D-beVxGe_-d6qXfVBfUfJh4R7T4mJV4R11zIdpat1htVAUDmnPBeFMMUMlVDOeOpkIozGOMer72cPlg8vLn-IBgBnTy59EeInEJpHYk7DZgRG_VFcyIaOGBviwKsjwHHgTlA1NdEV3E5RqxO22Ols1oo8TgUOmwJFQbemkPHV5NWnyQZUmLwOjIs'));
      if (response.statusCode == 200){
        final List<Albom> listAlboms = albomFromJson(response.body) as List<Albom>;
        return listAlboms;
      }else{
        return <Albom>[];
      }
    } catch(e){
      return <Albom>[];
    }
  }
}