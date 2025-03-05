# University Students’ Records Management System

## Overview
This project is a **University Students’ Records Management System** developed using **Visual C++** on **Microsoft Visual Studio**. It utilizes **SQL Server** as the backend database and follows a **Multiple Document Interface (MDI)** architecture, allowing seamless management of student, faculty, and administrator records.

## Features
### 1. User Authentication & Authorization
- Secure login system with role-based access control (Students, Faculty, Administrators).
- Password reset and recovery features.

### 2. Student Enrollment & Registration
- Students can search and enroll in courses.
- Faculty can verify student enrollment.

### 3. Academic Records & Grades Management
- Faculty can input, edit, and submit grades.
- Students can view grades and transcripts.
- Administrators can generate and print transcripts.

### 4. Course & Curriculum Management
- Faculty can create and update course materials.
- Admins can manage curricula and prerequisites.
- Support for online course materials and digital classrooms.

## System Requirements
- **Operating System:** Windows 10 or later
- **Development Environment:** Microsoft Visual Studio (with Visual C++)
- **Database:** Microsoft SQL Server
- **Frameworks:** MFC (Microsoft Foundation Classes) for GUI

## Installation & Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/university-records-management.git
   ```
2. Open the project in **Microsoft Visual Studio**.
3. Set up the database in **SQL Server** and update the connection string in the project.
4. Build and run the application.

## Class Structure
- **User (Abstract Class)**
  - `userID, firstName, lastName, email, password`
  - Methods: `login(), logout()`
- **Student (inherits User)**
  - `studentID, dateOfBirth, major, enrollmentDate`
  - Methods: `enrollInCourse(), viewGrades()`
- **Faculty (inherits User)**
  - `facultyID, department, listOfTeachingCourses`
  - Methods: `enterGrades(), viewRoster()`
- **Course**
  - `courseID, courseName, credits, schedule`
  - Methods: `assignFaculty(), registerStudent()`

## Contributors
- **Beatrice Abraham**
- **[Other Contributors]**

## License
This project is licensed under the **MIT License**.

## Contact
For any inquiries or contributions, feel free to reach out at **your-email@example.com**.
