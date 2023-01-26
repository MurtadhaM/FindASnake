echo "Installing NGINX"
 yum install epel-release yum-utils -y
 yum install nginx -y
 
 sleep 2 
 systemctl start nginx
 systemctl enable nginx
cd /usr/share/nginx/html
public_ip=$(curl https://api.ipify.org)
echo "Your public IP is: $public_ip"

cat > test.html << EOL

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Test Data</title>
</head>
<body>

    <h1>Testing your server</h1>
    <hr>
    <p>
        Go to Chrome Dev Tools (F12) and look at your Console.<br>
        Also check your Network tab.
    </p>

    <script>

        fetch('http://$public_ip:3000/json')
            .then(response => response.json())
            .then(data => console.log(data));

        fetch('http://$public_ip:3000/text')
            .then(response => response.text())
            .then(data => console.log(data));

    </script>

</body>
</html>


EOL
