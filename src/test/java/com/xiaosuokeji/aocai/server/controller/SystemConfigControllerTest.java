package com.xiaosuokeji.aocai.server.controller;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.xiaosuokeji.aocai.server.dao.system.SystemConfigDao;
import com.xiaosuokeji.aocai.server.model.system.SystemConfig;
import com.xiaosuokeji.framework.xsjframework.http.HttpService;
import com.xiaosuokeji.framework.xsjframework.json.JsonUtil;
import com.xiaosuokeji.framework.xsjframework.util.UuidUtil;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xuxiaowei on 2017/9/7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring.xml")
public class SystemConfigControllerTest {

    @Test
    public void test() throws Exception {
        list();
    }

    public void list() throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        mapper.configure(SerializationFeature.WRITE_NULL_MAP_VALUES, false);
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        HttpClient httpClient = HttpClients.custom().build();
        String project = "http://localhost:8080/aocai";
        String url = "/api/admin/v1/system/config/list";
        HttpPost httpPost = new HttpPost(project + url);
        httpPost.setHeader("Content-Type", "application/json");
        SystemConfig systemConfig = new SystemConfig();
        systemConfig.setToken("a008c7cddf6945a29dab650473b000e4");
        String params = mapper.writeValueAsString(systemConfig);
        HttpEntity httpEntity = new StringEntity(params, "UTF-8");
        httpPost.setEntity(httpEntity);
        HttpResponse httpResponse = httpClient.execute(httpPost);
        String result = EntityUtils.toString(httpResponse.getEntity());
        System.out.println(result);

        Field[] fields = SystemConfig.class.getDeclaredFields();
        System.out.println(fields[0].getName());

        String path = System.getProperty("user.dir") + "/src/test/resource/接口文档.md";
        BufferedWriter writer = new BufferedWriter(new FileWriter(new File(path)));
        writer.write("请求地址：" + url);
        writer.write("\n");
        writer.write("请求方式：" + httpPost.getMethod());
        writer.write("\n");
        writer.write("请求参数：");
        writer.write("\n");
        writer.write("\n");
        writer.write("|参数|含义|类型|必填|备注|");
        writer.write("\n");
        writer.write("|---|---|---|---|---|");
        writer.write("\n");
        writer.write("|upType|上级类型|Object|||");
        writer.write("\n");
        writer.write("|upType.id|上级类型id|Long||0表示无上级|");
        writer.write("\n");
        writer.write("\n");
        writer.write("请求参数示例：");
        writer.write("\n");
        writer.write("\n");
        writer.write("```");
        writer.write("\n");
        writer.write(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(systemConfig));
        writer.write("\n");
        writer.write("```");
        writer.write("\n");
        writer.write("\n");
        writer.write("结果参数：");
        writer.write("\n");
        writer.write("\n");
        writer.write("|参数|含义|类型|非空|备注|");
        writer.write("\n");
        writer.write("|---|---|---|---|---|");
        writer.write("\n");
        writer.write("|id|id|String|是||");
        writer.write("\n");
        writer.write("|name|名称|String|是||");
        writer.write("\n");
        writer.write("|upType|上级类型|Object|是||");
        writer.write("\n");
        writer.write("|upType.id|上级类型id|Long|是|0表示无上级|");
        writer.write("\n");
        writer.write("|icon|图标|String|||");
        writer.write("\n");
        writer.write("|children|子级类型列表|List|||");
        writer.write("\n");
        writer.write("\n");
        writer.write("请求结果示例：");
        writer.write("\n");
        writer.write("正常");
        writer.write("\n");
        writer.write("\n");
        writer.write("```");
        writer.write("\n");
        writer.write(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(mapper.readTree(result)));
        writer.write("\n");
        writer.write("```");
        writer.write("\n");
        writer.write("\n");
        writer.flush();
    }
}
