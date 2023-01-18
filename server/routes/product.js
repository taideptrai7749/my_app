const express = require("express");
const productRouter = express.Router();
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");
const User = require("../models/user");

productRouter.get("/api/product/get", auth, async (req, res) => {
  try {
    const products = await Product.find({ userId: req.user });
    res.json(products);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/product", auth, async (req, res) => {
  try {
    const products = await Product.find({ category: req.query.category });
    res.json(products);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/product/search/:name", auth, async (req, res) => {
  try {
    const products = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });
    res.json(products);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

productRouter.post("/api/product/rate", auth, async (req, res) => {
  try {
    const { id, rate } = req.body;
    let product = await Product.findById(id);
    for (let i = 0; i < product.ratings.length; i++) {
      if (req.user == product.ratings[i].userId) {
        product.ratings.splice(i, 1);
        break;
      }
    }
    const rating = {
      userId: req.user,
      rating: rate,
    };
    product.ratings.push(rating);
    product = await product.save();
    res.json(product);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

module.exports = productRouter;
