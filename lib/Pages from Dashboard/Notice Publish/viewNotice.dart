import 'package:flutter/material.dart';
import 'package:teachers/Pages%20from%20Dashboard/Notice%20Publish/publishNotice.dart';
import 'dart:io';

class viewNotice extends StatefulWidget {
  final String viewheading;
  final String viewnotice;
  final String fileName;
  final String filePath;
  final String fileExtension;
  const viewNotice(
      {super.key,
      required this.viewheading,
      required this.viewnotice,
      required this.fileExtension,
      required this.fileName,
      required this.filePath});

  @override
  State<viewNotice> createState() => _viewNoticeState();
}

class _viewNoticeState extends State<viewNotice> {
  @override
  Widget build(BuildContext context) {
    print(widget.viewheading);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "View Notice",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => publishNotice()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.viewheading,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "        ""${widget.viewnotice}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Times New Roman'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (widget.filePath.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    widget.fileExtension.toLowerCase().contains("jpg") ||
                            widget.fileExtension
                                .toLowerCase()
                                .contains("png") ||
                            widget.fileExtension.toLowerCase().contains("jpeg")
                        ? Container(
                            height: 200,
                            width: 200,
                            child: Image.file(File(widget.filePath),
                                fit: BoxFit.cover),
                          )
                        : ElevatedButton.icon(
                            onPressed: () {
                              
                            },
                            icon: Icon(Icons.file_open),
                            label: Text("Open File"),
                          ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
