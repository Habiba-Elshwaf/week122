import 'contact.dart';
class ContactManager {
  List<Contact> contacts = [];

  void addContact(Contact contact) {
    contacts.add(contact);
  }

  List<Contact> searchContacts(String query) {
    return contacts
        .where((contact) => contact.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void editContact(int index, Contact updatedContact) {
    if (index >= 0 && index < contacts.length) {
      contacts[index] = updatedContact;
    } else {
      print("Invalid contact index.");
    }
  }

  void viewAllContacts() {
    if (contacts.isEmpty) {
      print("No contacts available.");
    } else {
      for (int i = 0; i < contacts.length; i++) {
        print("Contact $i:");
        print(contacts[i]);
        print("\n");
      }
    }
  }

  void deleteContact(int index) {
    if (index >= 0 && index < contacts.length) {
      contacts.removeAt(index);
      print("Contact deleted successfully.");
    } else {
      print("Invalid contact index.");
    }
  }
}



