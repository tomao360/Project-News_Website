import React from "react";

import { Link } from "react-router-dom";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import { CardActionArea, CardActions } from "@mui/material";

import { updateNewsItem } from "../../services/news.items.services";

import "./style.css";

export const NewsItemCard = ({ key, newsItem }) => {
  const handleUpdateLinkClickedNum = async () => {
    await updateNewsItem(newsItem.itemID);
  };

  return (
    <div key={key}>
      <Card sx={{ maxWidth: 345 }} className="card-container">
        <CardActionArea>
          <CardMedia
            component="img"
            image={newsItem.logoImage}
            className="logo-image"
          />
          <CardMedia
            component="img"
            height="200"
            image={newsItem.image}
            alt={newsItem.categoryName}
            className="item-image"
          />
          <CardContent>
            <Typography gutterBottom variant="h5" component="div">
              {newsItem.title}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              {newsItem.description}
            </Typography>
          </CardContent>
        </CardActionArea>
        <CardActions>
          <Link
            className="link-card"
            href={newsItem.itemLink}
            target="_blank"
            rel="noopener noreferrer"
            onClick={() => {
              handleUpdateLinkClickedNum();
              window.open(newsItem.itemLink, "_blank");
            }}
          >
            {newsItem.itemLink}
          </Link>
        </CardActions>
      </Card>
    </div>
  );
};
