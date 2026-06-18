# 📱 Book Workflow – Flutter Assignment

## Overview

**Book Workflow** is a Flutter application developed as part of a technical assessment. The application helps priests manage ritual bookings, verify devotees through OTP, and monitor upcoming rituals.

The project is built using a scalable architecture with **Flutter**, **BLoC**, and **AutoRoute**, following clean coding practices and reusable UI components.

---

# ✨ Features Implemented

## 🚀 Splash Screen

* Animated splash screen
* Gradient background
* Custom application logo
* Background watermark
* Get Started button
* AutoRoute navigation

---

## 🏠 Home Dashboard

The dashboard provides an overview of booking information.

### Features

* Dashboard statistics
* Today's booking overview
* Upcoming ritual section
* Recent booking requests
* Pull-to-refresh
* Loading state
* Empty state
* Responsive UI

---

## 📖 Booking Module

Users can view and manage all ritual bookings.

### Features

* Booking list
* Booking statistics
* Search bookings
* Status filter
* Booking cards
* Booking amount
* Booking status
* Responsive design

Supported Filters

* All
* Pending
* Confirmed
* Completed

---

## 📄 Booking Details

Displays complete information about a booking.

### Includes

* Customer information
* Ritual information
* Priest information
* Payment summary
* Booking status
* Verify Ritual button

---

## 🔐 OTP Verification

Secure verification before starting the ritual.

### Features

* 4-digit OTP input
* Auto focus
* Numeric input only
* OTP validation
* Countdown timer
* Resend OTP
* Verify button

---

# 🏗 Architecture

The project follows a modular feature-based architecture.

## 📁 Project Architecture

```text
lib/
│
├── main.dart
├── app.dart
│
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   ├── app_images.dart
│   │   ├── app_sizes.dart
│   │   └── app_constants.dart
│   │
│   ├── routes/
│   │   ├── app_router.dart
│   │   └── app_router.gr.dart
│   │
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── light_theme.dart
│   │   └── dark_theme.dart
│   │
│   ├── widgets/
│   │   ├── custom_bottom_navbar.dart
│   │   ├── home_header.dart
│   │   ├── primary_button.dart
│   │   ├── loading_widget.dart
│   │   ├── empty_widget.dart
│   │   └── error_widget.dart
│   │
│   ├── utils/
│   ├── extensions/
│   ├── network/
│   └── storage/
│
├── data/
│   ├── datasource/
│   │   └── local/
│   │       └── mock_data.dart
│   │
│   ├── models/
│   │   ├── booking_model.dart
│   │   ├── customer_model.dart
│   │   ├── payment_model.dart
│   │   └── service_model.dart
│   │
│   └── repository/
│       └── booking_repository.dart
│
├── features/
│
│   ├── splash/
│   │   └── presentation/
│   │       └── splash_screen.dart
│   │
│   ├── home/
│   │   ├── bloc/
│   │   │   ├── home_bloc.dart
│   │   │   ├── home_event.dart
│   │   │   └── home_state.dart
│   │   │
│   │   └── presentation/
│   │       ├── home_screen.dart
│   │       └── widgets/
│   │           ├── overview_section.dart
│   │           ├── recent_booking_section.dart
│   │           ├── upcoming_ritual_card.dart
│   │           ├── stat_card.dart
│   │           └── booking_request_card.dart
│   │
│   ├── bookings/
│   │   ├── bloc/
│   │   │   ├── booking_bloc.dart
│   │   │   ├── booking_event.dart
│   │   │   └── booking_state.dart
│   │   │
│   │   └── presentation/
│   │       ├── booking_screen.dart
│   │       ├── booking_details_screen.dart
│   │       └── widgets/
│   │           ├── booking_card.dart
│   │           ├── search_bar_widget.dart
│   │           └── status_filter.dart
│   │
│   └── ritual/
│       └── presentation/
│           └── otp_screen.dart
│
├── assets/
│   ├── images/
│   ├── icons/
│   ├── animations/
│   └── json/
│
└── generated/
```

