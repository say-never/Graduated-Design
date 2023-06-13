package com.example.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@TableName("putongyonghu")
@Data
public class Putongyonghu {
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
	
	@TableField(value = "zhanghao")
    
	
    @TableField(value = "addtime")
    private Date addtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public String getZhanghao() {
        return zhanghao;
    }
    public void setZhanghao(String zhanghao) {
		this.zhanghao = zhanghao;
    }
        return mima;
    }
    public void setMima(String mima) {
		this.mima = mima;
    }
        return gerenmingcheng;
    }
    public void setGerenmingcheng(String gerenmingcheng) {
		this.gerenmingcheng = gerenmingcheng;
    }
        return xingbie;
    }
    public void setXingbie(Boolean xingbie) {
		this.xingbie = xingbie;
    }
        return zhuangtai;
    }
    public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
    }
        return youxiang;
    }
    public void setYouxiang(String youxiang) {
		this.youxiang = youxiang;
    }
        return xingqu;
    }
    public void setXingqu(String xingqu) {
		this.xingqu = xingqu;
    }
        return jianjie;
    }
    public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
    }
        return gerentouxiang;
    }
    public void setGerentouxiang(String gerentouxiang) {
		this.gerentouxiang = gerentouxiang;
    }
        return newPassword;
    }
    public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
    }
	

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtme(Date addtime) {
        this.addtime = addtime;
    }
}