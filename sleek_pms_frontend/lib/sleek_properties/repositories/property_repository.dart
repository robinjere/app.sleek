import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sleek_pms_frontend/sleek_properties/models/property.dart';

class PropertyRepository {
  final String baseUrl;

  PropertyRepository({required this.baseUrl});

  Future<List<Property>> fetchProperties({Map<String, dynamic>? filters}) async {
    final queryParams = filters?.entries.map((e) => '${e.key}=${e.value}').join('&');
    final url = Uri.parse('$baseUrl/properties${queryParams != null ? '?$queryParams' : ''}');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> propertiesJson = json.decode(response.body)['data'];
      return propertiesJson.map((json) => Property.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load properties');
    }
  }

  Future<Property> addProperty(Property property) async {
    final response = await http.post(
      Uri.parse('$baseUrl/properties'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(property.toJson()),
    );

    if (response.statusCode == 201) {
      return Property.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add property');
    }
  }

  Future<Property> updateProperty(Property property) async {
    final response = await http.put(
      Uri.parse('$baseUrl/properties/${property.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(property.toJson()),
    );

    if (response.statusCode == 200) {
      return Property.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update property');
    }
  }

  Future<void> deleteProperty(int propertyId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/properties/$propertyId'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete property');
    }
  }
}