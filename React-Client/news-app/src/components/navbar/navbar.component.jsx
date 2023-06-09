import React from "react";
import { Link } from "react-router-dom";
import { useAuth0 } from "@auth0/auth0-react";

import HomeIcon from "@mui/icons-material/Home";
import InfoIcon from "@mui/icons-material/Info";
import AutoAwesomeRoundedIcon from "@mui/icons-material/AutoAwesomeRounded";
import PsychologyAltRoundedIcon from "@mui/icons-material/PsychologyAltRounded";
import CategoryRoundedIcon from "@mui/icons-material/CategoryRounded";
import LogoutRoundedIcon from "@mui/icons-material/LogoutRounded";

import "./style.css";

export const Navbar = (props) => {
  const { user, logout } = useAuth0();
  return (
    <div>
      <nav className="navbar navbar-expand-lg nav-all">
        <div className="container-fluid">
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarNavDropdown">
            <ul className="navbar-nav">
              <li className="nav-item">
                <Link className="nav-link" to="/">
                  דף הבית
                  <HomeIcon className="icon" />
                </Link>
              </li>
              <li className="nav-item">
                <Link className="nav-link" to="/about">
                  אודות
                  <InfoIcon className="icon" />
                </Link>
              </li>
              <li className="nav-item user-staff">
                <Link className="nav-link" to="/popular">
                  כתבות פופולאריות
                  <AutoAwesomeRoundedIcon className="icon" />
                </Link>
              </li>
              <li className="nav-item user-staff">
                <Link className="nav-link" to="/curious">
                  כתבות לסקרנים
                  <PsychologyAltRoundedIcon className="icon" />
                </Link>
              </li>
              <li className="nav-item user-staff">
                <Link className="nav-link" to="/categories">
                  קטגוריות
                  <CategoryRoundedIcon className="icon" />
                </Link>
              </li>
              <li className="nav-item dropdown">
                <Link
                  className="nav-link dropdown-toggle show"
                  to="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="true"
                >
                  {user.name}
                </Link>
                <ul className="dropdown-menu show" data-bs-popper="static">
                  <li>
                    <button
                      className="logout"
                      onClick={() =>
                        logout({ returnTo: window.location.origin })
                      }
                    >
                      <LogoutRoundedIcon className="icon" />
                      התנתק
                    </button>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  );
};
