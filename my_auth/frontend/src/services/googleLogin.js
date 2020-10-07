import axios from "axios";
import Cookies from 'js-cookie'

/**
 * 
 * @param {*} accesstoken This is the accesstoken of the user obtained from Google
 */
const googleLogin = async (accesstoken) => {
    let res = await axios.post(
      "https://localhost/rest-auth/google/",
      {
        access_token: accesstoken,
      },
      {
        headers: {
          'X-CSRFToken': Cookies.get('csrftoken'),
        }
      }
    );
    console.log(res);
    return await res.status;
  };

export default googleLogin;