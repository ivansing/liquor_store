

import 'package:ecommerce_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishList>(_onLoadWishlist);
    on<AddtWishlistProduct>(_onAddProductToWishlist);
    on<RemovetWishlistProduct>(_onRemoveProductFromWishlist);
  }

  void _onLoadWishlist(event, Emitter<WishlistState> emit) async {
    emit( WishlistLoading());
      try {
        await Future<void>.delayed(Duration(seconds: 1));
        emit ( WishlistLoaded());
      } catch (_) {
        emit(WishlistError());
      }
  }
  void _onAddProductToWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
        try {
          emit( WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ));
        } on Exception { 
         emit(WishlistError());
      }
     }
  }
  void _onRemoveProductFromWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
        try {
          emit( WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..remove(event.product),
            ),
          ));
        } on Exception { 
         emit(WishlistError());
      }
     }
  }

  

}

