# Liquor Store

Liquor Store is an online platform designed for the Colombian market, allowing users to purchase liquor products with a seamless shopping experience. The app features a user-friendly interface, multiple payment methods, and a secure authentication system.

> This is liquor store app to sell online made for colombian market.
> Live demo  [_here_](https://ivansing.github.io/liquor_store/)

## Table of Contents
- [General Information](#general-information)
- [Features](#features)
- [Screenshots](#screenshots)
- [Technologies Used](#technologies-used)
- [Setup](#setup)
- [Usage](#usage)
- [API Reference](#api-reference)
- [Project Structure](#project-structure)
- [Future Improvements](#future-improvements)
- [License](#license)
- [Contact](#contact)

## General Information
The **Liquor Store** app enables users to browse and purchase a wide range of liquor products. It includes features such as category-based browsing, product search, a shopping cart, and checkout. Users can sign up or log in with an email and password or through Google authentication. The backend admin panel, built with React and Firebase Firestore, allows store managers to handle inventory, orders, and user management.

## Features
- **User Authentication:** Register and log in with email/password or Google account.
- **Product Browsing:** View liquor products categorized by type and brand.
- **Shopping Cart:** Add products to the cart and proceed to checkout.
- **Payment Integration:** Sample payment methods for demonstration purposes.
- **Order Management:** View order summaries and track purchases.
- **Admin Panel:** Manage products, categories, and user data (accessible to admins).

## Screenshots
![Home Screen](https://path/to/home_screen_screenshot.png)
![Product Page](https://path/to/product_page_screenshot.png)
![Checkout](https://path/to/checkout_screenshot.png)

## Technologies Used

### Frontend:

- **Flutter:** Cross-platform UI toolkit.
- **Bloc/Cubit:** State management.
- **Firebase Firestore:** Real-time database for storing user and product data.

### Backend:
- **React:** Admin panel interface.
- **Firebase Firestore:** Database for admin operations and user management.

## Setup
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/liquor_store.git

## Navigate to the Project Directory:

2. 
```bash
cd liquor_store
```

3. Install Dependencies:

```bash
flutter pub get
```

4. Run the App:
```bash
flutter run
```

## Usage

- **Launch the App:** The app can be launched on any iOS or Android device using the Flutter framework.
- **Admin Panel:** Access the admin panel through the provided URL to manage store operations.

## Api Reference

- **Firebase Auth API:** Used for user authentication.
- **Firebase Firestore API:** Handles CRUD operations for products, categories, and orders.

## Project Structure

```bash
Liquor Store/
├── lib/
│   ├── app/
│   ├── blocs/
│   ├── cubit/
│   ├── models/
│   ├── repositories/
│   ├── screens/
│   ├── widgets/
│   └── utils/
├── assets/
├── test/
├── web/
├── pubspec.yaml
├── README.md
└── ...
```

## Future Improvements

- **Enhanced Payment Integration:** Add real payment gateways (e.g., Stripe, PayPal).
- **Push Notifications:** Implement notifications for order updates.
- **Localization:** Support for multiple languages, starting with Spanish.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

Created by Ivansing - feel free to contact me!


