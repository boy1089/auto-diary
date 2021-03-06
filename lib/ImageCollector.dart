
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'dart:io';


class ImageCollector {

  var files;
  var files_string;
  var files_all;
  var files_filtered;
  var dates;

  ImageCollector() {
    this.init();
    // this.getDateFromFiles();
  }

  void init() async{
    this.getAllFiles();

  }


  void getAllFiles() async {
    var root = '/sdcard/DCIM/Camera';
    var fm = FileManager(root: Directory(root));
    print('files_all = $files_all.length');
    files_all = await fm.filesTree(
      //   excludedPaths: ["/storage/emulated/0/Android"],
        extensions: [
          "png",
          "jpg"
        ] //optional, to filter files, remove to list all,
    );
    files_all = await files_all.where((item)=> item.toString().contains('2019')).toList();

  }

  void getDateFromFiles() async {
    var dateList = [];
    print('files_all = $files_all.length');
    for( var i = 0; i < files_all.length; i++){
      dateList.add(files_all[i].toString().split('/')[4].substring(0, 8));
    }
    dates = await dateList.toSet().toList();
  }

  void filterFiles(String keyword) {
    files_filtered = [];
    files_filtered =
        files_all.where((item) => item.toString().contains('$keyword')).toList();
  }


  void getFiles(String keyword) async {
    var root = '/sdcard/DCIM/Camera';
    var fm = FileManager(root: Directory(root)); //
    files = await fm.filesTree(
      //set fm.dirsTree() for directory/folder tree list
      //   excludedPaths: ["/storage/emulated/0/Android"],
        extensions: [
          "png",
          "jpg"
        ] //optional, to filter files, remove to list all,
      //remove this if your are grabbing folder list
    );

    files_string = files.where((item) => item.toString().contains('$keyword')).toList();
  }

}