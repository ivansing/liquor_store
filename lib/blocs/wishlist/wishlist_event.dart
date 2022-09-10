part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class LoadWishList extends WishlistEvent {}

class AddtWishlistProduct extends WishlistEvent {
  final Product product; 

  const AddtWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemovetWishlistProduct extends WishlistEvent {
  final Product product; 

  const RemovetWishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}

