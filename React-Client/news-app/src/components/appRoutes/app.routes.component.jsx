import React from "react";

import { Routes, Route } from "react-router-dom";

import { Navbar, Footer, Categories } from "../../components";
import { HomePage, About, Popular, Curious, PageNotFound } from "./../../pages";

export const AppRoutes = (props) => {
  return (
    <div className="app">
      <div>
        <Navbar />
      </div>
      <div className="app">
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/about" element={<About />} />
          <Route path="/popular" element={<Popular />} />
          <Route path="/curious" element={<Curious />} />
          <Route path="/categories" element={<Categories />} />
          <Route path="*" element={<PageNotFound />} />
        </Routes>
      </div>
      <div>
        <Footer />
      </div>
    </div>
  );
};
