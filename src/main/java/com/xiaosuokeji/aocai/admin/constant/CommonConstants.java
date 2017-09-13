package com.xiaosuokeji.aocai.admin.constant;


import com.xiaosuokeji.aocai.admin.bean.AdminBean;
import com.xiaosuokeji.aocai.admin.bean.OssBean;
import com.xiaosuokeji.framework.xsjframework.spring.SpringAppContext;


/**
 * Created by GustinLau on 2017-05-02.
 */
public class CommonConstants {

    private static final AdminBean adminBean = SpringAppContext.getBean("adminBean");
    private static final OssBean ossBean = SpringAppContext.getBean("ossBean");

    public static final String ADMIN_TOKEN = adminBean.getToken();
    public static final String ADMIN_DOMAIN = adminBean.getDomain();

    public static final String OSS_ACCESS_KEY_ID = ossBean.getAccessKeyId();
    public static final String OSS_ACCESS_KEY_SECRET = ossBean.getAccessKeySecret();
    public static final String OSS_BUCKET_NAME = ossBean.getBucketName();
    public static final String OSS_END_POINT = ossBean.getEndPoint();
    public static final String OSS_DOMAIN = ossBean.getDomain();



}
