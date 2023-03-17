import React from "react";

import "./style.css";

export const About = (props) => {
  return (
    <div className="about-container">
      <h1>אודות אתר החדשות</h1>
      <p className="p-about">
        האתר מספק ניהול חכם של מבזקי חדשות. <br /> לאחר שהמשתמש בוחר עד 3 תחומי
        עניין שמעניינים אותו מתוך 15 תחומים האתר מספק 10 כתבות אחרונות לגבי כל
        תחום מכל מקור מהמקורות הבאים: גלובס, מעריב, וואלה! ו - ynet.
      </p>
    </div>
  );
};
