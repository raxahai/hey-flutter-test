# test_task

A new Flutter test project for HeyFlutter.

## Getting Started

Flutter version: 3.24.0
JDK: 11 and above

Developer Onboarding Task: Automated Package Integration in Flutter Project

### Task Objective

The goal of this task is to create a flexible setup that automates the integration of any selected package into an existing Flutter project. The process should allow the user to:
Select a Flutter project.

#### Automatically integrate the google_maps_flutter

Configure platform-specific settings (Android and iOS).
Make an example of usage of Google map

Task Steps
Step 1: Implement Project Selection Feature (30 mins)
Create Project Selection UI
Build a UI component (such as a file picker) that allows the user to select a Flutter project directory.
Step 2: Automate Package Integration (1 hr)
Modify pubspec.yaml for Package Addition
Write logic to update the pubspec automatically.yaml file by adding the google_maps_flutter
Run flutter pub get
Automatically execute the flutter pub get command to install the package in the selected project.
Step 3: API Key or Token Management (30 mins)
Prompt for Existing API Key
Display a dialog asking the user if they already have the necessary API key for the Google map

Step 4: Platform-Specific Configuration (2hr)
Android Configuration
Programmatically modify the AndroidManifest.xml to insert any necessary configuration API keys for Google Maps.
Ensure proper indentation and formatting to avoid XML errors.
iOS Configuration
Programmatically update Info.plist or AppDelegate.swift to insert any required API keys or configuration for the package.

Step 5: Create and Run a Demo (1 hr)
Add Example Widget
Integrate a simple example widget for the Google Maps package into the main screen of the selected Flutter project

Total estimation 5 hours
