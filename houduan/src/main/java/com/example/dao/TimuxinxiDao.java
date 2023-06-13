package com.example.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.entity.Timuxinxi;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface TimuxinxiDao extends BaseMapper<Timuxinxi> {
@Select("SELECT distinct(timubiaoqian) as aa,count(id) as bb FROM timuxinxi group by timubiaoqian order by id")List<Map<String, Object>> timuxinxi_tj_timubiaoqian();@Select("SELECT distinct(timuleixing) as aa,count(id) as bb FROM timuxinxi group by timuleixing order by id")List<Map<String, Object>> timuxinxi_tj_timuleixing();@Select("SELECT distinct(timunandu) as aa,count(id) as bb FROM timuxinxi group by timunandu order by id")List<Map<String, Object>> timuxinxi_tj_timunandu();//tonxgji1
}
