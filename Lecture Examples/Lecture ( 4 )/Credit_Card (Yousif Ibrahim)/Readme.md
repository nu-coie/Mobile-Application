# Plan App – Changes Suggested by Yousif Ibrahim 

A user-friendly Flutter-based application designed to manage Plans efficiently and securely.

This section highlights the key change proposed by Yousif Ibrahim to enhance the functionality and user experience of the app. His improvement focuses on making a specific section of the UI scrollable while keeping the rest of the content static.

Yousif suggested introducing a scrollable area specifically for the list of Plans , while ensuring that other parts of the UI remain static. This is achieved by wrapping the ListView in a Container with a fixed height of 400. As a result, only the Plan  section becomes scrollable, providing a more structured and focused layout.

## Original Code: 
The entire screen, including the non-plan content, was scrollable since the ListView was used directly within the Scaffold.

## Yousif's Code: 
By containing the ListView within a Container of fixed height, Yousif's idea makes only the plan section scrollable, leaving the rest of the UI (like the header and buttons) static. This provides a cleaner and more intuitive user experience, where only relevant content is scrollable.


 <img width="442" alt="Screenshot 2023-11-03 at 10 36 31 PM" src="https://github.com/user-attachments/assets/1606d631-6e24-4b8d-a454-ae0245bf31ff">
