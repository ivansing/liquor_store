#  Architecture Documentation

## Overview

This Flutter e-commerce application follows **Clean Architecture** principles with the **BLoC pattern** for state management. The architecture ensures separation of concerns, testability, and maintainability while providing a scalable foundation for enterprise-level mobile applications.

##  Architecture Principles

### **Clean Architecture Layers**

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                       │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐ │
│  │   Screens   │  │   Widgets   │  │    BLoC/Cubit       │ │
│  │             │  │             │  │                     │ │
│  │ - UI Logic  │  │ - Reusable  │  │ - State Management  │ │
│  │ - User      │  │   Components│  │ - Business Logic    │ │
│  │   Input     │  │ - Custom    │  │ - Event Handling    │ │
│  │             │  │   Widgets   │  │                     │ │
│  └─────────────┘  └─────────────┘  └─────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────┐
│                     BUSINESS LAYER                          │
│  ┌─────────────────────────────────────────────────────────┐ │
│  │              Repository Abstractions                    │ │
│  │                                                         │ │
│  │ - Abstract Interfaces                                   │ │
│  │ - Business Rules                                        │ │
│  │ - Domain Models                                         │ │
│  │ - Use Cases                                             │ │
│  └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────┐
│                      DATA LAYER                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐ │
│  │  Firebase   │  │    Hive     │  │   Future APIs       │ │
│  │  Firestore  │  │ Local Storage│  │                     │ │
│  │             │  │             │  │ - REST APIs         │ │
│  │ - Auth      │  │ - Cart Data │  │ - Payment Gateways  │ │
│  │ - Products  │  │ - Wishlist  │  │ - Third-party       │ │
│  │ - Users     │  │ - Cache     │  │   Services          │ │
│  │ - Orders    │  │             │  │                     │ │
│  └─────────────┘  └─────────────┘  └─────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

##  State Management Architecture

### **BLoC Pattern Implementation**

The application uses **flutter_bloc** for state management with a clear separation between BLoCs and Cubits:

#### **BLoC vs Cubit Usage**
- **BLoCs**: Complex business logic with multiple event types
- **Cubits**: Simple state changes with direct method calls

```dart
// BLoC Example: Complex Cart Management
class CartBloc extends Bloc<CartEvent, CartState> {
  // Handles multiple events: AddProduct, RemoveProduct, UpdateQuantity, etc.
}

// Cubit Example: Simple Form State
class LoginCubit extends Cubit<LoginState> {
  // Direct methods: updateEmail(), updatePassword(), login()
}
```

### **State Flow Architecture**

```
User Interaction → Widget → BLoC Event → Repository → Data Source
                                ↓
UI Update ← Widget ← BLoC State ← Repository ← Data Response
```

### **BLoC Structure**

```
blocs/
├── auth/
│   ├── auth_bloc.dart          # Authentication logic
│   ├── auth_event.dart         # Authentication events
│   └── auth_state.dart         # Authentication states
├── cart/
│   ├── cart_bloc.dart          # Shopping cart management
│   ├── cart_event.dart         # Cart events (Add, Remove, Update)
│   └── cart_state.dart         # Cart states (Loading, Loaded, Error)
├── checkout/
│   ├── checkout_bloc.dart      # Checkout process coordination
│   ├── checkout_event.dart     # Checkout events
│   └── checkout_state.dart     # Checkout states
└── [other feature blocs...]
```

## 🗄️ Repository Pattern

### **Data Access Abstraction**

Each data domain has two layers:
1. **Base Repository** (Abstract Interface)
2. **Concrete Repository** (Implementation)

```dart
// Abstract Interface
abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
  Future<Product> getProduct(String productId);
  Future<void> addProduct(Product product);
}

// Concrete Implementation
class ProductRepository extends BaseProductRepository {
  @override
  Stream<List<Product>> getAllProducts() {
    // Firebase Firestore implementation
  }
}
```

### **Repository Structure**

```
repositories/
├── auth/
│   ├── base_auth_repository.dart       # Authentication interface
│   └── auth_repository.dart           # Firebase Auth implementation
├── product/
│   ├── base_product_repository.dart   # Product data interface
│   └── product_repository.dart        # Firestore implementation
├── local_storage/
│   ├── base_local_storage_repository.dart  # Local storage interface
│   └── local_storage_repository.dart       # Hive implementation
└── [other repositories...]
```

##  Dependency Injection

### **Provider Setup**

The application uses **flutter_bloc's** repository and bloc providers for dependency injection:

```dart
MultiRepositoryProvider(
  providers: [
    RepositoryProvider(create: (context) => UserRepository()),
    RepositoryProvider(create: (context) => AuthRepository()),
    // Other repositories...
  ],
  child: MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthBloc(
        authRepository: context.read<AuthRepository>(),
      )),
      // Other BLoCs...
    ],
    child: MyApp(),
  ),
)
```

### **Dependency Flow**

