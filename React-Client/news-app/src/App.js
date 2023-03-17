import { useAuth0 } from "@auth0/auth0-react";
import { RingLoader } from "react-spinners";

import { UnauthorizedUsers, Main } from "./components";

import "./App.css";

function App() {
  const { isAuthenticated, isLoading } = useAuth0();

  if (!isLoading) {
    return isAuthenticated ? <Main /> : <UnauthorizedUsers className="app" />;
  } else {
    return (
      <div className="spinner-app">
        <RingLoader color="white" size={300} />
      </div>
    );
  }
}

export default App;
