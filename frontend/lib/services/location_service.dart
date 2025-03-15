import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location.dart';

class LocationService {
  static const String baseUrl = 'http://localhost:8080/api/locations';

  Future<List<Location>> getLocations() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Location.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }

  Future<List<Location>> getActiveLocations() async {
    final response = await http.get(Uri.parse('$baseUrl/active'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Location.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load active locations');
    }
  }

  Future<Location> createLocation(Location location) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(location.toJson()),
    );
    if (response.statusCode == 201) {
      return Location.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create location');
    }
  }

  Future<Location> updateLocation(Location location) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${location.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(location.toJson()),
    );
    if (response.statusCode == 200) {
      return Location.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update location');
    }
  }

  Future<void> deleteLocation(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete location');
    }
  }
} 