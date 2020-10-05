import axios from "axios";

/**
 * 
 * @param {*} accesstoken This is the accesstoken of the user obtained from FaceBook
 */
const fbLogin = async (accesstoken) => {
  let res = await axios.post(
    "https://localhost/rest-auth/facebook/",
    {
      access_token : accesstoken,
    }
  );
  console.log(res);
  return await res.status;
};

export default fbLogin;