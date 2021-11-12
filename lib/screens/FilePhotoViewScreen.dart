import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pikapika/basic/Common.dart';
import 'package:pikapika/basic/Cross.dart';
import 'package:pikapika/screens/components/Images.dart';

// 预览图片
class FilePhotoViewScreen extends StatelessWidget {
  final String filePath;

  FilePhotoViewScreen(this.filePath);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onLongPress: () async {
                String? choose =
                    await chooseListDialog(context, '请选择', ['保存图片']);
                switch (choose) {
                  case '保存图片':
                    saveImage(filePath, context);
                    break;
                }
              },
              child: PhotoView(
                imageProvider: ResourceFileImageProvider(filePath),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.75),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Icon(Icons.keyboard_backspace, color: Colors.white),
              ),
            ),
          ],
        ),
      );
}
