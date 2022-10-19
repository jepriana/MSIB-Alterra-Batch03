part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class SaveContact extends ContactEvent {
  final Contact contact;
  const SaveContact(this.contact);
}

class UpdateContact extends ContactEvent {
  final Contact contact;
  const UpdateContact(this.contact);
}

class DeleteContact extends ContactEvent {
  final String id;
  const DeleteContact(this.id);
}

class Reload extends ContactEvent {}
