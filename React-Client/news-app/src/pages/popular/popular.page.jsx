import React, { useState, useEffect } from "react";

import { useRecoilValue } from "recoil";

import { emailState } from "./../../state/email";
import { getMostPopularData } from "../../services/news.items.services";
import { NewsItemCard } from "../../components/newsItemCard/news.item.card.component";

import "./style.css";

export const Popular = (props) => {
  const email = useRecoilValue(emailState);
  const [popularItemsArr, setPopularItemsArr] = useState(undefined);

  const initPopularNewsItemsData = async () => {
    let popularNewsItems = await getMostPopularData(email);
    let popularNewsItemsObject = Object.values(
      popularNewsItems.value.data.value
    );
    console.log(popularNewsItemsObject, "popularNewsItemsObject");
    setPopularItemsArr(popularNewsItemsObject);
  };

  useEffect(() => {
    initPopularNewsItemsData();
  }, []);

  return (
    <div>
      <h2>כתבות פופולאריות</h2>
      <p>הכתבות הכי פופולאריות מהקטגוריות שבחרת</p>
      <div className="popular-container">
        {popularItemsArr && popularItemsArr.length > 0 ? (
          popularItemsArr.map((popular) => {
            return <NewsItemCard key={popular.id} newsItem={popular} />;
          })
        ) : (
          <p className="not-found-p">לא נמצאו כתבות פופולאריות</p>
        )}
      </div>
    </div>
  );
};
