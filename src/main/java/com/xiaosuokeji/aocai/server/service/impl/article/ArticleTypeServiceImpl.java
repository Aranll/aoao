package com.xiaosuokeji.aocai.server.service.impl.article;

import com.xiaosuokeji.aocai.server.constant.article.ArticleTypeConsts;
import com.xiaosuokeji.aocai.server.dao.article.ArticleDao;
import com.xiaosuokeji.aocai.server.dao.article.ArticleTypeDao;
import com.xiaosuokeji.aocai.server.model.article.Article;
import com.xiaosuokeji.aocai.server.model.article.ArticleType;
import com.xiaosuokeji.aocai.server.service.intf.article.ArticleTypeService;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章类型ServiceImpl<br/>
 * Created by xuxiaowei on 2017/8/25.
 */
@Service
public class ArticleTypeServiceImpl implements ArticleTypeService {

    @Autowired
    private ArticleTypeDao articleTypeDao;

    @Autowired
    private ArticleDao articleDao;

    @Override
    public void save(ArticleType articleType) throws BusinessException {
        ArticleType existent = new ArticleType();
        existent.setName(articleType.getName());
        if (articleTypeDao.count(existent).compareTo(0L) > 0) {
            throw new BusinessException(ArticleTypeConsts.ARTICLE_TYPE_EXIST);
        }
        if (articleType.getUpType() == null || articleType.getUpType().getId() == null) {
            ArticleType upType = new ArticleType(0L);
            articleType.setUpType(upType);
        }
        if (!articleType.getUpType().getId().equals(0L)) {
            ArticleType upType = articleTypeDao.get(articleType.getUpType());
            articleType.setShowable(upType.getShowable());
        }
        articleTypeDao.save(articleType);
    }

    @Override
    public void remove(ArticleType articleType) throws BusinessException {
        ArticleType existent = articleTypeDao.get(articleType);
        if (existent.getDelable().equals(0)) {
            throw new BusinessException(ArticleTypeConsts.ARTICLE_TYPE_NOT_DELABLE);
        }
        existent = new ArticleType();
        existent.setUpType(articleType);
        if (articleTypeDao.count(existent).compareTo(0L) > 0) {
            throw new BusinessException(ArticleTypeConsts.ARTICLE_TYPE_USED);
        }
        Article article = new Article();
        article.setType(articleType);
        if (articleDao.count(article).compareTo(0L) > 0) {
            throw new BusinessException(ArticleTypeConsts.ARTICLE_TYPE_USED);
        }
        articleTypeDao.remove(articleType);
    }

    @Override
    @Transactional
    public void update(ArticleType articleType) throws BusinessException {
        if (!StringUtils.isBlank(articleType.getName())) {
            ArticleType existent = new ArticleType();
            existent.setName(articleType.getName());
            List<ArticleType> existents = articleTypeDao.list(existent);
            if (existents.size() > 0) {
                boolean isSelf = existents.get(0).getId().equals(articleType.getId());
                if (!isSelf) {
                    throw new BusinessException(ArticleTypeConsts.ARTICLE_TYPE_EXIST);
                }
            }
        }
        if (articleType.getShowable() != null) {
            List<ArticleType> articleTypes = deepSearch(buildTree(articleTypeDao.list(new ArticleType())), articleType);
            articleType.setChildren(articleTypes);
            articleTypeDao.updateShowable(articleType);
        }
        articleTypeDao.update(articleType);
    }

    @Override
    public ArticleType get(ArticleType articleType) throws BusinessException {
        ArticleType existent = articleTypeDao.get(articleType);
        if (existent == null) {
            throw new BusinessException(ArticleTypeConsts.ARTICLE_TYPE_NOT_EXIST);
        }
        return existent;
    }

    @Override
    public PageModel<ArticleType> listAndCount(ArticleType articleType) {
        articleType.setDefaultSort("create_time", "DESC");
        return PageModel.build(articleTypeDao.list(articleType), articleTypeDao.count(articleType));
    }

    @Override
    public List<ArticleType> listCombo(ArticleType articleType) {
        articleType.setDefaultSort("seq", "DESC");
        List<ArticleType> list = articleTypeDao.listCombo(articleType);
        Map<Long, ArticleType> tree = buildTree(list);
        List<ArticleType> result = new ArrayList<>();
        if (articleType.getId() != null) {
            result.add(tree.get(articleType.getId()));
        }
        else {
            Long parentId = 0L;
            if (articleType.getUpType() != null && articleType.getUpType().getId() != null) {
                parentId = articleType.getUpType().getId();
            }
            for (ArticleType item : list) {
                Long upTypeId = item.getUpType().getId();
                if (upTypeId.equals(parentId)) {
                    result.add(item);
                }
            }
        }
        return result;
    }

    private Map<Long, ArticleType> buildTree(List<ArticleType> list) {
        Map<Long, ArticleType> tree = new HashMap<>();
        for (ArticleType item : list) {
            tree.put(item.getId(), item);
        }
        for (ArticleType item : list) {
            boolean hasParent = item.getUpType() != null && item.getUpType().getId() != null
                    && tree.get(item.getUpType().getId()) != null;
            if (hasParent) {
                tree.get(item.getUpType().getId()).addChild(item);
            }
        }
        return tree;
    }

    private List<ArticleType> deepSearch(Map<Long, ArticleType> tree, ArticleType node) {
        if (node == null || node.getId() == null) {
            return new ArrayList<>();
        }
        ArticleType root = tree.get(node.getId());
        List<ArticleType> nodes = new ArrayList<>();
        deepSearch(root, nodes);
        return nodes;
    }

    private void deepSearch(ArticleType root, List<ArticleType> nodes) {
        if (root != null) {
            nodes.add(root);
            if (root.getChildren() != null && root.getChildren().size() > 0) {
                for (ArticleType item : root.getChildren()) {
                    deepSearch(item, nodes);
                }
            }
        }
    }
}
