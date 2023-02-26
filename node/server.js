const http = require("http");
const fs = require("fs");
const os = require("os");
const ip = require('ip');

http.createServer((req, res) => {
  if (req.url === "/") {
      fs.readFile("./public/index.html", "UTF-8", (err, body) => {
      res.writeHead(200, {"Content-Type": "text/html"});
      res.end(body);
    });
  } else if(req.url.match("/sysinfo")) {

    // formats uptime output to days, hours, minutes, seconds
    var ut_sec = os.uptime();
    var ut_min = ut_sec/60;
    var ut_hour = ut_min/60;
    var ut_day = ut_hour/24;
    ut_sec = Math.floor(ut_sec);
    ut_min = Math.floor(ut_min);
    ut_hour = Math.floor(ut_hour);
    ut_day = Math.floor(ut_day);
    ut_sec = ut_sec%60
    ut_min = ut_min%60
    ut_hour = ut_hour%24
    ut_day = ut_day%60

    // formats free memory from bytes to MB
    var free = os.freemem() / 1024 / 1024;
    free = Math.floor(free);

    // formats total memory from bytes to MB
    var total = os.totalmem() / 1024 / 1024;
    total = Math.floor(total);

    // calculates total number of CPUs
    const numCPU = os.cpus().length;

    // outputs for site
    myHostName=os.hostname();
    myUptime=(ut_day + " Day(s), " + ut_hour + " Hour(s), " + ut_min + " Minute(s), " + ut_sec + " Second(s)"); // outputs uptime
    memFree=(free + " MB");
    totalMemory=(total + " MB");
    totalCPU=(numCPU);

    html=`
    <!DOCTYPE html>
    <html>
      <head>
        <title>Node JS Response</title>
      </head>
      <body>
        <p>Hostname: ${myHostName}</p>
        <p>IP: ${ip.address()}</p>
        <p>Server Uptime: ${myUptime}</p>
        <p>Total Memory: ${totalMemory}</p>
        <p>Free Memory: ${memFree}</p>
        <p>Number of CPUs: ${totalCPU}</p>
      </body>
    </html>`
    res.writeHead(200, {"Content-Type": "text/html"});
    res.end(html);
  } else {
    res.writeHead(404, {"Content-Type": "text/plain"});
    res.end(`404 File Not Found at ${req.url}`);
  }
}).listen(3000);

console.log("Server listening on port 3000");