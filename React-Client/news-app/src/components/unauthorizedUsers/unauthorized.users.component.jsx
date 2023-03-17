import React from "react";
import { useAuth0 } from "@auth0/auth0-react";

import "./style.css";

export const UnauthorizedUsers = (props) => {
  const { loginWithRedirect } = useAuth0();
  return (
    <div className="app unauthorized-container">
      <h1 className="welcome">אתר מבזקי החדשות של תמרה</h1>
      <button
        className="btn btn-light enter-button"
        onClick={() => loginWithRedirect("http://localhost:3000")}
      >
        התחבר
      </button>
    </div>
  );
};
