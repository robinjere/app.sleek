# Sleek Properties Management System

## Overview

Sleek Properties is a comprehensive property management system built with:
- Backend: Laravel (PHP)
- Frontend: Flutter (Dart)
- State Management: Bloc
- API Interaction: HTTP

## Features

- Create, Read, Update, Delete (CRUD) property listings
- Support for multiple property types (residential, commercial, apartment, villa)
- Geolocation support
- Flexible property attributes
- Mobile-friendly interface

## Prerequisites

### Backend (Laravel)
- PHP 8.2+
- Composer
- MySQL/PostgreSQL
- Laravel 10.x

### Frontend (Flutter)
- Flutter 3.16+
- Dart 3.2+
- Android Studio or VS Code

## Installation

### Backend Setup

1. Clone the repository
```bash
git clone https://github.com/robinjere/app.sleek.git
cd app.sleek/sleek-pms-backend
```

2. Install dependencies
```bash
composer install
```

3. Configure environment
```bash
cp .env.example .env
php artisan key:generate
```

4. Set up database
```bash
php artisan migrate
```

5. Start development server
```bash
php artisan serve
```

### Frontend Setup

1. Clone the repository
```bash
cd ../sleek-pms-frontend
```

2. Install dependencies
```bash
flutter pub get
```

3. Configure API URL
- Edit `lib/main.dart`
- Update `baseUrl` in `PropertyRepository` to match your Laravel backend

4. Run the app
```bash
flutter run
```

## Project Structure

### Backend
```
sleek-pms-backend/
├── app/
│   ├── Http/Controllers/
│   ├── Models/
│   └── Repositories/
├── config/
├── database/migrations/
└── routes/
```

### Frontend
```
sleek-pms-frontend/
├── lib/
│   ├── sleek-properties
│       ├── models/
│       ├── blocs/
│       ├── repositories/
│       ├── screens/
│       └── widgets/
└── test/
```

## API Endpoints

- `GET /api/properties`: List properties
- `POST /api/properties`: Create property
- `PUT /api/properties/{id}`: Update property
- `DELETE /api/properties/{id}`: Delete property