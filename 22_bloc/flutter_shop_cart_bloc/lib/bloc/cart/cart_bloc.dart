import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shop_cart/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial([])) {
    on<AddProduct>((event, emit) {
      emit(Loading(state.items));
      var existingCart = [...state.items];
      existingCart.add(event.product);
      emit(Loaded(existingCart));
    });
    on<UpdateProduct>((event, emit) {
      emit(Loading(state.items));
      var existingCart = [...state.items];
      final targetIndex =
          existingCart.indexWhere((element) => element.id == event.product.id);
      if (targetIndex != -1) {
        existingCart[targetIndex] = event.product;
        emit(Loaded(existingCart));
      } else {
        emit(Failed(state.items));
      }
    });
    on<DeleteProduct>((event, emit) {
      emit(Loading(state.items));
      var existingCart = [...state.items];
      final targetIndex =
          existingCart.indexWhere((element) => element.id == event.product.id);
      if (targetIndex != -1) {
        existingCart.removeAt(targetIndex);
        emit(Loaded(existingCart));
      } else {
        emit(Failed(state.items));
      }
    });
  }
}
