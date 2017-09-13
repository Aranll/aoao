package com.xiaosuokeji.aocai.server.service.intf.user;

import com.xiaosuokeji.aocai.server.model.user.Token;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;

/**
 * 令牌Service<br/>
 * Created by xuxiaowei on 2017/8/1.
 */
public interface TokenService {

    /**
     * 校验管理平台接口令牌
     * @param token 必填：content
     * @throws BusinessException 令牌无效
     */
    void verifyAdminToken(Token token) throws BusinessException;
}
