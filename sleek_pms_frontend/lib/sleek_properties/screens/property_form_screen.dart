import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_pms_frontend/sleek_properties/blocs/property_bloc.dart';
import 'package:sleek_pms_frontend/sleek_properties/models/property.dart';

class PropertyFormScreen extends StatefulWidget {
  final Property? property;

  const PropertyFormScreen({super.key, this.property});

  @override
  _PropertyFormScreenState createState() => _PropertyFormScreenState();
}

class _PropertyFormScreenState extends State<PropertyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _address;
  late String _propertyType;
  late double _price;
  int _bedrooms = 0;
  int _bathrooms = 0;
  String? _description;

  @override
  void initState() {
    super.initState();
    if (widget.property != null) {
      _title = widget.property!.title;
      _address = widget.property!.address;
      _propertyType = widget.property!.propertyType;
      _price = widget.property!.price;
      _bedrooms = widget.property!.bedrooms;
      _bathrooms = widget.property!.bathrooms;
      _description = widget.property!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.property == null ? 'Add New Property' : 'Edit Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                initialValue: _address,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
                onSaved: (value) => _address = value!,
              ),
              DropdownButtonFormField<String>(
                value: _propertyType,
                decoration: const InputDecoration(labelText: 'Property Type'),
                items: ['residential', 'commercial', 'apartment', 'villa']
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) => setState(() {
                  _propertyType = value!;
                }),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a property type';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _price.toString(),
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
                onSaved: (value) => _price = double.parse(value!),
              ),
              TextFormField(
                initialValue: _bedrooms.toString(),
                decoration: const InputDecoration(labelText: 'Bedrooms'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of bedrooms';
                  }
                  return null;
                },
                onSaved: (value) => _bedrooms = int.parse(value!),
              ),
              TextFormField(
                initialValue: _bathrooms.toString(),
                decoration: const InputDecoration(labelText: 'Bathrooms'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of bathrooms';
                  }
                  return null;
                },
                onSaved: (value) => _bathrooms = int.parse(value!),
              ),
              TextFormField(
                initialValue: _description,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onSaved: (value) => _description = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.property == null
                    ? 'Add Property'
                    : 'Update Property'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final property = Property(
        id: widget.property?.id,
        title: _title,
        address: _address,
        propertyType: _propertyType,
        price: _price,
        bedrooms: _bedrooms,
        bathrooms: _bathrooms,
        description: _description,
        isAvailable: true,
      );

      if (widget.property == null) {
        context.read<PropertyBloc>().add(AddPropertyEvent(property));
      } else {
        context.read<PropertyBloc>().add(UpdatePropertyEvent(property));
      }

      Navigator.pop(context);
    }
  }
}
