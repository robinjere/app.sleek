import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_pms_frontend/sleek_properties/blocs/property_bloc.dart';
import 'package:sleek_pms_frontend/sleek_properties/screens/property_form_screen.dart';
import 'package:sleek_pms_frontend/sleek_properties/widgets/property_card.dart';

class PropertyListScreen extends StatelessWidget {
  const PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleek Properties'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PropertyFormScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<PropertyBloc, PropertyState>(
        builder: (context, state) {
          if (state is PropertyLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PropertyLoadedState) {
            return ListView.builder(
              itemCount: state.properties.length,
              itemBuilder: (context, index) {
                final property = state.properties[index];
                return PropertyCard(property: property);
              },
            );
          } else if (state is PropertyErrorState) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }
          return const Center(child: Text('No properties found'));
        },
      ),
    );
  }
}
