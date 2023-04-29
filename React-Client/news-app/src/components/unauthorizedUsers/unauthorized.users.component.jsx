import React from "react";
import { useAuth0 } from "@auth0/auth0-react";

import logo from "../../images/מבזקי חדשות-1.png";

import "./style.css";

export const UnauthorizedUsers = (props) => {
  const { loginWithRedirect } = useAuth0();
  return (
    <div className="app unauthorized-container">
      <img src={logo} alt="מבזקי חדשות" className="logo" />
      <button
        className="btn btn-light enter-button"
        onClick={() => loginWithRedirect("http://localhost:3000")}
      >
        התחבר
      </button>
    </div>
  );
};
