### Overview
The Events and Activities System is a comprehensive mobile application designed to help organizations and companies communicate effectively with their audience. The system keeps users informed and updated about all events, programs, and sessions, providing detailed information through notifications and calendars. The application is built with a focus on user-friendliness, real-time updates, and interactive features to enhance user engagement.

### Screenshots


### Features
The application includes the following key features:

# Authentication
  Secure user registration and login with firebase authenticaion.
  Validation of user inputs before submitting requests to firebase.
  Stylish loading button UI till receiving the response.
  Safe error handling that could be happen due to server,internet or internal errors.  

# Events
- Home Screen
  Main Tab: Displays all events with filters for categories and search functionality.

  Event Calendar: Displays upcoming events in both calendar and list views, sorted by date.

  Timeline Tab: Shows events the user has enrolled in, sorted by date.
  
- Event Screen
  Hero animation for the event photo.
  Easy to enroll button with loading animation.
  Attractive UI to show event details.
  
# Support
- Support Screen
  Fast Whatsapp launcher to open the support chat number.
  Fast Email launcher to send user inquiries with email title auto filled.
  Contact Us Form: Allows users to send inquiries or complaints directly using their registered details.
  FAQ section to answer frequent questions.
  attractive UI with awsome UX.
- Contact Us Screen
  Attractive UI with simple UX.
  Proper error handling to enhance user experience.
  Loading Button.
  
# Profile 
  Generate user avatars (billions of avatars) which will enhance user experience.
  Control Light/Dark mode which could be auto or activating the dark mode.
  Change user personal information easily.
  Change App language (easy localization scalability).
  Control the type of notifications.
  
# Notifications
  Delivers real-time notifications about events and activities, both in the app’s foreground and background.
  Notifications still work even after application not running.
  Customizable notification settings to allow users to manage their preferences.
  

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
 
  - Flutter 3.27.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision c519ee916e (7 weeks ago) • 2025-01-21 10:32:23 -0800
Engine • revision e672b006cb
Tools • Dart 3.6.1 • DevTools 2.40.2

    
Project Timeline
The project was completed in 5-7 days, including development, testing, and documentation.

Code Structure
The application is organized into the following key components:

