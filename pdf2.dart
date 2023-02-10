import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFScreen1 extends StatefulWidget {
  final String? path1;
  const PDFScreen1({Key? key, this.path1}) : super(key: key);

  @override
  State<PDFScreen1> createState() => _PDFScreen1State();
}

class _PDFScreen1State extends State<PDFScreen1> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                // color: Color(0xff09618E),
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        // centerTitle: true,
        title: Text('Ghar patti document ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              // color: Color(0xff09618E),
              color: Colors.black,
              fontFamily: 'Inter',
            )),

        // leadingWidth: 50,
        backgroundColor: Color(0XFFD9D9D9),
        elevation: 3,
        // foregroundColor: Colors.white,
        // titleSpacing: -10,
        // actions: [Image.asset("assets/images/Ellipse 27.png")],
      ),
      // appBar: AppBar(
      //   title: Text("Document"),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.share),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Center(
        child: Container(
          width: ScreenSize.size.width * 0.95,
          height: ScreenSize.size.height * 0.80,
          child: Stack(
            children: <Widget>[
              PDFView(
                filePath: widget.path1,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: true,
                pageFling: true,
                pageSnap: true,
                defaultPage: currentPage!,
                fitPolicy: FitPolicy.HEIGHT,
                preventLinkNavigation:
                    false, // if set to true the link is handled in flutter
                onRender: (_pages) {
                  setState(() {
                    pages = _pages;
                    isReady = true;
                  });
                },
                onError: (error) {
                  setState(() {
                    errorMessage = error.toString();
                  });
                  print(error.toString());
                },
                onPageError: (page, error) {
                  setState(() {
                    errorMessage = '$page: ${error.toString()}';
                  });
                  print('$page: ${error.toString()}');
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  _controller.complete(pdfViewController);
                },
                onLinkHandler: (String? uri) {
                  print('goto uri: $uri');
                },
                onPageChanged: (int? page, int? total) {
                  print('page change: $page/$total');
                  setState(() {
                    currentPage = page;
                    print(currentPage);
                  });
                },
              ),
              errorMessage.isEmpty
                  ? !isReady
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container()
                  : Center(
                      child: Text(errorMessage),
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              backgroundColor: Color.fromARGB(255, 31, 139, 172),
              label: Text("${currentPage}"),
              onPressed: () async {
                await snapshot.data!.setPage(pages! ~/ 2);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
