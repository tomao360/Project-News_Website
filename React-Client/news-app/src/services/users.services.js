import axios from "axios";

import { toast } from "react-toastify";
import { constUsersEndpoint } from "../constant/constEndpoint";

//get all users
export const getUsersData = async () => {
  try {
    let endpoint = `${constUsersEndpoint}getusers`;
    let response = await axios.get(endpoint);
    console.log(response);
    return response.data;
  } catch (error) {
    toast(
      "An error occurred while executing the request. Please try again in a few minutes, if the problem continues contact us."
    );
    console.error(error);
  }
};

//add user to DB
export const addUserToDb = async (userEmail) => {
  try {
    console.log(userEmail);
    let endpoint = `${constUsersEndpoint}insertuser/${userEmail}`;
    await axios.post(endpoint);
  } catch (error) {
    toast(
      "An error occurred while executing the request. Please try again in a few minutes, if the problem continues contact us."
    );
    console.error(error);
  }
};

//add user's categories to DB
export const addUserCategoriesToDb = async (usersCategories) => {
  try {
    console.log(usersCategories, 55555555);
    let endpoint = `${constUsersEndpoint}insertusercategories`;
    await axios.post(endpoint, usersCategories);
  } catch (error) {
    toast(
      "An error occurred while executing the request. Please try again in a few minutes, if the problem continues contact us."
    );
    console.error(error);
  }
};
