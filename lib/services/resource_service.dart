import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nuncare/constants/api.dart';
import 'package:nuncare/models/ad.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/models/medecine.dart';
import 'package:nuncare/models/notification.dart';
import 'package:nuncare/services/account_service.dart';

class ResourceService {
  Future<List<Medecine>> getMedecines({String size = '5'}) async {
    try {
      final url = Uri.parse("$baseUrl/resources/medecines?size=$size");

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> medecinesData = responseData['medecines'] ?? [];

        final List<Medecine> medecines =
            medecinesData.map((data) => Medecine.fromJson(data)).toList();

        return medecines;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception(
          'Erreur lors de la récupération des médicaments : $error');
    }
  }

  Future<List<Ad>> getAds() async {
    try {
      final url = Uri.parse("$baseUrl/resources/ads");

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> adsData = responseData['ads'] ?? [];

        final List<Ad> ads = adsData.map((data) => Ad.fromJson(data)).toList();

        return ads;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception(
          'Erreur lors de la récupération des médicaments : $error');
    }
  }

  Future<List<Article>> getArticles({String size = '5'}) async {
    try {
      final url = Uri.parse("$baseUrl/resources/articles?size=$size");

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> articlesData = responseData['articles'] ?? [];

        final List<Article> articles =
            articlesData.map((data) => Article.fromJson(data)).toList();

        return articles;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception(
          'Erreur lors de la récupération des médicaments : $error');
    }
  }

  Future<List<Notif>> getNotifications() async {
    try {
      final url = Uri.parse("$baseUrl/resources/notifications");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> notificationsData =
            responseData['notifications'] ?? [];

        final List<Notif> notifications =
            notificationsData.map((data) => Notif.fromJson(data)).toList();

        return notifications;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception(
          'Erreur lors de la récupération des médicaments : $error');
    }
  }
}
