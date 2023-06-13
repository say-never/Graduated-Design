package com.example.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.entity.Putongyonghu;
import com.example.vo.PutongyonghuVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface PutongyonghuService extends IService<Putongyonghu> {
    Putongyonghu add(Putongyonghu putongyonghu);
    void delete(Long id);
    void update(Putongyonghu putongyonghu);
    Putongyonghu findById(Integer id);
    PutongyonghuVo findPage(PutongyonghuVo putongyonghuVo);
	Putongyonghu login(Putongyonghu putongyonghu);
    void deleteList(List<Putongyonghu> list);


    void findUsername(Putongyonghu putongyonghu);
}
