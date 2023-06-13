package com.example.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.entity.Timuxinxi;
import com.example.vo.TimuxinxiVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface TimuxinxiService extends IService<Timuxinxi> {
    Timuxinxi add(Timuxinxi timuxinxi);
    void delete(Long id);
    void update(Timuxinxi timuxinxi);
    Timuxinxi findById(Integer id);
    TimuxinxiVo findPage(TimuxinxiVo timuxinxiVo);
	
    void deleteList(List<Timuxinxi> list);
	List<Map<String,Object>> timuxinxi_tj_timubiaoqian();    List<Map<String,Object>> timuxinxi_tj_timuleixing();    List<Map<String,Object>> timuxinxi_tj_timunandu();    
	
}
