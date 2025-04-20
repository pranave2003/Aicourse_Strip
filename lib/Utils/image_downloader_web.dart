import 'dart:html' as html;

void triggerDownload(String url, String fileName) {
  final anchor = html.AnchorElement(href: url)
    ..target = 'blank'
    ..download = fileName
    ..click();
}
