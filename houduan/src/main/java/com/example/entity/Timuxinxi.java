package com.example.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@TableName("timuxinxi")
@Data
public class Timuxinxi {
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
	
	@TableField(value = "timumingcheng")
	private String timumingcheng;
	@TableField(value = "timubiaoqian")
	private String timubiaoqian;
	@TableField(value = "timuleixing")
	private String timuleixing;
	@TableField(value = "timunandu")
	private String timunandu;
	@TableField(value = "timumiaoshu")
	private String timumiaoshu;
	@TableField(value = "timuwendang")
	private String timuwendang;
	@TableField(value = "shangchuanren")
	private String shangchuanren;
    @TableField(value = "dianzanshu")
    private String dianzanshu;
    
	
    @TableField(value = "addtime")
    private Date addtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public String getTimumingcheng() {
        return timumingcheng;
    }
    public void setTimumingcheng(String timumingcheng) {
		this.timumingcheng = timumingcheng;
    }
	public String getTimubiaoqian() {
        return timubiaoqian;
    }
    public void setTimubiaoqian(String timubiaoqian) {
		this.timubiaoqian = timubiaoqian;
    }
	public String getTimuleixing() {
        return timuleixing;
    }
    public void setTimuleixing(String timuleixing) {
		this.timuleixing = timuleixing;
    }
	public String getTimunandu() {
        return timunandu;
    }
    public void setTimunandu(String timunandu) {
		this.timunandu = timunandu;
    }
	public String getTimumiaoshu() {
        return timumiaoshu;
    }
    public void setTimumiaoshu(String timumiaoshu) {
		this.timumiaoshu = timumiaoshu;
    }
	public String getTimuwendang() {
        return timuwendang;
    }
    public void setTimuwendang(String timuwendang) {
		this.timuwendang = timuwendang;
    }
	public String getShangchuanren() {
        return shangchuanren;
    }
    public void setShangchuanren(String shangchuanren) {
		this.shangchuanren = shangchuanren;
    }

    public String getDianzanshu() {
        return dianzanshu;
    }
    public void setDianzanshu(String dianzanshu) {
        this.dianzanshu = dianzanshu;
    }
	
	

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtme(Date addtime) {
        this.addtime = addtime;
    }
}