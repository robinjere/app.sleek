import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_pms_frontend/sleek_properties/blocs/property_bloc.dart';
import 'package:sleek_pms_frontend/sleek_properties/repositories/property_repository.dart';
import 'package:sleek_pms_frontend/sleek_properties/screens/property_list_screen.dart';

void main() {
  runApp(const SleekPropertiesApp());
}

class SleekPropertiesApp extends StatelessWidget {
  const SleekPropertiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleek Properties',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RepositoryProvider(
        create: (context) => PropertyRepository(
          baseUrl: 'http://192.168.100.69:8000/api',
        ),
        child: BlocProvider(
          create: (context) => PropertyBloc(
            propertyRepository: context.read<PropertyRepository>(),
          )..add(const FetchPropertiesEvent()),
          child: const PropertyListScreen(),
        ),
      ),
    );
  }
}
