import 'contactmanager.dart';
import 'dart:io';
import 'contact.dart';
void main() {
  ContactManager contactManager = ContactManager();

  while (true) {
    print("\nContact Management System");
    print("1. Add New Contact");
    print("2. Search Contacts");
    print("3. Edit Contact");
    print("4. View All Contacts");
    print("5. Delete Contact");
    print("6. Exit");
    print("Enter your choice: ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        print("Enter contact details:");
        print("Name: ");
        String name = stdin.readLineSync()!;
        print("Email: ");
        String email = stdin.readLineSync()!;
        print("Address: ");
        String address = stdin.readLineSync()!;
        print("Date of Birth (yyyy-mm-dd): ");
        String dobString = stdin.readLineSync()!;
        DateTime dob = DateTime.parse(dobString);
        print("Phone Number: ");
        String phoneNumber = stdin.readLineSync()!;

        Contact newContact = Contact(
          name: name,
          email: email,
          address: address,
          dob: dob,
          phoneNumber: phoneNumber,
        );

        contactManager.addContact(newContact);
        print("Contact added successfully.");
        break;
      case '2':
        print("Enter search query: ");
        String query = stdin.readLineSync()!;
        List<Contact> results = contactManager.searchContacts(query);

        if (results.isEmpty) {
          print("No matching contacts found.");
        } else {
          print("Matching contacts:");
          for (int i = 0; i < results.length; i++) {
            print("Contact $i:");
            print(results[i]);
            print("\n");
          }
        }
        break;
      case '3':
        print("Enter index of contact to edit: ");
        int index = int.parse(stdin.readLineSync()!);

        if (index >= 0 && index < contactManager.contacts.length) {
          print("Enter new contact details:");
          print("Name: ");
          String name = stdin.readLineSync()!;
          print("Email: ");
          String email = stdin.readLineSync()!;
          print("Address: ");
          String address = stdin.readLineSync()!;
          print("Date of Birth (yyyy-mm-dd): ");
          String dobString = stdin.readLineSync()!;
          DateTime dob = DateTime.parse(dobString);
          print("Phone Number: ");
          String phoneNumber = stdin.readLineSync()!;

          Contact updatedContact = Contact(
            name: name,
            email: email,
            address: address,
            dob: dob,
            phoneNumber: phoneNumber,
          );

          contactManager.editContact(index, updatedContact);
          print("Contact updated successfully.");
        } else {
          print("Invalid contact index.");
        }
        break;
      case '4':
        contactManager.viewAllContacts();
        break;
      case '5':
        print("Enter index of contact to delete: ");
        int index = int.parse(stdin.readLineSync()!);
        contactManager.deleteContact(index);
        break;
      case '6':
        exit(0);
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

