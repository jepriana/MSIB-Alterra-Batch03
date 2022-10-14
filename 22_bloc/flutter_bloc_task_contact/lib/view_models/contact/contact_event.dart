part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  final Contact contact;
  const ContactEvent(this.contact);

  @override
  List<Object> get props => [contact];
}

class SaveContact extends ContactEvent {
  const SaveContact(super.contact);
}

class UpdateContact extends ContactEvent {
  const UpdateContact(super.contact);
}

class DeleteContact extends ContactEvent {
  const DeleteContact(super.contact);
}
