# Library Student App - Project Overview

## 1. Introduction
The **Library Student App** is a comprehensive mobile application designed for students of a private library. It allows students to manage their membership, view their plans, check attendance, track fees, and stay updated with library notices. The app is built with **Flutter** (v3+, null-safety) and targets Android and iOS platforms.

## 2. Technology Stack
- **Framework**: Flutter (Dart)
- **Architecture**: Feature-based (Clean-ish) Architecture
- **State Management**: Prepared for Riverpod (currently using stateless widgets with mock data for UI development)
- **Navigation**: Flutter `Navigator` (Named Routes)
- **Fonts**: Google Fonts (Poppins, Inter)
- **Icons**: Material Icons, Flutter SVG

## 3. Project Structure
The project follows a scalable, feature-first directory structure:

```
lib/
├── core/                   # Core functionality shared across features
│   ├── constants/          # Colors, Strings, TextStyles
│   ├── router/             # AppRouter, Route definitions
│   ├── theme/              # AppTheme, ThemeData configuration
│   ├── utils/              # Validators, Helper functions
│   └── widgets/            # Reusable global widgets (Buttons, TextFields, etc.)
│
├── features/               # Feature-specific code
│   ├── auth/               # Authentication (Login, Signup, OTP, Profile Setup)
│   ├── dashboard/          # Home screen, Quick Actions
│   ├── plan/               # My Plan, Plan History
│   ├── fees/               # Fees Overview, Payment History
│   ├── attendance/         # Daily Attendance, Calendar View
│   ├── seat_locker/        # Seat & Locker Details
│   ├── timings/            # Library Timings, Holidays
│   ├── notices_rules/      # Notices, Rules & Guidelines
│   ├── support/            # Contact, FAQs, Query Form
│   ├── profile/            # User Profile, Edit Profile
│   ├── settings/           # App Settings
│   └── reminders/          # Reminder Banners
│
└── main.dart               # Application Entry Point
```

## 4. Key Features & Modules

### 4.1 Authentication
- **Login**: Secure login using mobile number and password.
- **Signup**: Registration flow for new students.
- **OTP Verification**: Screen for verifying mobile numbers (simulated).
- **Profile Setup**: Initial data collection (Photo, Email, College, Course).
- **Forgot Password**: Flow to reset forgotten passwords.

### 4.2 Dashboard
- **Greeting & Status**: Personalized greeting with active/inactive status indicator.
- **Current Plan Summary**: Quick view of the active plan, seat, and validity.
- **Quick Actions**: Shortcuts to frequently used features (Fees, Attendance, etc.).
- **Notice Preview**: Ticker or preview of the latest important notice.

### 4.3 Plan & Membership
- **My Plan**: Detailed view of the current subscription, including start/end dates, batch timing, and included facilities (WiFi, AC, etc.).
- **Plan History**: Archive of previous subscriptions.

### 4.4 Fees & Payments
- **Overview**: Dashboard for financial status (Total Fees, Paid, Pending).
- **Payment History**: List of past transactions with dates and modes.
- **Alerts**: Prominent banners for overdue payments.

### 4.5 Attendance
- **Daily Status**: Visual indicator of presence for the current day with In/Out times.
- **Calendar View**: Monthly calendar visualization of attendance records.
- **Summary**: Statistics on total present vs. absent days.

### 4.6 Seat & Locker
- **Seat Info**: Display of assigned seat number, type (Cabin/Open), and section.
- **Locker Info**: Display of assigned locker number and status.

### 4.7 Timings & Holidays
- **Timings**: Display of daily opening and closing hours.
- **Holidays**: List of upcoming library holidays.

### 4.8 Notices & Rules
- **Notices**: List of announcements from the administration.
- **Rules**: Categorized list of library rules and guidelines.

### 4.9 Support & Help
- **Contact**: Direct access to library phone numbers, WhatsApp, and location.
- **FAQs**: Answers to common student questions.
- **Raise Query**: Form to submit specific issues or requests.

### 4.10 Profile & Settings
- **Profile**: View and edit personal details (Name, Email, College, etc.).
- **Settings**: Configuration for Language, Dark Mode, Notifications, etc.

## 5. UI/UX Design
- **Theme**: Light theme default with a soft, professional color palette (Teal/Blue primary, Off-white background).
- **Typography**: 
  - **Headings**: Poppins (Modern, geometric)
  - **Body**: Inter (Clean, readable)
- **Components**: Rounded corners (12px-16px), soft shadows for depth, consistent 8px grid spacing.
- **Interactions**: Ripple effects on taps, smooth page transitions.

## 6. Future Roadmap
- **State Management Integration**: Replace mock data with Riverpod providers.
- **Backend Integration**: Connect to a REST API or Firebase for real-time data.
- **Local Storage**: Implement `shared_preferences` or `hive` for persisting user session and settings.
- **Dark Mode**: Fully implement the dark theme toggle defined in `AppTheme`.
- **Notifications**: Integrate Firebase Cloud Messaging (FCM) for push notifications.
