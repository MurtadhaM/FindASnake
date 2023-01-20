echo "Installing NODEJS"

 curl -sL https://rpm.nodesource.com/setup_19.x| sudo bash -


 sleep 5
 yum install nodejs -y
 cd /usr/share/nginx
# Writing the server.js file
cat > server.js << EOL

const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/html/test.html'));
});

app.get('/json', (req, res) => {
  res.json({
    result: 'My name is Murtadha Marzouq!'
  });
});

app.get('/text', (req, res) => {
  res.send('{"result": "My name is Murtadha Marzouq!"}');
});

app.listen(port, () => {
  console.log(\`Example app listening at http://localhost:${port}\`);
});

EOL
#Type the code shown in this slide
 npm install express
 npm install -g pm2
 pm2 start server.js




