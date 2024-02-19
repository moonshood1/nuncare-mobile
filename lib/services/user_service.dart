import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nuncare/constants/api.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/services/account_service.dart';

class BasicResponse {
  final bool success;
  final String message;

  BasicResponse({
    required this.success,
    required this.message,
  });
}

class UserResponse {
  final bool success;
  final User user;
  // final List<Article> articles;

  UserResponse({
    required this.success,
    required this.user,

    //  required this.articles
  });
}

class UserService {
  Future<BasicResponse> _processResponse(http.Response response) async {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return BasicResponse(
        success: responseData['success'],
        message: responseData['message'],
      );
    } else {
      String errorMessage = responseData['message'];
      throw Exception(errorMessage);
    }
  }

  Future<BasicResponse> addAbout(String aboutText) async {
    try {
      final url = Uri.parse("$baseUrl/users/about");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            'aboutText': aboutText.trim(),
          },
        ),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout description: $e');
      rethrow;
    }
  }

  Future<BasicResponse> editAbout(String aboutText) async {
    try {
      final url = Uri.parse("$baseUrl/users/about");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            'aboutText': aboutText.trim(),
          },
        ),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout description: $e');
      rethrow;
    }
  }

  Future<BasicResponse> deleteAbout() async {
    try {
      final url = Uri.parse("$baseUrl/users/about");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout description: $e');
      rethrow;
    }
  }

  Future<BasicResponse> addSkill(String skill) async {
    try {
      final url = Uri.parse("$baseUrl/users/skill");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            'skill': skill.trim(),
          },
        ),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout competence: $e');
      rethrow;
    }
  }

  Future<BasicResponse> editSkill(String skill, int position) async {
    try {
      final url = Uri.parse("$baseUrl/users/skill");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            'skill': skill.trim(),
            'position': position,
          },
        ),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout competence: $e');
      rethrow;
    }
  }

  Future<BasicResponse> deleteSkill(int position) async {
    try {
      final url = Uri.parse("$baseUrl/users/skill");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            'position': position,
          },
        ),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout competence: $e');
      rethrow;
    }
  }

  Future<BasicResponse> addExperience(String experience) async {
    try {
      final url = Uri.parse("$baseUrl/users/experience");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            'experience': experience.trim(),
          },
        ),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout experience: $e');
      rethrow;
    }
  }

  Future<BasicResponse> editExperience(String experience, int position) async {
    try {
      final url = Uri.parse("$baseUrl/users/experience");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            'experience': experience.trim(),
            'position': position,
          },
        ),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout experience: $e');
      rethrow;
    }
  }

  Future<BasicResponse> deleteExperience(int position) async {
    try {
      final url = Uri.parse("$baseUrl/users/experience");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            'position': position,
          },
        ),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout experience: $e');
      rethrow;
    }
  }

  Future<BasicResponse> addArticle(
    String title,
    String description,
    String content,
  ) async {
    try {
      final url = Uri.parse("$baseUrl/users/article");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            'title': title.trim(),
            'description': description.trim(),
            'content': content.trim(),
          },
        ),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur Ajout article: $e');
      rethrow;
    }
  }

  Future<BasicResponse> editProfile(Map<String, String> userData) async {
    try {
      final url = Uri.parse("$baseUrl/users/");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(userData),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur modification profil: $e');
      rethrow;
    }
  }

  Future<BasicResponse> editPassword(
      String oldPassword, String newPassword) async {
    try {
      final url = Uri.parse("$baseUrl/users/password");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json
            .encode({'oldPassword': oldPassword, 'newPassword': newPassword}),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur modification profil: $e');
      rethrow;
    }
  }

  Future<BasicResponse> editProfileImage(String newImg) async {
    try {
      final url = Uri.parse("$baseUrl/users/profile-image");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'newImg': newImg,
        }),
      );

      return _processResponse(response);
    } catch (e) {
      print('Erreur modification profil: $e');
      rethrow;
    }
  }

  Future<UserResponse> getUserData() async {
    try {
      final url = Uri.parse("$baseUrl/users");

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

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        User user = User.fromJson(responseData['user']);

        // List<Article> articles = (responseData['articles'] as List)
        //     .map((articleJson) => Article.fromJson(articleJson))
        //     .toList();

        return UserResponse(
          success: responseData['success'],
          user: user,
        );
      } else {
        throw Exception(
          'Erreur lors de la récupération des données utilisateur',
        );
      }
    } catch (e) {
      print('Erreur lors de la récupération des données utilisateur ---: $e');
      rethrow;
    }
  }
}
