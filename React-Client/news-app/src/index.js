import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";

import { BrowserRouter } from "react-router-dom";
import { Auth0Provider } from "@auth0/auth0-react";
import { RecoilRoot } from "recoil";

import ".././node_modules/bootstrap/dist/css/bootstrap.css";
import ".././node_modules/bootstrap/dist/css/bootstrap-grid.min.css";
import ".././node_modules/bootstrap/dist/js/bootstrap.bundle.min.js";
import "./index.css";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <BrowserRouter>
      <Auth0Provider
        domain="dev-ti3u1n80psnj3o5q.us.auth0.com"
        clientId="iSE6hTLkhEUuyQaigs23uqZxr9X0ctDn"
        authorizationParams={{
          redirect_uri: window.location.origin,
        }}
      >
        <RecoilRoot>
          <App />
        </RecoilRoot>
      </Auth0Provider>
    </BrowserRouter>
  </React.StrictMode>
);
