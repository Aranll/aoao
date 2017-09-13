package com.xiaosuokeji.aocai.server.service.impl.article;

import com.xiaosuokeji.aocai.server.constant.article.ArticleConsts;
import com.xiaosuokeji.aocai.server.dao.article.ArticleDao;
import com.xiaosuokeji.aocai.server.dao.article.ArticleTypeDao;
import com.xiaosuokeji.aocai.server.model.article.Article;
import com.xiaosuokeji.aocai.server.model.article.ArticleType;
import com.xiaosuokeji.aocai.server.service.intf.article.ArticleService;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;
import com.xiaosuokeji.framework.xsjframework.util.UuidUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文章Service<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Autowired
    private ArticleTypeDao articleTypeDao;

    @Override
    public void save(Article article) throws BusinessException {
        Article existent = new Article();
        existent.setTitle(article.getTitle());
        if (articleDao.count(existent).compareTo(0L) > 0) {
            throw new BusinessException(ArticleConsts.ARTICLE_EXIST);
        }
        article.setId(UuidUtil.generate());
        if (StringUtils.isBlank(article.getUrl())) {
            ArticleType articleType = articleTypeDao.get(article.getType());
            article.setUrl(articleType.getUrlPrefix() + "/" + article.getId());
        }
        articleDao.save(article);
    }

    @Override
    public void remove(Article article) throws BusinessException {
        Article existent = articleDao.get(article);
        if (existent.getDelable().equals(0)) {
            throw new BusinessException(ArticleConsts.ARTICLE_NOT_DELABLE);
        }
        articleDao.remove(article);
    }

    @Override
    public void update(Article article) throws BusinessException {
        if (!StringUtils.isBlank(article.getTitle())) {
            Article existent = new Article();
            existent.setTitle(article.getTitle());
            List<Article> existents = articleDao.list(existent);
            if (existents.size() > 0) {
                boolean isSelf = existents.get(0).getId().equals(article.getId());
                if (!isSelf) throw new BusinessException(ArticleConsts.ARTICLE_EXIST);
            }
        }
        articleDao.update(article);
    }

    @Override
    public Article get(Article article) throws BusinessException {
        Article existent = articleDao.get(article);
        if (existent == null) throw new BusinessException(ArticleConsts.ARTICLE_NOT_EXIST);
        return existent;
    }

    @Override
    public PageModel<Article> listAndCount(Article article) {
        article.setDefaultSort("create_time", "DESC");
        return PageModel.build(articleDao.list(article), articleDao.count(article));
    }

    @Override
    public PageModel<Article> listCombo(Article article) {
        article.setDefaultSort("seq", "DESC");
        return PageModel.build(articleDao.listCombo(article), articleDao.count(article));
    }
}
