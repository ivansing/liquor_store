

import 'package:ecommerce_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistToState();
    } else if (event is AddtWishlistProduct) {
      yield* _mapAddWishlistProductToState(event, state);
    } else if (event is RemovetWishlistProduct) {
      yield* _mapRemoveWishlistProductToState(event, state);
    }
  }  

    Stream<WishlistState> _mapStartWishlistToState() async* {
      yield WishlistLoading();
      try {
        await Future<void>.delayed(Duration(seconds: 1));
        yield const WishlistLoaded();
      } catch (_) {}
    }

    Stream<WishlistState> _mapAddWishlistProductToState(
      AddtWishlistProduct event,
      WishlistState state,
    ) async* {
      if (state is WishlistLoaded) {
        try {
          yield WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          );
        } catch (_) {}
      }
    }
  }

  Stream<WishlistState> _mapRemoveWishlistProductToState(
    RemovetWishlistProduct event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        );
      } catch (_) {}
    }
  }

