import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_phonebook/models/contact.dart';
import 'package:flutter_phonebook/services/contact_api.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactApi services = ContactApi();
  ContactBloc() : super(ContactInitial([])) {
    on<GetContacts>((event, emit) async {
      final result = await services.getAllContacts();
      emit(ContactInitial(result));
    });
  }
}
