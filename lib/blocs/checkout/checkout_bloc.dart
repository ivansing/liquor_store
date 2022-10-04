import 'dart:async';


import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/payment_method_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final PaymentBloc _paymentBloc;
  final CheckoutRepository _checkoutRepository;

  // Listeners
  StreamSubscription? _cartSubscription;
  StreamSubscription? _paymentSubscription;
  StreamSubscription? _checkoutSubscription;

  // Constructor
  CheckoutBloc({
    required CartBloc cartBloc,
    required PaymentBloc paymentBloc,
    required CheckoutRepository checkoutRepository,

        // Inputs
  })  : _cartBloc = cartBloc,
       _paymentBloc = paymentBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoaded
              ? CheckoutLoaded(
                  products: (cartBloc.state as CartLoaded).cart.products,
                  deliveryFee:
                      (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                  subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                  total: (cartBloc.state as CartLoaded).cart.totalString,
                )
              : CheckoutLoading(),
        ) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);

    _cartSubscription = _cartBloc.stream.listen(
      (state) {
        if (state is CartLoaded)
          add(
            UpdateCheckout(cart: state.cart),
          );
      },
    );

    // Check state of the payment bloc
    _paymentSubscription = _paymentBloc.stream.listen((state) {
      if (state is PaymentLoaded) {
        add(
          UpdateCheckout(paymentMethod: state.paymentMethod),
        );
      }
     });
  }

  void _onUpdateCheckout(
    UpdateCheckout event,
    Emitter<CheckoutState> emit,
  ) {
    if (state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;
      emit(
        CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          subtotal: event.cart?.subtotalString ?? state.subtotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          paymentMethod: event.paymentMethod ?? state.paymentMethod,
        ),
      );
    }
  }

  void _onConfirmCheckout(
    ConfirmCheckout event,
    Emitter<CheckoutState> emit,
  ) async {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('Hecho');
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
