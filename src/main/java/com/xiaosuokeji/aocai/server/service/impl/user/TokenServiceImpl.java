package com.xiaosuokeji.aocai.server.service.impl.user;

import com.xiaosuokeji.aocai.server.constant.user.TokenConsts;
import com.xiaosuokeji.aocai.server.model.user.Token;
import com.xiaosuokeji.aocai.server.service.intf.user.TokenService;
import com.xiaosuokeji.framework.xsjframework.cache.CacheService;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * 令牌ServiceImpl<br/>
 * Created by xuxiaowei on 2017/8/1.
 */
@Service
public class TokenServiceImpl implements TokenService {

    private static final Logger logger = LoggerFactory.getLogger(TokenServiceImpl.class);

    @Value("${admin.token}")
    private String adminToken;

    @Autowired
    @Qualifier("tokenGuavaCache")
    private CacheService cacheService;

    @Override
    public void verifyAdminToken(Token token) throws BusinessException {
        //当令牌为空、空字符串或不等于内置的管理平台令牌时返回令牌无效
        if (token == null || StringUtils.isBlank(token.getContent()) || !adminToken.equals(token.getContent())) {
            throw new BusinessException(TokenConsts.TOKEN_INVALID);
        }
    }
}
