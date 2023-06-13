package com.example.service.impl;

import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.common.ResultCode;
import com.example.dao.*;
import com.example.entity.Putongyonghu;
import com.example.exception.CustomException;
import com.example.service.PutongyonghuService;
import com.example.vo.PutongyonghuVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.Map;

@Service("putongyonghuService")
public class PutongyonghuServiceImpl extends ServiceImpl<PutongyonghuDao, Putongyonghu> implements PutongyonghuService {

    @Resource
    private PutongyonghuDao putongyonghuDao;

    public Putongyonghu add(Putongyonghu putongyonghu) {
		if(putongyonghu.getMima()==null) {putongyonghu.setMima(SecureUtil.md5("001"));}else {putongyonghu.setMima(SecureUtil.md5(putongyonghu.getMima())); }
	    LambdaQueryWrapper<Putongyonghu> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(Putongyonghu::getZhanghao,putongyonghu.getZhanghao());
        Putongyonghu findPutongyonghu = putongyonghuDao.selectOne(wrapper);
        if (findPutongyonghu != null) {
            throw new CustomException("1001", "" + putongyonghu.getZhanghao() + "\"已存在");
        }
        putongyonghu.setAddtime(new Date());
        putongyonghuDao.insert(putongyonghu);
        return putongyonghu;
    }
	
	
	
    public void delete(Long id) {
        putongyonghuDao.deleteById(id);
    }

    public void update(Putongyonghu putongyonghu) {
         LambdaQueryWrapper<Putongyonghu> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(Putongyonghu::getZhanghao,putongyonghu.getZhanghao());
        Putongyonghu findPutongyonghu = putongyonghuDao.selectOne(wrapper);
		if (findPutongyonghu != null && putongyonghu.getId() != findPutongyonghu.getId()) {
            throw new CustomException("1001", "" + putongyonghu.getZhanghao() + "\"已存在");
        }
        putongyonghuDao.updateById(putongyonghu);
    }

    @Override
    public Putongyonghu findById(Integer id) {
        return putongyonghuDao.selectById(id);
    }

    public PutongyonghuVo findPage(PutongyonghuVo putongyonghuVo) {
        LambdaQueryWrapper<Putongyonghu> wrapper = Wrappers.lambdaQuery();
		wrapper.like(ObjectUtils.isNotEmpty(putongyonghuVo.getZhanghao()), Putongyonghu::getZhanghao,putongyonghuVo.getZhanghao());        wrapper.like(ObjectUtils.isNotEmpty(putongyonghuVo.getMima()), Putongyonghu::getMima,putongyonghuVo.getMima());        wrapper.like(ObjectUtils.isNotEmpty(putongyonghuVo.getGerenmingcheng()), Putongyonghu::getGerenmingcheng,putongyonghuVo.getGerenmingcheng());        wrapper.eq(ObjectUtils.isNotEmpty(putongyonghuVo.getXingbie()), Putongyonghu::getXingbie,putongyonghuVo.getXingbie());        wrapper.like(ObjectUtils.isNotEmpty(putongyonghuVo.getZhuangtai()), Putongyonghu::getZhuangtai,putongyonghuVo.getZhuangtai());        wrapper.like(ObjectUtils.isNotEmpty(putongyonghuVo.getYouxiang()), Putongyonghu::getYouxiang,putongyonghuVo.getYouxiang());        wrapper.like(ObjectUtils.isNotEmpty(putongyonghuVo.getXingqu()), Putongyonghu::getXingqu,putongyonghuVo.getXingqu());        wrapper.like(ObjectUtils.isNotEmpty(putongyonghuVo.getJianjie()), Putongyonghu::getJianjie,putongyonghuVo.getJianjie());        wrapper.like(ObjectUtils.isNotEmpty(putongyonghuVo.getGerentouxiang()), Putongyonghu::getGerentouxiang,putongyonghuVo.getGerentouxiang());        
        Page<Putongyonghu> page = new Page<>(putongyonghuVo.getCurrent(),putongyonghuVo.getCurrentNum());
        putongyonghuDao.selectPage(page,wrapper);
        List<Putongyonghu> putongyonghus = page.getRecords();
        putongyonghuVo.setList(putongyonghus);
        putongyonghuVo.setPages(page.getPages());
        putongyonghuVo.setTotal(page.getTotal());
        putongyonghuVo.setCurrent(page.getCurrent());
        putongyonghuVo.setCurrentNum(page.getSize());
        return putongyonghuVo;
    }

    @Override
    public void deleteList(List<Putongyonghu> list) {
        List<Integer> ids =  list.stream().map(Putongyonghu::getId).collect(Collectors.toList());
        putongyonghuDao.deleteBatchIds(ids);
    }
	
	@Override
    public Putongyonghu login(Putongyonghu putongyonghu) {
        LambdaQueryWrapper<Putongyonghu> wrapper = new LambdaQueryWrapper();
        wrapper.eq(ObjectUtils.isNotEmpty(putongyonghu.getZhanghao()), Putongyonghu::getZhanghao,putongyonghu.getZhanghao());
        Putongyonghu putongyonghuInfo = putongyonghuDao.selectOne(wrapper);
        if (putongyonghuInfo == null) {
            throw new CustomException(ResultCode.USER_ACCOUNT_ERROR);
        }
        if (!SecureUtil.md5(putongyonghu.getMima()).equalsIgnoreCase(putongyonghuInfo.getMima())) {
            throw new CustomException(ResultCode.USER_ACCOUNT_ERROR);
        }
        return putongyonghuInfo;
    }
	
	 @Override
    public void findUsername(Putongyonghu putongyonghu) {
        LambdaQueryWrapper<Putongyonghu> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(Putongyonghu::getZhanghao,putongyonghu.getZhanghao());
        Putongyonghu findPutongyonghu = putongyonghuDao.selectOne(wrapper);
        if (findPutongyonghu != null) {
            throw new CustomException("1001", "" + putongyonghu.getZhanghao() + "\"已存在");
        }
    }
}
