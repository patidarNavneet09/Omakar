import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFScreen extends StatefulWidget {
  final String? path;

  PDFScreen({Key? key, this.path}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
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
        title: Text('Agreement valid document ',
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
      body: Center(
        child: Container(
          width: ScreenSize.size.width * 0.95,
          height: ScreenSize.size.height * 0.80,
          child: Stack(
            children: <Widget>[
              Center(
                child: PDFView(
                  filePath: widget.path,

                  enableSwipe: true,
                  swipeHorizontal: false,
                  autoSpacing: true,
                  pageFling: false,
                  pageSnap: false,
                  defaultPage: 0,
                  fitEachPage: true,
                  fitPolicy: FitPolicy.HEIGHT,
                  preventLinkNavigation:
                      true, // if set to true the link is handled in flutter
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
