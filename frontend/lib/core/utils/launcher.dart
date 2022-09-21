import 'dart:html';

const String facebookPhishedURL = 'https://facebook.com/';
const String outlookPhishedURL = 'https://login.live.com/login.srf';

void launchPhishedURL(String url) => window.open(url, '_self');
