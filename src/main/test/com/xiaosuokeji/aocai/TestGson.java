package com.xiaosuokeji.aocai;


import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.home.enumeration.API;
import com.xiaosuokeji.aocai.home.util.WebUtils;
import org.json.JSONObject;
import org.junit.Test;

/**
 * Created by gustinlau on 06/09/2017.
 */
public class TestGson {

    class Staff{
        private String password;
        private String name;

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }

    @Test
    public void Test(){
        JSONObject result= WebUtils.doRawRequest(API.APP_BANNER_TYPE_COMBO,"{\"upType\": {\"id\": 0}}");
        if(result.getBoolean("status")){
            System.out.println(result.toString());
        }
    }
}
