# SRP HRMate – Human Resource Management System

A Flutter-based Human Resource Management System (HRMS) designed to manage companies, employees, attendance, and leave requests. The system supports multi-company management with role-based access control and provides two-way synchronization between Firebase and ERPNext.

This project was developed at SRP Global LLC.

## Features

The application supports three types of users:

- Super Admin
- Company Admin
- Employee

### Super Admin
- Create and manage companies
- Create departments
- View and edit company information
- Enable or disable services for specific companies
- Create employees for specific companies

### Company Admin
- Create and manage employees
- Create work shifts
- View employee records
- View attendance using filters (date range and specific employee)
- Approve or reject leave requests
- Mark employee attendance
- Assign admin role to employees
- Disable employee login access

### Employee
- Mark daily attendance
- View attendance history using date filters
- Request leave
- View leave status

## ERPNext Integration

The system integrates with ERPNext using Node.js backend APIs and Firebase.

Implemented APIs:
- Company API (CRUD)
- Employee API (CRUD)
- Attendance API (CRUD)

These APIs enable two-way synchronization between ERPNext and Firebase.

## Tech Stack

- Flutter
- Dart
- Firebase
- Node.js
- ERPNext

## Architecture

Flutter Mobile App  
→ Firebase  
→ Node.js APIs  
→ ERPNext

## My Contribution

- Developed the Flutter mobile application
- Implemented role-based panels (Super Admin, Company Admin, Employee)
- Built attendance and leave management features
- Integrated Firebase with ERPNext using Node.js APIs
- Designed company and employee management workflows
