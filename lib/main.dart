import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
//import package files
import 'package:glob/glob.dart';


//TODO : make calendar?;
//TODO : make griditems and put the number of photos of each day
//TODO : get location from photo


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyFileList(), //call MyFile List
    );
  }
}

//apply this class on home: attribute at MaterialApp()
class MyFileList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyFileList();
  }
}

class _MyFileList extends State<MyFileList>{
  var files;
  var permissionGranted = false;
  Future _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted = true;
      });
    }
  }

  void getFiles() async { //asyn function to get list of files
    // List<StorageInfo> storageInfo = await PathProvider.getStorageInfo();
    // var root = storageInfo[0].rootDir; //storageInfo[1] for SD card, geting the root directory
    var root = '/sdcard/DCIM/Camera';
    var fm = FileManager(root: Directory(root)); //
    files = await fm.filesTree(
      //set fm.dirsTree() for directory/folder tree list
      //   excludedPaths: ["/storage/emulated/0/Android"],
        extensions: ["png", "jpg"] //optional, to filter files, remove to list all,
      //remove this if your are grabbing folder list
    );

    files = files.where((item)=> item.toString().contains('20190929_')).toList();
    // print(files[0].toString().contains('20190929_'));
    // files = files.where((item)=> item.startsWith('20190929_')).toList();

    print(files);
    setState(() {}); //update the UI
  }

  @override
  void initState() {
    _getStoragePermission();
    getFiles(); //call getFiles() function on initial state.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("File/Folder list from SD Card"),
            backgroundColor: Colors.redAccent
        ),
        body:files == null? Text("Searching Files"):
        ListView.builder(  //if file/folder list is grabbed, then show here
          itemCount: files?.length ?? 0,
          itemBuilder: (context, index) {
            return Card(
                child:ListTile(
                  title: Text(files[index].path.split('/').last),
                  leading: Image.file(files[index]),//Icon(Icons.image),
                  trailing: Icon(Icons.delete, color: Colors.redAccent,),
                )
            );
          },
        )
    );
  }
}