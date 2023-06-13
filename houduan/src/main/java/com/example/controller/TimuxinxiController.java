package com.example.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.example.common.Result;
import com.example.common.ResultCode;
import com.example.entity.Timuxinxi;
import com.example.exception.CustomException;
import com.example.service.TimuxinxiService;
import com.example.utils.MapWrapperUtils;
import com.example.utils.jwt.JwtUtil;
import com.example.vo.TimuxinxiVo;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/timuxinxi")
public class TimuxinxiController {

    @Resource
    private TimuxinxiService timuxinxiService;

    @PostMapping
    public Result<Timuxinxi> add(@RequestBody TimuxinxiVo timuxinxi) {
        timuxinxiService.add(timuxinxi);
           return Result.success(timuxinxi);
    }
	
	@GetMapping("/timuxinxi_tj_timubiaoqian")
    public Result timuxinxi_tj_timubiaoqian() {
        return Result.success(timuxinxiService.timuxinxi_tj_timubiaoqian());
    }
    @GetMapping("/timuxinxi_tj_timuleixing")
    public Result timuxinxi_tj_timuleixing() {
        return Result.success(timuxinxiService.timuxinxi_tj_timuleixing());
    }
    @GetMapping("/timuxinxi_tj_timunandu")
    public Result timuxinxi_tj_timunandu() {
        return Result.success(timuxinxiService.timuxinxi_tj_timunandu());
    }
    

    @PostMapping("/deleteList")
    public Result<Timuxinxi> deleteList(@RequestBody TimuxinxiVo timuxinxi) {
        timuxinxiService.deleteList(timuxinxi.getList());
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        timuxinxiService.delete(id);
        return Result.success();
    }

    @PutMapping
    public Result update(@RequestBody TimuxinxiVo timuxinxi) {
        timuxinxiService.update(timuxinxi);
        return Result.success();
    }

    @GetMapping("update/{id}")
    public Result update2(@PathVariable Integer id) {
//        Timuxinxi timuxinxi = new Timuxinxi();
//        timuxinxi.setId(id);
//        timuxinxi.setDianzanshu(dianzanshu);
        Timuxinxi timuxinxi = timuxinxiService.findById(id);
        timuxinxi.setDianzanshu(Integer.parseInt(timuxinxi.getDianzanshu())-1+"");
        timuxinxiService.updateById(timuxinxi);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Timuxinxi> detail(@PathVariable Integer id) {
        Timuxinxi timuxinxi = timuxinxiService.findById(id);
        return Result.success(timuxinxi);
    }

    @GetMapping
    public Result<List<Timuxinxi>> all() {
        return Result.success(timuxinxiService.list());
    }

    @PostMapping("/page")
    public Result<TimuxinxiVo> page(@RequestBody TimuxinxiVo timuxinxiVo) {
        return Result.success(timuxinxiService.findPage(timuxinxiVo));
    }
}
