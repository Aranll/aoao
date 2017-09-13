package com.xiaosuokeji.aocai.home.model;

import java.util.HashMap;

/**
 * Created by gustinlau on 10/09/2017.
 */
public class CachedMap extends HashMap {
    private final Long CACHED_TIME = 5 * 60 * 1000L;//缓存时间

    @Override
    public Object get(Object key) {
        CachedObject value = (CachedObject) super.get(key);
        if(value!=null) {
            Long currentTime = System.currentTimeMillis();
            if (value.validTime > currentTime) {
                return value.object;
            }
            else {
                super.remove(key);
                return null;
            }
        }else{
            return null;
        }
    }

    @Override
    public Object put(Object key, Object value) {
        CachedObject cachedObject = new CachedObject();
        cachedObject.validTime = System.currentTimeMillis() + CACHED_TIME;
        cachedObject.object = value;
        return super.put(key, cachedObject);
    }

    private class CachedObject {
        private Long validTime;
        private Object object;
    }

}
