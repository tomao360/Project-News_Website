import React from "react";
import { useAuth0 } from "@auth0/auth0-react";

export const UnauthorizedUsers = (props) => {
  const { loginWithRedirect } = useAuth0();
  return (
    <div className="app unauthorized-container">
      <button
        className="btn btn-light enter-button"
        onClick={() => loginWithRedirect("http://localhost:3000")}
      >
        Login
      </button>
    </div>
  );
};
