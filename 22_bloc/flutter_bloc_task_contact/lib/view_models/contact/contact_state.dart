part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  final List<Contact> contacts;
  const ContactState(this.contacts);

  @override
  List<Object> get props => [contacts];
}

class Initial extends ContactState {
  const Initial(super.contacts);
}

class Loading extends ContactState {
  const Loading(super.contacts);
}

class Loaded extends ContactState {
  const Loaded(super.contacts);
}

class Failed extends ContactState {
  const Failed(super.contacts);
}
