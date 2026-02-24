require("dotenv").config();
const express = require("express");
const basicAuth = require("basic-auth");

const app = express();
const PORT = 3000;

const authMiddleware = (req, res, next) => {
  const user = basicAuth(req);

  if (
    !user ||
    user.name !== process.env.USERNAME ||
    user.pass !== process.env.PASSWORD
  ) {
    res.set("WWW-Authenticate", "Basic realm=Authorization Required");
    return res.status(401).send("Authentication required.");
  }

  next();
};

app.get("/", (req, res) => {
  res.send("Hello, world!");
});

app.get("/secret", authMiddleware, (req, res) => {
  res.send(process.env.SECRET_MESSAGE);
});

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));