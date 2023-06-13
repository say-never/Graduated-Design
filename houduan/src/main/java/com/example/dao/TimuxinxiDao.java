package com.example.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.entity.Timuxinxi;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface TimuxinxiDao extends BaseMapper<Timuxinxi> {
@Select("SELECT distinct(timubiaoqian) as aa,count(id) as bb FROM timuxinxi group by timubiaoqian order by id")
}