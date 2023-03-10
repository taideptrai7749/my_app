const jwt = require("jsonwebtoken");
const User = require("../models/user");

const auth = async(req, res, next) => {
    try{
        const token = req.header("token");
        if(!token){
            return res.status(401).json({msg: "Token is invalid"});
        }
        const isVerified = jwt.verify(token, "passwordKey");
        if(!isVerified){
            return res.status(401).json({msg: "Token verification failed"});
        }
        const user = await User.findById(isVerified.id);
        if(!user){
            return res.status(401).json({msg: "User does not exist"});
        }
        req.user = isVerified.id;
        req.token = token;
        next();
    }
    catch(e){
        return res.status(500).json({error: e.message});
    }
}

module.exports = auth;