## 📂 Folder Description

### **core/**

Contains reusable components shared across the application.

* **constants/** → Colors, strings, image paths, sizes, application constants.
* **routes/** → AutoRoute configuration and generated navigation files.
* **theme/** → Light and dark theme configuration.
* **widgets/** → Reusable widgets such as buttons, navigation bar, loading, empty and error widgets.
* **utils/** → Helper methods and utility functions.
* **extensions/** → Custom Dart extensions.
* **network/** → API client configuration (future API integration).
* **storage/** → Local storage services (Hive, Shared Preferences).

---

### **data/**

Responsible for data handling.

* **datasource/** → Local mock data and future remote API implementations.
* **models/** → Data models used throughout the application.
* **repository/** → Repository layer that abstracts data access from the UI.

---

### **features/**

Organized using a feature-based architecture.

#### **Splash**

* Splash screen with animation and navigation.

#### **Home**

* Dashboard
* Statistics cards
* Today's overview
* Upcoming ritual
* Recent booking list
* Home BLoC

#### **Bookings**

* Booking list
* Search
* Status filtering
* Booking details
* Booking BLoC

#### **Ritual**

* OTP verification screen
* Ritual verification workflow

---

### **assets/**

Contains application resources.

* Images
* Icons
* Animations
* JSON mock data

---

### **generated/**

Contains generated files such as AutoRoute generated classes.

---

# 🧩 State Management

State management is implemented using **flutter_bloc**.

Implemented BLoCs

* HomeBloc
* BookingBloc

States

* Initial
* Loading
* Loaded
* Empty
* Error

Events

* Load Data
* Search Bookings
* Filter Bookings

---

# 🛣 Navigation

Navigation is implemented using **AutoRoute**.

Configured Routes

* Splash Screen
* Home Dashboard
* Booking Screen
* Booking Details Screen
* OTP Verification Screen

---

# 📱 Responsive Design

The application is fully responsive using **flutter_screenutil**.

Supports

* Different Android screen sizes
* Tablets
* Dynamic font scaling
* Responsive spacing

---

# 📂 Data Source

Currently, booking information is loaded from **local mock JSON/data**.

Implemented

* Mock booking data
* Repository pattern
* Local data source

---

# 🎨 UI Components

Reusable widgets include:

* Custom Bottom Navigation Bar
* Booking Card
* Status Filter Chips
* Search Bar
* Dashboard Statistic Cards
* Upcoming Ritual Card
* Custom Buttons
* Loading Widget

---

# 📦 Packages Used

* flutter_bloc
* equatable
* auto_route
* flutter_screenutil
* hive
* hive_flutter
* shared_preferences
* intl
* google_fonts
* flutter_svg

---

# 🚀 Getting Started

## Clone the repository

```bash
git clone <repository-url>
```

---

## Install dependencies

```bash
flutter pub get
```

---

## Generate AutoRoute files

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Run the application

```bash
flutter run
```

---

# 📌 Current Progress

| Module               | Status      |
| -------------------- | ----------- |
| Project Setup        | ✅ Completed |
| Splash Screen        | ✅ Completed |
| Home Dashboard       | ✅ Completed |
| Booking Module       | ✅ Completed |
| Booking Details      | ✅ Completed |
| OTP Verification     | ✅ Completed |
| AutoRoute Navigation | ✅ Completed |
| BLoC Integration     | ✅ Completed |
| Responsive UI        | ✅ Completed |

---

# 🛠 Technologies

* Flutter
* Dart
* BLoC
* AutoRoute
* ScreenUtil
* Material Design

---

# 📄 Notes

* The application currently uses local mock data.
* The architecture is designed to easily integrate REST APIs in the future.
* All UI components are modular and reusable.
* Navigation follows AutoRoute for maintainability and scalability.

---

# 👨‍💻 Developer

Developed as part of a Flutter technical assessment using best practices in Flutter application development.
# booking-workflow
# bookingworkflow