├── core
│   ├── constants
│   │   ├── app_assets.dart
│   │   ├── app_colors.dart
│   │   ├── my_padding.dart
│   │   ├── sizes.dart
│   ├── failure
│   │   ├── failure.dart
│   │   ├── firebase_authentication_failure.dart
│   │   ├── firestore_failure.dart
│   │   ├── general_auth_failure.dart
│   │   ├── repo_implementation_failure.dart
│   ├── strings
│   │   ├── screen_strings
│   │   │   ├── strings_of_contact_us_screen.dart
│   │   │   ├── strings_of_event_screen.dart
│   │   │   ├── strings_of_home.dart
│   │   │   ├── strings_of_profile_screen.dart
│   │   │   ├── strings_of_support_screen.dart
│   │   ├── app_strings.dart
│   │   ├── strings_of_auth.dart
│   │   ├── strings_of_errors.dart
│   │   ├── strings_of_error_codes.dart
│   │   ├── strings_of_firebase.dart
│   ├── themes
│   │   ├── widget_themes
│   │   │   ├── appbar_theme.dart
│   │   │   ├── bottom_sheet_theme.dart
│   │   │   ├── checkbox_theme.dart
│   │   │   ├── chip_theme.dart
│   │   │   ├── elevated_button_theme.dart
│   │   │   ├── outlined_button_theme.dart
│   │   │   ├── text_field_theme.dart
│   │   │   ├── text_theme.dart
│   │   ├── my_theme.dart
│   ├── usecases
│   │   ├── main_usecase.dart
│   │   ├── no_params.dart
│   ├── utils
│   │   ├── app_routes.dart
│   │   ├── notifications_services.dart
│   │   ├── services_locator.dart
│   │   ├── shared_pref_services.dart
│   ├── validators_and_helpers
│   │   ├── date_time_formatter.dart
│   │   ├── validation.dart
│   ├── variables_and_enums
│   │   ├── enums.dart
│   │   ├── shared_pref_variables.dart
│   ├── widgets
│   │   ├── dialogs
│   │   │   ├── my_dialog.dart
│   │   │   ├── show_my_dialog.dart
│   │   ├── snack_bars
│   │   │   ├── my_snack_bar.dart
│   │   ├── loading_widget.dart
│   │   ├── my_appbar.dart
│   │   ├── my_button.dart
│   │   ├── my_loading_button.dart
│   │   ├── my_tff.dart
│   │   ├── no_data_widget.dart
│   │   ├── section_title.dart
│   │   ├── side_menu.dart
│   │   ├── side_menu_item.dart
├── features
│   ├── authentication
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   ├── auth_repo_datasource.dart
│   │   │   │   ├── firebase_auth_repo.dart
│   │   │   ├── mappers
│   │   │   │   ├── login_mapper.dart
│   │   │   │   ├── signup_mapper.dart
│   │   │   │   ├── user_mapper.dart
│   │   │   ├── models
│   │   │   │   ├── login_model.dart
│   │   │   │   ├── signup_model.dart
│   │   │   │   ├── user_model.dart
│   │   │   ├── repo
│   │   │   │   ├── auth_repo_implem.dart
│   │   ├── domain
│   │   │   ├── repo
│   │   │   │   ├── auth_repo.dart
│   │   │   ├── usecases
│   │   │   │   ├── forget_password_usecase.dart
│   │   │   │   ├── login_usecase.dart
│   │   │   │   ├── signup_usecase.dart
│   │   │   ├── utilities
│   │   │   │   ├── login_entity.dart
│   │   │   │   ├── signup_entity.dart
│   │   │   │   ├── user_entity.dart
│   │   ├── presentation
│   │   │   ├── manager
│   │   │   │   ├── auth_bloc
│   │   │   │   │   ├── auth_bloc.dart
│   │   │   │   │   ├── auth_event.dart
│   │   │   │   │   ├── auth_state.dart
│   │   │   ├── widgets
│   │   │   │   ├── auth_body.dart
│   │   │   │   ├── login_body.dart
│   │   │   │   ├── my_tff_password.dart
│   │   │   │   ├── reset_password_dialog.dart
│   │   │   │   ├── signup_body.dart
│   │   │   ├── auth_screen.dart
│   ├── home
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   ├── firestore_data_source.dart
│   │   │   │   ├── main_event_data_source.dart
│   │   │   ├── mappers
│   │   │   │   ├── event_category_mapper.dart
│   │   │   │   ├── event_mapper.dart
│   │   │   │   ├── speaker_mapper.dart
│   │   │   ├── models
│   │   │   │   ├── event_category_model.dart
│   │   │   │   ├── event_model.dart
│   │   │   │   ├── speaker_model.dart
│   │   │   ├── repo
│   │   │   │   ├── events_repo_implem.dart
│   │   ├── domain
│   │   │   ├── entities
│   │   │   │   ├── event_category_entity.dart
│   │   │   │   ├── event_entity.dart
│   │   │   │   ├── speaker_entity.dart
│   │   │   ├── repo
│   │   │   │   ├── events_repo.dart
│   │   │   ├── usecases
│   │   │   │   ├── get_events_categories_use_case.dart
│   │   │   │   ├── get_events_use_case.dart
│   │   │   │   ├── get_speakers_use_case.dart
│   │   │   │   ├── search_events_use_case.dart
│   │   ├── presentation
│   │   │   ├── managers
│   │   │   │   ├── events_categories_cubit
│   │   │   │   │   ├── events_categories_cubit.dart
│   │   │   │   │   ├── events_ctegories_states.dart
│   │   │   │   ├── events_cubit
│   │   │   │   │   ├── events_cubit.dart
│   │   │   │   │   ├── events_states.dart
│   │   │   │   ├── manage_events
│   │   │   │   │   ├── manage_events_cubit.dart
│   │   │   │   │   ├── manage_events_states.dart
│   │   │   │   ├── speakers_cubit
│   │   │   │   │   ├── speakers_cubit.dart
│   │   │   │   │   ├── speakers_states.dart
│   │   │   ├── presentation_models
│   │   │   │   ├── default_home_tab.dart
│   │   │   │   ├── home_tab_model.dart
│   │   │   ├── widgets
│   │   │   │   ├── home_screen_tabs
│   │   │   │   │   ├── calendar_tab.dart
│   │   │   │   │   ├── main_tab.dart
│   │   │   │   │   ├── tabs_list.dart
│   │   │   │   │   ├── timeline_tab.dart
│   │   │   │   ├── body_of_event_screen.dart
│   │   │   │   ├── events_calendar.dart
│   │   │   │   ├── events_list_view.dart
│   │   │   │   ├── event_details.dart
│   │   │   │   ├── event_time_bar.dart
│   │   │   │   ├── event_widget.dart
│   │   │   │   ├── filter_chips_states.dart
│   │   │   │   ├── one_filter_chip.dart
│   │   │   │   ├── re_login_dialog.dart
│   │   │   │   ├── speakers_section.dart
│   │   │   │   ├── speaker_widget.dart
│   │   │   │   ├── tff_search_events.dart
│   │   │   │   ├── timeline_date_header.dart
│   │   │   │   ├── timeline_event_card.dart
│   │   │   │   ├── top_user_msg_fav_screen.dart
│   │   │   ├── event_screen.dart
│   │   │   ├── home_screen.dart
│   ├── profile
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   ├── firestore_profile_data_source.dart
│   │   │   │   ├── main_profile_data_source.dart
│   │   │   ├── repo
│   │   │   │   ├── profile_repo_implem.dart
│   │   ├── domain
│   │   │   ├── repo
│   │   │   │   ├── profile_repo.dart
│   │   │   ├── use_cases
│   │   │   │   ├── update_user_data_use_case.dart
│   │   ├── presentation
│   │   │   ├── manager
│   │   │   │   ├── profile_bloc
│   │   │   │   │   ├── profile_bloc.dart
│   │   │   │   │   ├── profile_events.dart
│   │   │   │   │   ├── profile_states.dart
│   │   │   ├── widgets
│   │   │   │   ├── bob_items
│   │   │   │   │   ├── babs_component_big_user_card.dart
│   │   │   │   │   ├── babs_component_settings_group.dart
│   │   │   │   │   ├── babs_component_settings_item.dart
│   │   │   │   │   ├── babs_component_simple_user_card.dart
│   │   │   │   │   ├── babs_component_small_user_card.dart
│   │   │   │   │   ├── icon_style.dart
│   │   │   │   │   ├── settings_screen_utils.dart
│   │   │   │   ├── dialogs
│   │   │   │   │   ├── avatar_generator_dialog.dart
│   │   │   │   │   ├── change_language_dialog.dart
│   │   │   │   │   ├── change_password_dialog.dart
│   │   │   │   │   ├── edit_personal_info_dialog.dart
│   │   │   │   │   ├── notifications_settings_dialog.dart
│   │   │   │   ├── app_prefrences.dart
│   │   │   │   ├── notifications_settings.dart
│   │   │   │   ├── personal_info.dart
│   │   │   │   ├── profile_big_card.dart
│   │   │   ├── profile_screen.dart
│   ├── support
│   │   ├── data
│   │   │   ├── data_source
│   │   │   │   ├── firestore_support_data_source.dart
│   │   │   │   ├── main_support_data_source.dart
│   │   │   ├── mapper
│   │   │   │   ├── user_msg_mapper.dart
│   │   │   ├── model
│   │   │   │   ├── user_msg_model.dart
│   │   │   ├── repo
│   │   │   │   ├── support_repo_implem.dart
│   │   ├── domain
│   │   │   ├── entities
│   │   │   │   ├── user_msg_entity.dart
│   │   │   ├── repo
│   │   │   │   ├── support_repo.dart
│   │   │   ├── use_case
│   │   │   │   ├── submit_user_msg_use_case.dart
│   │   ├── presentation
│   │   │   ├── manager
│   │   │   │   ├── support_cubit.dart
│   │   │   │   ├── support_states.dart
│   │   │   ├── views
│   │   │   │   ├── widgets
│   │   │   │   │   ├── build_info_row.dart
│   │   │   │   │   ├── main_support_body.dart
│   │   │   │   │   ├── message_form.dart
│   │   │   │   │   ├── support_list_tile.dart
│   │   │   │   │   ├── user_info_section.dart
│   │   │   │   ├── contact_us_screen.dart
│   │   │   │   ├── main_support_screen.dart
├── app.dart
├── firebase_options.dart
├── main.dart

