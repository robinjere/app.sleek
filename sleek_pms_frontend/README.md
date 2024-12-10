# Sleek Properties Mobile App

A Flutter-based mobile application for property management, built for Sleek Properties LLC.

## Features

- View list of properties
- Add new properties
- Edit existing properties
- Delete properties
- Detailed property information

## Getting Started

### Prerequisites

- Flutter SDK 3.16+
- Dart SDK 3.2+
- Laravel Backend API

### Installation

1. Clone the repository
2. Run `flutter pub get`
3. Update `baseUrl` in `main.dart` to match your Laravel API endpoint
4. Run the application

## Project Structure

- `lib/models/`: Data models
- `lib/blocs/`: State management
- `lib/repositories/`: API interactions
- `lib/screens/`: UI screens
- `lib/widgets/`: Reusable UI components

## Backend Integration

Requires a Laravel backend with RESTful API endpoints for:
- Fetching properties
- Adding properties
- Updating properties
- Deleting properties

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details