package com.example.service.impl;

import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.common.ResultCode;
import com.example.dao.*;
import com.example.entity.Timuxinxi;
import com.example.exception.CustomException;
import com.example.service.TimuxinxiService;
import com.example.vo.TimuxinxiVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.Map;

@Service("timuxinxiService")
public class TimuxinxiServiceImpl extends ServiceImpl<TimuxinxiDao, Timuxinxi> implements TimuxinxiService {

    @Resource
    private TimuxinxiDao timuxinxiDao;

    public Timuxinxi add(Timuxinxi timuxinxi) {
		
	   //youquchong1
        timuxinxi.setAddtime(new Date());
        timuxinxiDao.insert(timuxinxi);
        return timuxinxi;
    }
	
	@Override
    public List<Map<String,Object>> timuxinxi_tj_timubiaoqian() {
    List<Map<String,Object>> returnMap = timuxinxiDao.timuxinxi_tj_timubiaoqian();
    return returnMap;
    }
    @Override
    public List<Map<String,Object>> timuxinxi_tj_timuleixing() {
    List<Map<String,Object>> returnMap = timuxinxiDao.timuxinxi_tj_timuleixing();
    return returnMap;
    }
    @Override
    public List<Map<String,Object>> timuxinxi_tj_timunandu() {
    List<Map<String,Object>> returnMap = timuxinxiDao.timuxinxi_tj_timunandu();
    return returnMap;
    }
    
	
    public void delete(Long id) {
        timuxinxiDao.deleteById(id);
    }

    public void update(Timuxinxi timuxinxi) {
        //youquchong2
        timuxinxiDao.updateById(timuxinxi);
    }

    @Override
    public Timuxinxi findById(Integer id) {
        return timuxinxiDao.selectById(id);
    }

    public TimuxinxiVo findPage(TimuxinxiVo timuxinxiVo) {
        LambdaQueryWrapper<Timuxinxi> wrapper = Wrappers.lambdaQuery();
		wrapper.like(ObjectUtils.isNotEmpty(timuxinxiVo.getTimumingcheng()), Timuxinxi::getTimumingcheng,timuxinxiVo.getTimumingcheng());
        wrapper.like(ObjectUtils.isNotEmpty(timuxinxiVo.getTimubiaoqian()), Timuxinxi::getTimubiaoqian,timuxinxiVo.getTimubiaoqian());
        wrapper.like(ObjectUtils.isNotEmpty(timuxinxiVo.getTimuleixing()), Timuxinxi::getTimuleixing,timuxinxiVo.getTimuleixing());
        wrapper.like(ObjectUtils.isNotEmpty(timuxinxiVo.getTimunandu()), Timuxinxi::getTimunandu,timuxinxiVo.getTimunandu());
        wrapper.like(ObjectUtils.isNotEmpty(timuxinxiVo.getTimumiaoshu()), Timuxinxi::getTimumiaoshu,timuxinxiVo.getTimumiaoshu());
        wrapper.like(ObjectUtils.isNotEmpty(timuxinxiVo.getTimuwendang()), Timuxinxi::getTimuwendang,timuxinxiVo.getTimuwendang());
        wrapper.like(ObjectUtils.isNotEmpty(timuxinxiVo.getShangchuanren()), Timuxinxi::getShangchuanren,timuxinxiVo.getShangchuanren());
//        根据dianzanshu（收藏数）进行排序
        wrapper.orderByDesc(Timuxinxi::getDianzanshu);
        Page<Timuxinxi> page = new Page<>(timuxinxiVo.getCurrent(),timuxinxiVo.getCurrentNum());
        timuxinxiDao.selectPage(page,wrapper);
        List<Timuxinxi> timuxinxis = page.getRecords();
        timuxinxiVo.setList(timuxinxis);
        timuxinxiVo.setPages(page.getPages());
        timuxinxiVo.setTotal(page.getTotal());
        timuxinxiVo.setCurrent(page.getCurrent());
        timuxinxiVo.setCurrentNum(page.getSize());
        return timuxinxiVo;
    }

    @Override
    public void deleteList(List<Timuxinxi> list) {
        List<Integer> ids =  list.stream().map(Timuxinxi::getId).collect(Collectors.toList());
        timuxinxiDao.deleteBatchIds(ids);
    }
	
	
	
	
}
