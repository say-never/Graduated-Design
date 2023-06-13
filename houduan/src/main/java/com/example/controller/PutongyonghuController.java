package com.example.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.example.common.Result;
import com.example.common.ResultCode;
import com.example.entity.Putongyonghu;
import com.example.exception.CustomException;
import com.example.service.PutongyonghuService;
import com.example.utils.MapWrapperUtils;
import com.example.utils.jwt.JwtUtil;
import com.example.vo.PutongyonghuVo;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/putongyonghu")
public class PutongyonghuController {

    @Resource
    private PutongyonghuService putongyonghuService;

    @PostMapping
    public Result<Putongyonghu> add(@RequestBody PutongyonghuVo putongyonghu) {
        putongyonghuService.add(putongyonghu);
           return Result.success(putongyonghu);
    }
	
	

    @PostMapping("/deleteList")
    public Result<Putongyonghu> deleteList(@RequestBody PutongyonghuVo putongyonghu) {
        putongyonghuService.deleteList(putongyonghu.getList());
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        putongyonghuService.delete(id);
        return Result.success();
    }

    @PutMapping
    public Result update(@RequestBody PutongyonghuVo putongyonghu) {
        putongyonghuService.update(putongyonghu);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Putongyonghu> detail(@PathVariable Integer id) {
        Putongyonghu putongyonghu = putongyonghuService.findById(id);
        return Result.success(putongyonghu);
    }

    @GetMapping
    public Result<List<Putongyonghu>> all() {
        return Result.success(putongyonghuService.list());
    }

    @PostMapping("/page")
    public Result<PutongyonghuVo> page(@RequestBody PutongyonghuVo putongyonghuVo) {
        return Result.success(putongyonghuService.findPage(putongyonghuVo));
    }
	    @PostMapping("/login")
    public Result login(@RequestBody Putongyonghu putongyonghu, HttpServletRequest request) {
        if (StrUtil.isBlank(putongyonghu.getZhanghao()) || StrUtil.isBlank(putongyonghu.getMima())) {
            throw new CustomException(ResultCode.PARAM_LOST_ERROR);
        }
        Putongyonghu login = putongyonghuService.login(putongyonghu);
//        if(!login.getStatus()){
//            return Result.error("1001","状态限制，无法登录系统");
//        }
        if(login != null) {
            HashMap hashMap = new HashMap();
            hashMap.put("user", login);
            Map<String, Object> map = MapWrapperUtils.builder(MapWrapperUtils.KEY_USER_ID,putongyonghu.getId());
            String token = JwtUtil.creatToken(map);
            hashMap.put("token", token);
            return Result.success(hashMap);
        }else {
            return Result.error();
        }
    }
    @PutMapping("/updatePassword")
    public Result updatePassword(@RequestBody Putongyonghu info, HttpServletRequest request) {
        Putongyonghu putongyonghu = putongyonghuService.findById(info.getId());
        String oldPassword = SecureUtil.md5(info.getMima());
        if (!oldPassword.equals(putongyonghu.getMima())) {
            return Result.error(ResultCode.PARAM_PASSWORD_ERROR.code, ResultCode.PARAM_PASSWORD_ERROR.msg);
        }
        info.setMima(SecureUtil.md5(info.getNewPassword()));
        Putongyonghu putongyonghu1 = new Putongyonghu();
        BeanUtils.copyProperties(info, putongyonghu1);
        putongyonghuService.update(putongyonghu1);
        return Result.success();
    }
}
