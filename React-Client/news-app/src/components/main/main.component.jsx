import React, { useEffect, useState } from "react";

import { useAuth0 } from "@auth0/auth0-react";
import { useRecoilState } from "recoil";
import { RingLoader } from "react-spinners";

import { getUsersData, addUserToDb } from "./../../services/users.services";
import { Categories, AppRoutes } from "../../components";
import { emailState } from "../../state/email";

export const Main = (props) => {
  const { user } = useAuth0();
  const [email, setEmail] = useRecoilState(emailState);
  const [usersArr, setUsersArr] = useState(undefined);
  const [isUserAdded, setIsUserAdded] = useState(false);
  console.log("usersArr", usersArr);

  const initUsersData = async () => {
    let users = await getUsersData();
    console.log("users", users);
    let usersObject = Object.values(users.value.data.value);
    setUsersArr(usersObject);
    setEmail(user.email);
  };

  useEffect(() => {
    initUsersData();
  }, []);

  const handleAddUserToDB = async () => {
    await addUserToDb(email);
    setIsUserAdded(true);
  };

  if (usersArr && usersArr !== undefined) {
    const userExists = usersArr.find((u) => u.email === email);
    if (userExists) {
      return <AppRoutes />;
    } else if (!isUserAdded) {
      handleAddUserToDB();
      return null;
    } else {
      return <Categories />;
    }
  } else {
    return (
      <div className="spinner-app">
        <RingLoader color="white" size={300} />
      </div>
    );
  }
};
