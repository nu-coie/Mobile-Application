# 🚀 Flutter Profile App 🌟

This project demonstrates how to build a simple profile page using various Flutter widgets. Below is an overview of the key components used in the app.

This app is the **first part** of the design found [here on Dribbble](https://dribbble.com/shots/24880977-PinSpace-Social-Network-Mobile-App). In the next lectures, we will continue building and complete the remaining parts of the social network mobile app design.

## Widgets Overview

### 1. **MaterialApp**

   The `MaterialApp` widget is the root of the app. It wraps the entire application and provides top-level configuration for the app, such as theme, routes, and more.

### 2. **Scaffold**

   The `Scaffold` widget provides a basic layout structure for the app, including components such as `AppBar`, `Body`, and `FloatingActionButton`. It serves as the backbone of the app's interface.

### 3. **SafeArea**

   The `SafeArea` widget ensures that the content is rendered within the visible bounds of the device's screen, avoiding areas like the notch, status bar, or navigation buttons.

### 4. **Padding**

   The `Padding` widget adds space around its child widget. In this case, `EdgeInsets.only(left: 12, right: 12)` applies padding on the left and right of the `Column`.

### 5. **Column**

   The `Column` widget arranges its children in a vertical layout. In this example, the `Column` contains several widgets, such as `Row`, `CircleAvatar`, and `Text`, to structure the content vertically.

### 6. **Row**

   The `Row` widget arranges its children in a horizontal layout. The first `Row` contains two `CircleAvatar` widgets with icons for settings and alerts, placed on either side using `mainAxisAlignment: MainAxisAlignment.spaceBetween`.

### 7. **CircleAvatar**

   The `CircleAvatar` widget is used to display circular profile images or icons. In this case, it's used for both displaying profile images and icons, such as settings and alerts.

### 8. **Text**

   The `Text` widget is used to display strings of text. Various styles are applied, such as font size, color, and weight, to differentiate between headings like "First Name" and "Followers."

### 9. **Container**

   The `Container` widget provides layout, decoration, and padding properties. It is used here to group the text showing the number of followers, posts, likes, and views. Each `Container` is decorated with padding and rounded corners.

### 10. **BoxDecoration**

   The `BoxDecoration` widget is applied to the `Container` to define the appearance of the containers displaying user statistics. It includes properties like `borderRadius` to create rounded corners and background color.

### 11. **SizedBox**

   The `SizedBox` widget is used to add spacing between widgets. For example, it adds space between the profile section and the user statistics section.

### 12. **MainAxisAlignment.spaceBetween**

   This alignment property is applied to both `Row` and `Column` widgets to distribute space between child elements, creating balanced layouts in both directions.

### 13. **Icons**

   The `Icons` class provides pre-made material design icons. Icons like `settings` and `add_alert_sharp` are used to visually enhance the app.

### 14. **EdgeInsets**

   The `EdgeInsets` class is used to define custom padding within the app. It controls the space around elements, providing consistency in layout.

### 15. **TextStyle**

   The `TextStyle` widget is used to customize the appearance of text, including properties like `fontWeight`, `fontSize`, `fontFamily`, and `color`.

## Getting Started
<img width="478" alt="Screenshot 2024-10-08 at 6 48 46 PM" src="https://github.com/user-attachments/assets/87b70f41-d5ad-4063-94d1-0890afd17781">