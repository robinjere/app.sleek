import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final int? id;
  final String title;
  final String? description;
  final String address;
  final String propertyType;
  final int bedrooms;
  final int bathrooms;
  final double? squareFootage;
  final double price;
  final bool isAvailable;
  final int? yearBuilt;
  final List<String>? amenities;
  final double? latitude;
  final double? longitude;

  const Property({
    this.id,
    required this.title,
    this.description,
    required this.address,
    required this.propertyType,
    this.bedrooms = 0,
    this.bathrooms = 0,
    this.squareFootage,
    required this.price,
    this.isAvailable = true,
    this.yearBuilt,
    this.amenities,
    this.latitude,
    this.longitude,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      propertyType: json['property_type'],
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      squareFootage: json['square_footage'] != null 
          ? double.parse(json['square_footage'].toString()) 
          : null,
      price: double.parse(json['price'].toString()),
      isAvailable: json['is_available'] ?? true,
      yearBuilt: json['year_built'] != null 
          ? int.parse(json['year_built'].toString()) 
          : null,
      amenities: json['amenities'] != null 
          ? List<String>.from(json['amenities']) 
          : null,
      latitude: json['latitude'] != null 
          ? double.parse(json['latitude'].toString()) 
          : null,
      longitude: json['longitude'] != null 
          ? double.parse(json['longitude'].toString()) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'address': address,
      'property_type': propertyType,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'square_footage': squareFootage,
      'price': price,
      'is_available': isAvailable,
      'year_built': yearBuilt,
      'amenities': amenities,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  List<Object?> get props => [
    id, title, description, address, propertyType, 
    bedrooms, bathrooms, squareFootage, price, 
    isAvailable, yearBuilt, amenities, latitude, longitude
  ];
}