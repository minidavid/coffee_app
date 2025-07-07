
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool IsActive = true;
  final webViewKey = UniqueKey();

  final WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress){
            //update loading bar
        },

        onPageStarted: (String url){},
        onPageFinished: (String url){},
        onHttpError: (HttpResponseError error){},
        onWebResourceError: (WebResourceError error){},
        onNavigationRequest: (NavigationRequest request){

          if (request.url.startsWith('https://minidavid.itch.io/word-search-point-and-click-game'))
          {
            return NavigationDecision.prevent;
          }

          return NavigationDecision.navigate;

        },
      ),
    )
    ..loadRequest(
      Uri.parse("https://minidavid.itch.io/word-search-point-and-click-game")
    );

  


    //     ..loadFlutterAsset(
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Builder(
            builder: (BuildContext context){
              return IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: Icon(Icons.ac_unit));
            }
        ),
        title: Text("Pew!"),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text("Aloha!"),
        
              SizedBox(
                height: 800,
                  
                  
                  child: (IsActive)? WebViewWidget(controller: webViewController, key: UniqueKey(),) : const Text(""),

              ),
              TextButton(
                onPressed: ()
                {
                  setState(() {
                    IsActive = !IsActive;
                    if (IsActive){
                      webViewController.setJavaScriptMode(JavaScriptMode.disabled);
                      webViewController.runJavaScript('''
                        var videos = document.querySelectorAll("video, audio");
                        vidoes.forEach(v => v.pause);
                      ''');

                      webViewController.clearCache();
                    }
                    else
                    {
                      webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
                      webViewController.runJavaScript('''
                        var videos = document.querySelectorAll("video, audio");
                        vidoes.forEach(v => v.play);
                      ''');
                    }
                                   
                  });
                },
                child: Text("Disable Ts")
              ),
              
              
              Text("$IsActive"),
        
            ],
          ),
        
        ),
      ),
    
    );
  }
}