```
App Root
├── Repositories (Data Layer)
│   ├── UserRepository
│   ├── AuthRepository
│   └── ProductRepository
└── BLoCs (Business Layer)
    ├── AuthBloc (depends on AuthRepository)
    ├── CartBloc (standalone)
    └── CheckoutBloc (depends on AuthBloc, CartBloc)
```

##  Presentation Layer Architecture

### **Screen Structure**

Each screen follows a consistent pattern:

```dart
class ExampleScreen extends StatelessWidget {
  static const String routeName = '/example';
  
  static Route route() => MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_) => ExampleScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleBloc, ExampleState>(
      builder: (context, state) {
        // UI rendering based on state
      },
    );
  }
}
```

### **Widget Composition**

```
screens/
├── home/
│   └── home_screen.dart            # Main screen container
├── product/
│   └── product_screen.dart         # Product detail screen
└── [other screens...]

widgets/
├── custom_appbar.dart              # Reusable app bar
├── product_card.dart               # Product display component
├── custom_button.dart              # Styled buttons
└── [other reusable widgets...]
```

##  Firebase Integration Architecture

### **Firebase Services Structure**

```
Firebase Project
├── Authentication
│   ├── Email/Password
│   └── Google Sign-In
├── Firestore Database
│   ├── users/                      # User profiles
│   ├── products/                   # Product catalog
│   ├── categories/                 # Product categories
│   ├── carts/                      # Shopping carts
│   └── orders/                     # Purchase orders
└── Storage (for images)
    ├── products/                   # Product images
    └── users/                      # Profile images
```

### **Firestore Data Flow**

```
BLoC → Repository → Firestore Service → Cloud Firestore
  ↑                                           ↓
UI ← State Update ← Stream/Future ← Real-time Updates
```

##  Local Storage Architecture

### **Hive Implementation**

Local storage uses **Hive** for offline capabilities and caching:

```dart
// Model Adapter Generation
@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  String name;
  // Other fields...
}
```

### **Storage Strategy**

```
Local Storage (Hive)
├── Cart Data                       # Persistent shopping cart
├── Wishlist                       # Saved products
├── User Preferences               # App settings
└── Cached Products               # Offline browsing
```

##  Testing Architecture

### **Testing Strategy**

The architecture supports comprehensive testing:

```
test/
├── unit/
│   ├── blocs/                     # BLoC unit tests
│   ├── repositories/              # Repository unit tests
│   └── models/                    # Model unit tests
├── widget/
│   ├── screens/                   # Screen widget tests
│   └── widgets/                   # Component widget tests
└── integration/
    └── app_test.dart              # End-to-end tests
```

##  Configuration Architecture

### **App Configuration**

```
config/
├── app_router.dart                # Navigation configuration
├── auth_route.dart               # Authentication routing
└── theme.dart                    # UI theme configuration
```

### **Environment Configuration**

```
Environment Variables
├── Firebase Configuration
│   ├── API Keys
│   ├── Project IDs
│   └── Database URLs
├── Payment Configuration
│   ├── Stripe Keys
│   └── PayPal Configuration
└── Feature Flags
    ├── Debug Mode
    └── Analytics Enabled
```

##  Performance Architecture

### **Optimization Strategies**

1. **State Management Optimization**
   - BLoC event debouncing
   - State caching
   - Selective rebuilds with BlocBuilder

2. **Data Loading**
   - Lazy loading for product lists
   - Image caching
   - Offline-first approach

3. **Memory Management**
   - Proper BLoC disposal
   - Stream subscription management
   - Widget lifecycle optimization

### **Caching Strategy**

```
Cache Layers
├── Memory Cache (BLoC States)
├── Local Cache (Hive)
└── Network Cache (Firebase)
```

##  Security Architecture

### **Security Layers**

1. **Authentication Security**
   - Firebase Auth integration
   - Token-based authentication
   - Secure session management

2. **Data Security**
   - Firestore security rules
   - Local data encryption (Hive)
   - Input validation

3. **Network Security**
   - HTTPS enforcement
   - Certificate pinning (future)
   - API key protection

##  Scalability Considerations

### **Horizontal Scaling**

The architecture supports easy feature additions:

```
New Feature Addition
├── Create Models
├── Define Repository Interface
├── Implement Repository
├── Create BLoC
├── Build UI Screens
└── Add Navigation Routes
```

### **Vertical Scaling**

- **Microservices Ready**: Repository pattern allows easy API integration
- **Multi-platform**: Same business logic across platforms
- **Feature Toggles**: Easy feature enabling/disabling

##  Development Workflow

### **Architecture Guidelines**

1. **New Feature Development**
   - Start with models and repositories
   - Implement BLoC for state management
   - Build UI components
   - Add navigation and routing

2. **Code Organization**
   - Follow feature-based folder structure
   - Maintain separation of concerns
   - Use consistent naming conventions

3. **Best Practices**
   - Always use repository abstractions
   - Keep BLoCs focused on single responsibility
   - Minimize widget rebuilds
   - Handle all error states

This architecture provides a solid foundation for enterprise-level Flutter applications with excellent maintainability, testability, and scalability.
