part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final User? user;
 /*  final String? fullName;
  final String? email;
  final String? address;
  final String? city; */
  final Cart? cart;
  final PaymentMethod? paymentMethod;

  const UpdateCheckout({
    this.user,
    /* this.fullName,
    this.email,
    this.address,
    this.city, */
    this.cart,
    this.paymentMethod,
  });

  @override
  List<Object?> get props => [
     
       /*  fullName,
        email,
        address,
        city, */
        user,
        cart,
        paymentMethod,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmCheckout({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
