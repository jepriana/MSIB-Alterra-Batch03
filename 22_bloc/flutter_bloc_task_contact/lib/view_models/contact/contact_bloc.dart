import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_task_contact/models/contact.dart';
import 'package:collection/collection.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const Initial([])) {
    on<SaveContact>((event, emit) async {
      // SET STATE LOADING
      emit(Loading(state.contacts));
      await Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
      // CHECK DUPLIKASI CONTACT
      final existingContact = state.contacts
          .firstWhereOrNull((element) => element.phone == event.contact.phone);

      // TIDAK ADA DIPLIKASI => SIMPAN DATA CONTACT => SET STATE LOADED
      if (existingContact == null) {
        var existingContacts = [...state.contacts];
        existingContacts.add(event.contact);
        emit(Loaded(existingContacts));
      }
      // ADA DUPLIKASI SET STATE FAILED
      else {
        emit(Failed(state.contacts));
      }
    });
    on<Reload>(
      (event, emit) async {
        emit(Loading(state.contacts));
        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
        emit(Loaded(state.contacts));
      },
    );
    on<UpdateContact>(
      (event, emit) async {
        emit(Loading(state.contacts));
        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
        final existingContactIndex = state.contacts
            .indexWhere((element) => element.id == event.contact.id);

        if (existingContactIndex != -1) {
          var existingContacts = [...state.contacts];
          existingContacts[existingContactIndex] = event.contact;
          emit(Loaded(existingContacts));
        } else {
          emit(Failed(state.contacts));
        }
      },
    );
    on<DeleteContact>(
      (event, emit) async {
        emit(Loading(state.contacts));
        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
        final existingContactIndex =
            state.contacts.indexWhere((element) => element.id == event.id);

        if (existingContactIndex != -1) {
          var existingContacts = [...state.contacts];
          existingContacts.removeAt(existingContactIndex);
          emit(Loaded(existingContacts));
        } else {
          emit(Failed(state.contacts));
        }
      },
    );
  }
}
