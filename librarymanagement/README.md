# Library Management System

A comprehensive Flutter application for managing library operations, including attendance, fees, seat allocation, and more.

## Overview
This application serves as a digital solution for library management, providing users with easy access to their plans, attendance records, fee status, and library notices. It is built with a focus on user experience and efficient management.

## Features
The application is modularized into several key features:

- **Authentication (`auth`)**: Login, Signup, OTP Verification, Password Recovery.
- **Dashboard (`dashboard`)**: Central hub for quick actions, status updates, and notices.
- **Attendance (`attendance`)**: Track daily attendance and view history.
- **Fees (`fees`)**: Manage fee payments and view payment history.
- **Plans (`plan`)**: View and manage subscription plans.
- **Seat & Locker (`seat_locker`)**: Information about assigned seats and lockers.
- **Notices & Rules (`notices_rules`)**: Stay updated with library announcements and regulations.
- **Timings (`timings`)**: View library operating hours and holidays.
- **Profile (`profile`)**: Manage user profile and personal details.
- **Settings (`settings`)**: App configuration and preferences.
- **Support (`support`)**: Help and support resources.
- **Reminders (`reminders`)**: Set and manage reminders for important dates.

## Architecture
The project follows a **Feature-First Architecture**, ensuring scalability and maintainability.

### Directory Structure
```
lib/
├── core/                 # Core modules shared across the app
│   ├── constants/        # App-wide constants (colors, strings, styles)
│   ├── router/           # Navigation and routing configuration
│   ├── theme/            # App theme definitions
│   ├── utils/            # Utility functions and helpers
│   └── widgets/          # Reusable UI components
│
├── features/             # Feature-specific code
│   ├── attendance/
│   ├── auth/
│   ├── dashboard/
│   ├── fees/
│   ├── notices_rules/
│   ├── plan/
│   ├── profile/
│   ├── reminders/
│   ├── seat_locker/
│   ├── settings/
│   ├── support/
│   └── timings/
│
└── main.dart             # Application entry point
```

## Getting Started

1. **Prerequisites**: Ensure you have Flutter installed.
2. **Installation**:
   ```bash
   git clone <repository-url>
   cd librarymanagement
   flutter pub get
   ```
3. **Run**:
   ```bash
   flutter run
   ```
