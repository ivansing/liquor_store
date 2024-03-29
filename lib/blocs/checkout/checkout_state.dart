part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final User? user;
 /*  final String? fullName;
  final String? email;
  final String? address;
  final String? city; */
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final Checkout checkout;
  final PaymentMethod paymentMethod;

  CheckoutLoaded({
    /* this.fullName,
    this.email,
    this.address,
    this.city, */
    this.user,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.paymentMethod = PaymentMethod.credit_card,
  }) : checkout = Checkout(
          /* fullName: fullName,
          email: email,
          address: address,
          city: city, */
          user: user,
          products: products,
          subtotal: subtotal,
          deliveryFee: deliveryFee,
          total: total,
          
        );

  @override
  List<Object?> get props => [
        /* fullName,
        email,
        address,
        city, */
        user,
        products,
        subtotal,
        deliveryFee,
        total,
        paymentMethod,
      ];
}
