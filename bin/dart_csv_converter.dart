import 'dart:io';
import 'packages/xml/xml.dart' as xml;

void main() {
  String path;
  //String fileType;
  String listType;

  //fileType = getFileType();
  path = getPath();
  File file = new File(path);

  listType = getListType();

  switch (listType) {
    case 'b':
      backgrounds(file);
      break;
    case 'c':
      classes(file);
      break;
    case 'f':
      feats(file);
      break;
    case 'i':
      items(file);
      break;
    case 'r':
      races(file);
      break;
    default:
      print("\nI don't know what the hell you're saying to me.");
      //printMenu();
      break;
  }
}

///todo: make this less fucky.
dynamic races(File file) async {
//D:\Google Drive\DnD\dnd_csv_converter\D&D_app_files\Character Files\Races 1.6.1.xml
//D:\Google Drive\DnD\dnd_csv_converter\D&D_app_files\Character Files\Races 1.6.1.xml
  String wholeFile = await file.readAsString();
  xml.XmlDocument document = xml.parse(wholeFile);

//  print('Root.children : ${document.children}');
//  document.children.forEach((xml.XmlNode node) {
//    node.children.forEach((xml.XmlNode race){
//      race.children.forEach((xml.XmlNode property){
////        print('$property');
//        property.attributes.forEach((xml.XmlAttribute att) {
//          print('$property');
//        });
//      });
//    });
//  });
//  document.children[1].children[1].children.forEach((xml.XmlNode node) {
//    print('${node.nextSibling}');
  print('${document.children[1].children[1].children[1]}');
//  print('${document.children[1].children[1].children[1]..}');

//  xml.XmlNode node = document.children[1].children[1].children[1];
//  var textual = node.descendants
//        .where((n) => n is xml.XmlText && !n.text.trim().isEmpty)
//        .join('\n');
//    print(textual); // This prints "Aarakocra"
  //});
}

void items(File file) {

}

void feats(File file) {

}

void classes(File file) {

}

void backgrounds(File file) {

}



String getFileType() {
  String fileType;
  print("XML or CSV?\n> ");
  fileType = stdin.readLineSync().toLowerCase();
  return fileType;
}

String getPath() {
  String path;
  stdout.write("Enter path to file to be converted\n> ");
  path = stdin.readLineSync().toLowerCase();
  return path;
}

String getListType() {
  String input;
  stdout.write('''\nWhat does this file contain?
  (B)ackgrounds,
  (C)lasses,
  (F)eats,
  (I)tems,
  (M)onsters,
  (R)aces
  > ''');

  input = stdin.readLineSync().toLowerCase();
  return input;
}

//void printMenu() {
//  print("\n** MENU **"
//      "\n(A)dd an item to the list"
//      "\n(R)emove items from the list"
//      "\n(S)how the list"
//      "\n(Q)uit"
//  );
//}