import React, { useState, useEffect } from "react";

import { useRecoilValue } from "recoil";
import { RingLoader } from "react-spinners";

import { emailState } from "./../../state/email";
import { getNewsItemsData } from "../../services/news.items.services";
import { NewsItemCard } from "../../components";

import "./style.css";

export const HomePage = (props) => {
  const email = useRecoilValue(emailState);
  const [newsItemsArr, setNewItemsArr] = useState(undefined);

  const initNewsItemsData = async () => {
    let newsItems = await getNewsItemsData(email);
    let NewsItemsObject = Object.values(newsItems.value.data.value);
    console.log(NewsItemsObject, "NewsItemsObject");
    setNewItemsArr(NewsItemsObject);
  };

  useEffect(() => {
    initNewsItemsData();
  }, []);

  const categories = newsItemsArr
    ? newsItemsArr
        .map((n) => n.categoryName)
        .filter((name, index, arr) => arr.indexOf(name) === index)
    : [];

  return (
    <div>
      {categories.map((category) => (
        <div>
          <h2 className="category-title">{category}</h2>
          <div className="news-items-container">
            {newsItemsArr
              .filter((newsItem) => newsItem.categoryName === category)
              .map((newsItem) => {
                return <NewsItemCard key={newsItem.id} newsItem={newsItem} />;
              })}
          </div>
        </div>
      ))}
      {newsItemsArr === undefined && (
        <div className="spinner-app">
          <RingLoader color="white" size={200} />
        </div>
      )}
    </div>
  );
};
