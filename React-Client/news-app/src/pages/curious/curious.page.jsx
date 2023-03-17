import React, { useState, useEffect } from "react";

import { useRecoilValue } from "recoil";
import { RingLoader } from "react-spinners";

import { emailState } from "./../../state/email";
import { getNotPopularNewItemsData } from "../../services/news.items.services";
import { NewsItemCard } from "../../components/newsItemCard/news.item.card.component";

import "./style.css";

export const Curious = (props) => {
  const email = useRecoilValue(emailState);
  const [newsItemsArr, setNewsItemsArr] = useState(undefined);

  const initCuriousNewsItemsData = async () => {
    let curiousNewsItems = await getNotPopularNewItemsData(email);
    let curiousNewsItemsObject = Object.values(
      curiousNewsItems.value.data.value
    );
    console.log(curiousNewsItemsObject, "curiousNewsItemsObject");
    setNewsItemsArr(curiousNewsItemsObject);
  };

  useEffect(() => {
    initCuriousNewsItemsData();
  }, []);

  return (
    <div>
      <h2>כתבות לסקרנים</h2>
      <p>ראה מטה כתבות מהקטגוריות שבחרת העשויות לעניין אותך</p>
      <div className="curious-container">
        {newsItemsArr ? (
          newsItemsArr.map((n) => {
            return <NewsItemCard key={n.id} newsItem={n} />;
          })
        ) : (
          <div className="spinner-app">
            <RingLoader color="white" size={200} />
          </div>
        )}
      </div>
    </div>
  );
};
