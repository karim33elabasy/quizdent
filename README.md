### Overview
The Events and Activities System is a comprehensive mobile application designed to help organizations and companies communicate effectively with their audience. The system keeps users informed and updated about all events, programs, and sessions, providing detailed information through notifications and calendars. The application is built with a focus on user-friendliness, real-time updates, and interactive features to enhance user engagement.

### Features
The application includes the following key features:

- Authentication
   Secure user registration and login.

User profile management (e.g., personal data, saved events, and settings).

- Home Screen
   Event Calendar: Displays upcoming events in both calendar and list views, sorted by date.

Timeline Tab: Shows events the user has enrolled in, sorted by date.

Main Tab: Displays all events with filters for categories and search functionality.

- Contact/Support
   Contact Us Form: Allows users to send inquiries or complaints directly using their registered details.

Support Messages: Users can submit support requests and track their status.

- Notifications
   Notifications Center: Delivers real-time notifications about events and activities, both in the app’s foreground and background.

Customizable notification settings to allow users to manage their preferences.

- Event Details
   Detailed information about each event, including timing, location, description, speakers, and fees.

Visual covers or posters for each event.

- Extra Features (Optional)
   Shareable Event Flyers: Users can share events on social media or through direct messaging.

Badges and Achievements System: Rewards users for their participation and engagement.

### Technology Stack
Mobile Platform: Android and iOS.

Frontend: Flutter for cross-platform mobile development.

Backend: Firebase Firestore for real-time data storage and synchronization.

Authentication: Firebase Authentication for secure user management.

Notifications: Firebase Cloud Messaging (FCM) for push notifications.

### System Requirements
- Hardware: GPS-enabled smartphones running Android 6.0+ or iOS 11+.

- Backend Services: Firebase for data handling, authentication, and notifications.

### Environment Setup
- Development Environment
  - IDE: Android Studio or VS Code for Flutter development, Xcode for iOS.

  - Version Control: GitHub for code repositories and version control.

    
Project Timeline
The project was completed in 5-7 days, including development, testing, and documentation.

Code Structure
The application is organized into the following key components:

1. Authentication
   AuthBloc: Manages user authentication state.

User Model: Represents user data, including profile information and saved events.

2. Home Screen
   EventsCubit: Manages the state of events (e.g., fetching, filtering, and sorting).

HomeTabs: Displays events in different views (e.g., calendar, timeline, and main tab).

TimelineTab: Shows events the user has enrolled in, sorted by date.

3. Contact/Support
   SupportRepo: Handles support message submissions and interactions with Firebase.

SupportBloc: Manages the state of support messages.

4. Profile
   NotificationsCubit: Manages notification settings and delivery.

Firebase Cloud Messaging (FCM): Handles push notifications.

### Screenshots
(Will be added soon)

### 📩 Contact
🚀 Created by: Karim Elabasy
📧 Email: karim33elabasy@gmail.com

