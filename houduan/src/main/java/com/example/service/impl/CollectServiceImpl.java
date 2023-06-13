package com.example.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.dao.CollectDao;
import com.example.dao.FileInfoDao;
import com.example.entity.Timuxinxi;
import com.example.entity.Collect;
import com.example.entity.FileInfo;
import com.example.entity.Putongyonghu;

import com.example.service.TimuxinxiService;
import com.example.service.CollectService;
import com.example.service.PutongyonghuService;



import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("collectService")
public class CollectServiceImpl  extends ServiceImpl<CollectDao, Collect> implements CollectService {

    @Resource
    private CollectDao collectDao;

    @Resource
    private PutongyonghuService putongyonghuService;
    @Resource
    private TimuxinxiService timuxinxiService;



//    public Collect add(Collect collect) {
//        Collect collect1 = collectDao.findByUser(collect);
//        if(collect1 == null) {
//            collectDao.insert(collect);
//            return collect;
//        }else {
//            return null;
//        }
//    }

    public Collect add(Collect collect) {
        Collect collect1 = collectDao.findByUser(collect);
        if(collect1 == null) {
            Integer id = collect.getShangpinxinxiID();
            Timuxinxi timuxinxi =  timuxinxiService.findById(id);
            int number = Integer.parseInt(timuxinxi.getDianzanshu())+1;
            timuxinxi.setDianzanshu(number+"");
            timuxinxiService.updateById(timuxinxi);
            collectDao.insert(collect);
            return collect;
        }else {
            return null;
        }
    }

    public void delete(Integer id) {
        collectDao.deleteById(id);
    }

    public void update(Collect collect) {
        collectDao.updateById(collect);
    }

    public Collect findById(Long id) {
        return collectDao.selectById(id);
    }

    public List<Collect> findFrontPages(Integer userId) {
        List<Collect> collects;
        if (userId != null){
            collects = collectDao.findByEndUserId(userId);
        } else {
            collects = new ArrayList<>();
        }
        for (Collect collect : collects) {
            packOrder(collect);
        }
        return collects;
    }
    /**
     * 包装收藏的用户和商品信息
     */

    public List<Putongyonghu> findPaperByPutongyonghu(Integer id) {
        List<Collect> collects = collectDao.findByEndUserId(id);
        List<Putongyonghu> putongyonghuList = new ArrayList<>();
        for (Collect collect : collects) {
            Integer foreignId = collect.getShangpinxinxiID();
            Putongyonghu putongyonghu = null;
            if(foreignId != null){
                putongyonghu = putongyonghuService.findById(foreignId);
            };
            if(putongyonghu != null){
                putongyonghuList.add(putongyonghu);
            }
        }
        return putongyonghuList;
    }

    private void packOrder(Collect collect) {
        collect.setPutongyonghu(putongyonghuService.findById(collect.getUserId()));
        List<Timuxinxi> goodsList = CollUtil.newArrayList();
        collect.setProductList(goodsList);
        Timuxinxi goodsDetail = timuxinxiService.findById(collect.getShangpinxinxiID());
        if (goodsDetail != null) {
            goodsList.add(goodsDetail);
        }
    }

    @Override
    public void deleteByUserId(Integer id, Integer userId) {
        collectDao.deleteByUserId(id,userId);
    }
}
