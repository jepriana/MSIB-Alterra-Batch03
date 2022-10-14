import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_task_contact/models/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const Initial([])) {
    on<SaveContact>((event, emit) {
      // TODO: implement event handler
      // SET STATE LOADING

      // SIMPAN DATA CONTACT

      // CHECK ERROR

      // TIDAK ERROR SET STATE LOADED

      // ADA ERROR SET STATE FAILED
    });
  }
}
