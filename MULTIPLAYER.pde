/* ----------------------------------------------------------- *\
 SERVER
 \* ----------------------------------------------------------- */

void createServer() {
  svr = new Server(this, 28597);

  if (svr.active()) {
    SVR_running = true;
    SVR_InError = !SVR_running;
    println("server succesfully created");
  } else {
    SVR_running = false;
    SVR_InError = !SVR_running;

    println("Server couldn't be created");
  }
}

/* ----------------------------------------------------------- *\
 CLIENT
 \* ----------------------------------------------------------- */

void createClient() {
  cln = new Client(this, "127.0.0.1", 28597);

  if (cln.active()) {
    CLN_running = true;
    CLN_InError = !CLN_running;
    println("client succesfully created");
  } else {
    CLN_running = false;
    CLN_InError = !CLN_running;

    println("client couldn't be created");
  }
}

/* ----------------------------------------------------------- *\
 JSON OBJECTS
 \* ----------------------------------------------------------- */

void connect() {
}
void checkServerInfo() {
}
void getServerInfo() {
}


/* ----------------------------------------------------------- *\
 CLIENT EVENT
 \* ----------------------------------------------------------- */

void clientEvent(Client someClient) {
  println(someClient);
  CLN_id = cln.read();
}

/* ----------------------------------------------------------- *\
 SERVER EVENT
 \* ----------------------------------------------------------- */

void serverEvent(Server server, Client client) {
  clients.add(client);
  println(clients);
  println("Server: "+server.ip()+", Client: "+client.ip());
}