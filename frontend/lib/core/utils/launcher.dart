import 'dart:html';

const String facebookPhishedURL = 'https://facebook.com/';

void launchPhishedURL(String url) => window.open(url, '_self');
