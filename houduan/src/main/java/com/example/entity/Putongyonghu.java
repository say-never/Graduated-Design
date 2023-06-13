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
	
	@TableField(value = "zhanghao")	private String zhanghao;	@TableField(value = "mima")	private String mima;	@TableField(value = "gerenmingcheng")	private String gerenmingcheng;	@TableField(value = "xingbie")	private Boolean xingbie;	@TableField(value = "zhuangtai")	private String zhuangtai;	@TableField(value = "youxiang")	private String youxiang;	@TableField(value = "xingqu")	private String xingqu;	@TableField(value = "jianjie")	private String jianjie;	@TableField(value = "gerentouxiang")	private String gerentouxiang;	@TableField(exist = false)	private String newPassword;	
    
	
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
    }	public String getMima() {
        return mima;
    }
    public void setMima(String mima) {
		this.mima = mima;
    }	public String getGerenmingcheng() {
        return gerenmingcheng;
    }
    public void setGerenmingcheng(String gerenmingcheng) {
		this.gerenmingcheng = gerenmingcheng;
    }	public Boolean getXingbie() {
        return xingbie;
    }
    public void setXingbie(Boolean xingbie) {
		this.xingbie = xingbie;
    }	public String getZhuangtai() {
        return zhuangtai;
    }
    public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
    }	public String getYouxiang() {
        return youxiang;
    }
    public void setYouxiang(String youxiang) {
		this.youxiang = youxiang;
    }	public String getXingqu() {
        return xingqu;
    }
    public void setXingqu(String xingqu) {
		this.xingqu = xingqu;
    }	public String getJianjie() {
        return jianjie;
    }
    public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
    }	public String getGerentouxiang() {
        return gerentouxiang;
    }
    public void setGerentouxiang(String gerentouxiang) {
		this.gerentouxiang = gerentouxiang;
    }	public String getNewPassword() {
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