import React, { useState, useEffect } from "react";

import { useNavigate } from "react-router-dom";
import { useRecoilValue } from "recoil";
import { RingLoader } from "react-spinners";
import Fab from "@mui/material/Fab";
import AddIcon from "@mui/icons-material/Add";
import ImageListItem from "@mui/material/ImageListItem";
import ImageListItemBar from "@mui/material/ImageListItemBar";

import { emailState } from "./../../state/email";
import { getCategories } from "./../../services/news.items.services";
import { addUserCategoriesToDb } from "../../services/users.services";
import { toastSuccess } from "../../constant/toastify";
import { AppRoutes } from "../../components";

import "./style.css";

export const Categories = ({ test }) => {
  console.log(test);
  const email = useRecoilValue(emailState);
  const navigate = useNavigate();
  const [categoriesArr, setCategoriesArr] = useState(undefined);
  const [selectedCategories, setSelectedCategories] = useState([]);
  const [addSuccess, setAddsuccess] = useState(false);

  const initCategoriesData = async () => {
    let categories = await getCategories();
    let categoriesObject = Object.values(categories.value.data.value);
    setCategoriesArr(categoriesObject);
  };

  useEffect(() => {
    initCategoriesData();
  }, []);

  const handleAddUserCategories = (categoryName) => {
    if (selectedCategories.includes(categoryName)) {
      setSelectedCategories(
        selectedCategories.filter((c) => c !== categoryName)
      );
    } else if (selectedCategories.length < 3) {
      setSelectedCategories([...selectedCategories, categoryName]);
    }
  };

  const handleAddUserCategoriesToDB = async () => {
    let category2;
    let category3;

    if (selectedCategories[1] !== undefined) {
      category2 = selectedCategories[1];
    } else {
      category2 = null;
    }
    if (selectedCategories[2] !== undefined) {
      category3 = selectedCategories[2];
    } else {
      category3 = null;
    }
    let json = {
      email: email,
      categoryName1: selectedCategories[0],
      categoryName2: category2,
      categoryName3: category3,
    };
    console.log(json);
    await addUserCategoriesToDb(json).then(() => {
      setAddsuccess(true);
    });
    toastSuccess("The categories saved sucessfully");
  };

  // If accessed from the AppRoutes, return to the HomePage
  if (addSuccess === true && test === "yes") {
    return navigate("/");
  }

  // If adding user categories is successful, return to the AppRoutes
  if (addSuccess === true) {
    return <AppRoutes />;
  }

  return (
    <div className="main-category-container">
      <div>
        <h1>בחירת קטגוריות</h1>
        <p>אנא בחר עד 3 קטגוריות שמעניינות אותך</p>
      </div>
      <div className="category-container">
        {categoriesArr ? (
          categoriesArr.map((category) => (
            <ImageListItem
              key={category.categoryImage}
              className="category-image"
            >
              <img
                src={`${category.categoryImage}?w=248&fit=crop&auto=format`}
                srcSet={`${category.categoryImage}?w=248&fit=crop&auto=format&dpr=2 2x`}
                alt={category.categoryName}
                loading="lazy"
              />
              <ImageListItemBar
                title={category.categoryName}
                actionIcon={
                  <Fab
                    size="small"
                    color={
                      selectedCategories.includes(category.categoryName)
                        ? "primary"
                        : "secondary"
                    }
                    aria-label="add"
                    onClick={() =>
                      handleAddUserCategories(category.categoryName)
                    }
                  >
                    <AddIcon />
                  </Fab>
                }
                subtitle={
                  selectedCategories.includes(category.categoryName)
                    ? "נבחרה"
                    : "לא נבחרה"
                }
              />
            </ImageListItem>
          ))
        ) : (
          <div className="spinner-app">
            <RingLoader color="white" size={200} />
          </div>
        )}
      </div>
      <button
        type="button"
        className="btn btn-light categories-button"
        onClick={() => {
          handleAddUserCategoriesToDB();
        }}
        disabled={selectedCategories.length === 0}
      >
        שמור
      </button>
    </div>
  );
};