### Core Features and Implementation Example

## Authentication
#Presentation Layer
- Widgets:

auth_screen.dart: Main authentication screen.

login_body.dart and signup_body.dart: UI for login and signup forms.

my_tff_password.dart: Custom password text field with visibility toggle.

- State Management:

Bloc: auth_bloc.dart manages authentication states (e.g., loading, success, failure).

Events: auth_event.dart defines actions like LoginEvent and SignupEvent.

States: auth_state.dart defines states like AuthLoading, AuthSuccess, and AuthFailure.

# Domain Layer
- Entities:

user_entity.dart: Represents the user entity with properties like id, email, and firstName.

- Use Cases:

login_usecase.dart: Handles the login logic.

signup_usecase.dart: Handles the signup logic.

forget_password_usecase.dart: Handles password reset logic.

- Repositories:

auth_repo.dart: Abstract class defining the contract for authentication operations.

# Data Layer
- Repositories:

auth_repo_implem.dart: Implements auth_repo.dart using Firebase Authentication.

- Data Sources:

firebase_auth_repo.dart: Handles Firebase Authentication API calls.

- Mappers:

user_mapper.dart: Converts between UserEntity and UserModel.

### 📩 Contact
🚀 Created by: Karim Elabasy
📧 Email: karim33elabasy@gmail.com

