part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  final List<Contact> items;
  const ContactState(this.items);

  @override
  List<Object> get props => [items];
}

class ContactInitial extends ContactState {
  ContactInitial(super.items);
}
