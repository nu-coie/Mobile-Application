# Profile App 🚀👤

> **⚠️ NOTE: This version is a draft. In the next lecture, we will improve the app's flow, enhance the code quality (clean code)!**

---

A Flutter-based application that enables users to register, log in, and manage their profiles securely with Firebase integration.

## Features

- **User Authentication**: Secure registration, login, and logout functionality using Firebase Authentication.
- **Profile Management**: Allows users to view, edit, and update their personal information.
- **Cross-Platform Compatibility**: Optimized for both Android and iOS with a consistent and intuitive user interface.
- **Firebase Integration**: Seamless integration with Firebase for real-time data storage and user authentication.
- **Error Handling**: Robust validation for user inputs and graceful handling of errors during authentication or profile updates.
- **Navigation**: Smooth and responsive navigation across multiple app screens.

## Widgets and Functionalities

The app utilizes Flutter's powerful widget system and external packages to create a robust and user-friendly experience:

### **Widgets Used**

1. **MaterialApp**
   - Provides theming and navigational structure for the app.

2. **TextFormField**
   - Used for collecting and validating user inputs like email and password.

3. **StreamBuilder**
   - Efficiently monitors authentication states and updates the UI accordingly.

4. **FutureBuilder**
   - Handles asynchronous Firebase data fetches, ensuring responsive UI updates.

5. **Scaffold**
   - Provides a consistent visual structure for each screen.

6. **ListTile**
   - Displays user profile information in a clean, organized layout.

7. **ElevatedButton**
   - Enhances interactivity for actions like login, registration, and saving updates.

### **Screens Included**

1. **Welcome Screen**
   - Provides an overview and entry point to the app.

2. **Login Screen**
   - Enables users to log in securely with Firebase Authentication.

3. **Registration Screen**
   - Allows new users to create an account.

4. **Profile Page**
   - Displays the user's profile with options to edit their information.

5. **Edit Profile Screen**
   - Facilitates real-time editing of user details with live validation.


## Firebase Integration

- **Firebase Authentication**: Handles secure user sign-in and registration processes.
- **Firebase Realtime Database**: Stores and retrieves user data in real time.

