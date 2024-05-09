<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Email</title>
</head>
<body>
    <label for="subject">Subject:</label>
    <input type="text" id="subject" placeholder="Enter subject">

    <button onclick="sendEmail()">Send Email</button>

    <script>
        function sendEmail() {
            var to = 'recipient@example.com';
            var subject = document.getElementById('subject').value;
            var body = 'Body of the email';

            var mailtoLink = 'mailto:' + to + '?subject=' + encodeURIComponent(subject) + '&body=' + encodeURIComponent(body);

            // Open the user's default email client with the mailto link
            window.location.href = mailtoLink;
        }
    </script>
</body>
</html>
