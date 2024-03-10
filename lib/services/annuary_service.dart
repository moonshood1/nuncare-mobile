import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nuncare/constants/api.dart';
import 'package:nuncare/models/instance.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/services/account_service.dart';

class AnnuaryService {
  Future<List<User>> getDoctors({String size = '5'}) async {
    try {
      final url = Uri.parse("$baseUrl/annuary/doctors?size=$size");

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

        final List<dynamic> doctorsData = responseData['doctors'] ?? [];

        final List<User> doctors =
            doctorsData.map((data) => User.fromJson(data)).toList();

        return doctors;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception('Erreur lors de la récupération des docteurs : $error');
    }
  }

  Future<List<User>> searchDoctor(String searchText) async {
    try {
      final url = Uri.parse("$baseUrl/annuary/search-doctor");

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'searchText': searchText.trim(),
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> usersData = responseData['doctors'] ?? [];

        final List<User> doctors =
            usersData.map((data) => User.fromJson(data)).toList();

        return doctors;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception('Erreur lors de la récupération des medecins : $error');
    }
  }

  Future<List<User>> getDoctorsWithPosition(
    String lat,
    String lng,
    String type,
  ) async {
    try {
      final url =
          Uri.parse("$baseUrl/annuary/doctors-position?&lng=$lng&lat=$lat");

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> doctorsData = responseData['doctors'] ?? [];

        final List<User> doctors =
            doctorsData.map((data) => User.fromJson(data)).toList();

        return doctors;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception(
          'Erreur lors de la récupération des instances avec position : $error');
    }
  }

  Future<List<Instance>> getInstances(String type) async {
    try {
      final url = Uri.parse("$baseUrl/annuary/instance?type=$type");

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

        final List<dynamic> instancesData = responseData['instances'] ?? [];

        final List<Instance> instances =
            instancesData.map((data) => Instance.fromJson(data)).toList();

        return instances;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception('Erreur lors de la récupération des instances : $error');
    }
  }

  Future<List<Instance>> searchInstance(String searchText) async {
    try {
      final url = Uri.parse("$baseUrl/annuary/search-instance");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'searchText': searchText.trim(),
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> instanceData = responseData['instances'] ?? [];

        final List<Instance> instances =
            instanceData.map((data) => Instance.fromJson(data)).toList();

        return instances;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception('Erreur lors de la récupération des instances : $error');
    }
  }

  Future<List<Instance>> getInstancesWithPosition(
    String lat,
    String lng,
    String type,
  ) async {
    try {
      final url = Uri.parse(
        "$baseUrl/annuary/instances-position?type=$type&lng=$lng&lat=$lat",
      );

      final token = await AccountService.getToken();

      if (token == null) {
        throw Exception('Token non disponible');
      }

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final List<dynamic> instanceData = responseData['instances'] ?? [];

        final List<Instance> instances =
            instanceData.map((data) => Instance.fromJson(data)).toList();

        return instances;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception(
          'Erreur lors de la récupération des instances avec position : $error');
    }
  }
}
