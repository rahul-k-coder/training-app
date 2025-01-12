
A new Flutter project.

Apk Link =>>> https://drive.google.com/file/d/1XF40_S7J9tiufAuLEuxf83rLSlxioRBh/view?usp=sharing

## Info : I don't have video recording tools available, so I can't record my code.

## Getting Started

Steps to Implement the Project
## Project Setup
   Flutter Project Initialization:
   Run flutter create training_app to create the project.
   Include necessary dependencies in pubspec.yaml:
   ## yaml
  
   dependencies:
   flutter:
   # sdk: flutter
   # provider: ^6.1.0
   # carousel_slider: ^5.0.0
   # flutter_dash: ^1.0.0
   # responsive_framework: ^1.5.1



## Directory Structure:
   
   lib/
   ├── main.dart
   ├── screens/
   │   ├── home_screen.dart
   │   │           ├── horizontal_carousel
   │   │           ├── training_list
   │   │           ├── filter_button
   │   │                    ├── _modalBottomSheetMenu()
   │   ├── training_details_screen.dart
   ├── models/
   │   ├── training.dart
   ├── providers/
   ├── training_provider.dart


## Key Features Implementation
   Horizontal Swipe Carousel:

- Use the carousel_slider package to implement the swipe carousel.
  Display featured training cards.
  Filter Functionality:

- Create a FilterButton widget that opens a bottom sheet.
  Bottom sheet includes filter options for location, training name, and trainer name.
  Use a Provider to manage filtered data.
  Vertical List of Trainings:

- Use a ListView.builder to display training options based on filters.
  Include basic details like training name, trainer name, and location.
  Detailed View for Trainings:

- Create a TrainingDetailsScreen to show full training information.
- Navigate to this screen using Navigator.push.

## Deliverables
   APK File:

- Build the APK using flutter build apk.
- Commit the APK to the GitHub repository under a directory called apk.

