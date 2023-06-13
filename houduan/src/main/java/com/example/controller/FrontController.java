package com.example.controller;
import com.example.exception.CustomException;
import com.example.common.Result;
import com.example.common.ResultCode;
import com.example.entity.*;
import com.example.service.*;
import com.example.service.impl.CollectServiceImpl;
import com.example.vo.PinglunVo;
import com.example.vo.PutongyonghuVo;
import com.example.vo.TimuxinxiVo;


import com.example.vo.XinwentongzhiVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping(value = "/front")
public class FrontController {
    @Autowired
private PutongyonghuService  putongyonghuService;
@Autowired
private TimuxinxiService  timuxinxiService;
    @Autowired
    private PinglunService pinglunService;
    
    @Autowired
    private XinwentongzhiService  xinwentongzhiService;
    @Autowired
    private LiuyanbanService liuyanbanService;
    @Resource
    private CollectServiceImpl collectService;

	@PostMapping("/zhuceputongyonghu")
public Result zhuceputongyonghu(@RequestBody Putongyonghu putongyonghu) {
putongyonghuService.add(putongyonghu);
return Result.success();
}
@PostMapping("/findputongyonghuzhanghao")
public Result findputongyonghuzhanghao(@RequestBody Putongyonghu putongyonghu) {
putongyonghuService.findUsername(putongyonghu);
return Result.success();
}
@PostMapping("/loginputongyonghu")
public Result loginputongyonghu(@RequestBody Putongyonghu putongyonghu) {
return Result.success(putongyonghuService.login(putongyonghu));
}
@GetMapping("/gettimuxinxidetail/{id}")
public Result gettimuxinxidetail(@PathVariable Integer id) {
	return Result.success(timuxinxiService.findById(id));
}
@PostMapping("/timuxinxi")
public Result<TimuxinxiVo> timuxinxi(@RequestBody TimuxinxiVo timuxinxiVo) {
return Result.success(timuxinxiService.findPage(timuxinxiVo));
}


    @GetMapping("/xinwentongzhi")
    public Result xinwentongzhi() {
        return Result.success(xinwentongzhiService.list());
    }

    @GetMapping("/getxinwentongzhi/{id}")
    public Result getxinwentongzhi(@PathVariable Integer id) {
        return Result.success(xinwentongzhiService.findById(id));
    }
    @PostMapping("/addLiuyan")
    public Result addComment(@RequestBody Liuyanban liuyanban) {
        liuyanbanService.add(liuyanban);
        return Result.success();
    }

    @GetMapping("/getLiuyan")
    public Result<List<Liuyanban>> getCommentTiezi() {
        return Result.success(liuyanbanService.getLiuyan());
    }
    @PostMapping("/addCollect")
    public Result addCollect(@RequestBody Collect collect) {
        Collect collect1 = collectService.add(collect);
        if(collect1  == null){
            return Result.success("请勿重复收藏");
        }
        return Result.success();
    }
    @DeleteMapping("/deleteCollect/{id}")
    public Result deleteCollect(@PathVariable Integer id) {
        collectService.delete(id);
        return Result.success();
    }
    @DeleteMapping("/deleteCollect/{id}/{userId}")
    public Result deleteCollect(@PathVariable Integer id,@PathVariable Integer userId) {
        collectService.deleteByUserId(id,userId);
        return Result.success();
    }
    @PostMapping("/getUserCollect")
    public Result getUserCollect(@RequestBody Collect collect) {
        return Result.success(collectService.findFrontPages(collect.getUserId()));
    }
    @PostMapping("/postpinglun")
    public Result<Pinglun> postpinglun(@RequestBody Pinglun pinglun) {
        return Result.success(pinglunService.add(pinglun));
    }
    @PostMapping("/pinglun")
    public Result<PinglunVo> pinglun(@RequestBody PinglunVo pinglunVo) {
        return Result.success(pinglunService.findPage(pinglunVo));
    }

}
