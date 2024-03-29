part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final PaymentMethod paymentMethod;

  const PaymentLoaded({
    this.paymentMethod =  PaymentMethod.credit_card,
  });

  @override
  List<Object> get props => [paymentMethod];
}
