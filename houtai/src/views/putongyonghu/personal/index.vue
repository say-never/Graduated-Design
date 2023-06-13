<template>
	<div class="personal">
		<el-form label-width="80px" ref="editForm" :model="editForm" :rules="rules">
			<el-form-item  label="账号" prop="zhanghao"><el-input size="small" v-model="editForm.zhanghao" auto-complete="off" placeholder="请输入账号" style='width:25%'></el-input></el-form-item>				<el-form-item  label="个人名称" prop="gerenmingcheng"><el-input size="small" v-model="editForm.gerenmingcheng" auto-complete="off" placeholder="请输入个人名称" style='width:25%'></el-input></el-form-item>		<el-form-item  label="性别" prop="xingbie"><el-radio v-model="editForm.xingbie" :label=true>男</el-radio><el-radio v-model="editForm.xingbie" :label=false>女</el-radio></el-form-item>		<el-form-item  label='状态' prop="zhuangtai"><el-select size="small" v-model="editForm.zhuangtai" placeholder="请选择状态"><el-option selected label="请选择状态" value=""></el-option><el-option label="待就业" value="待就业"></el-option><el-option label="在职" value="在职"></el-option></el-select></el-form-item>		<el-form-item  label="邮箱" prop="youxiang"><el-input size="small" v-model="editForm.youxiang" auto-complete="off" placeholder="请输入邮箱" style='width:25%'></el-input></el-form-item>		<el-form-item  label="兴趣" prop="xingqu"><el-input size="small" v-model="editForm.xingqu" auto-complete="off" placeholder="请输入兴趣" style='width:25%'></el-input></el-form-item>		<el-form-item  label="简介" prop="jianjie"><el-input type="textarea" size="small" v-model="editForm.jianjie" auto-complete="off" placeholder="请输入简介" style='width:50%'></el-input></el-form-item>		<el-form-item  label='个人头像' prop='gerentouxiang'><el-upload class='avatar-uploader' action='http://localhost:9999/files/upload' :headers='headers' :show-file-list='false' :on-success='handleGerentouxiangSuccess' :before-upload='beforeGerentouxiangUpload'><img v-if='editForm.gerentouxiang' :src='editForm.gerentouxiang' class='avatar'><i v-else class='el-icon-plus avatar-uploader-icon'></i></el-upload></el-form-item>		
		</el-form>
		<div slot="footer" class="dialog-footer">
			<el-button size="small" type="primary" :loading="loading" class="title" @click="submitForm('editForm')">更新</el-button>
		</div>
	</div>
</template>

<script>
	import {putongyonghuEdit, putongyonghuSave,putongyonghuDetail} from "@/api/putongyonghu/putongyonghuApi";
	import {Session} from "@/utils/storage";

export default {
	name: 'personal',
	data() {
		return {
			rules: {
				zhanghao: [{ required: true, message: '请输入账号', trigger: 'blur' },				],				mima: [{ required: true, message: '请输入密码', trigger: 'blur' },				],				
			},
			editForm: {
				avater:''
			},
		};
	},
	created() {
		this.getDetail()
	},
	computed: {
		headers(){
			return {"token":Session.get("token")}
		},
	},
	methods:{
		getDetail(){
			if (!Session.get('userInfo')) return false;
			this.userInfo = Session.get('userInfo');
			console.log(this.userInfo);
			putongyonghuDetail(this.userInfo.id).then(res=>{
				if (res.code == '0') {
					this.editForm = res.data;
				}
			}).catch(err => {
				if(err){
					this.$message.error(err)
				}else {
					this.$message.error('操作失败，请稍后再试！')
				}
			})
		},
		
		// 编辑、增加页面保存方法
		submitForm(editData) {
			this.$refs[editData].validate(valid => {
				if (valid) {
					if(this.editForm.id){
						putongyonghuEdit(this.editForm).then(res => {
							if (res.code == '0') {
								this.getDetail()
								this.$message({
									type: 'success',
									message: '个人信息修改成功！'
								})
								this.$store.dispatch('userInfos/setUserInfos',this.editForm);
							} else {
								this.$message({
									type: 'info',
									message: res.msg
								})
							}
						}).catch(err => {
							if(err){
								this.$message.error(err)
							}else {
								this.$message.error('操作失败，请稍后再试！')
							}
						})
					}else {
						putongyonghuSave(this.editForm).then(res => {
							if (res.code == '0') {
								this.getDetail()
								this.$message({
									type: 'success',
									message: '个人信息添加成功！'
								})
							} else {
								this.$message({
									type: 'info',
									message: res.msg
								})
							}
						}).catch(err => {
							if(err){
								this.$message.error(err)
							}else {
								this.$message.error('操作失败，请稍后再试！')
							}
						})
					}
				} else {
					return false
				}
			})
		},
		handleGerentouxiangSuccess(res, file) {
				if(res.code == "0") {
					this.editForm.gerentouxiang = "/files/download/"+res.data.id
				}
			},
			beforeGerentouxiangUpload(file) {
				const isJPG = file.type === 'image/jpeg';
				const isLt2M = file.size / 1024 / 1024 < 2;

				if (!isJPG) {
					this.$message.error('上传图片只能是 JPG 格式!');
				}
				if (!isLt2M) {
					this.$message.error('上传图片大小不能超过 2MB!');
				}
				return isJPG && isLt2M;
			},				
	}
};
</script>

<style scoped lang="scss">
	@import './index.scss';
</style>
