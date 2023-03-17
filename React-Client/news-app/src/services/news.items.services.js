import axios from "axios";

import { toast } from "react-toastify";
import { constNewsItemsEndpoint } from "../constant/constEndpoint";

//get all categories
export const getCategories = async () => {
  try {
    let endpoint = `${constNewsItemsEndpoint}getcategories`;
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

//get all get news items data for user
export const getNewsItemsData = async (userEmail) => {
  try {
    let endpoint = `${constNewsItemsEndpoint}getnewsitemsbyuser/${userEmail}`;
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

//get 10 most popular news items data for user
export const getMostPopularData = async (userEmail) => {
  try {
    let endpoint = `${constNewsItemsEndpoint}getmostpopular/${userEmail}`;
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

//get 10 not popular news items data for user
export const getNotPopularNewItemsData = async (userEmail) => {
  try {
    let endpoint = `${constNewsItemsEndpoint}getnotpopular/${userEmail}`;
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

//update new item
export const updateNewsItem = async (itemID) => {
  try {
    console.log(itemID, 56656);
    let endpoint = `${constNewsItemsEndpoint}updatenewsitem/${itemID}`;
    await axios.post(endpoint);
  } catch (error) {
    toast(
      "An error occurred while executing the request. Please try again in a few minutes, if the problem continues contact us."
    );
    console.error(error);
  }
};
