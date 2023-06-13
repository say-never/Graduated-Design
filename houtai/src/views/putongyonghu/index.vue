<template>
	<div>
		<el-form :inline="true" :model="formInline" class="user-search">
			<el-form-item label=""><el-input size="small" v-model="formInline.zhanghao" placeholder="输入账号"></el-input></el-form-item>			<el-form-item label=""><el-input size="small" v-model="formInline.gerenmingcheng" placeholder="输入个人名称"></el-input></el-form-item>			<el-form-item styxlexulxie5  prop="zhuangtai"><el-select size="small" v-model="formInline.zhuangtai" placeholder="请选择状态"><el-option selected label="请选择状态" value=""></el-option><el-option label="待就业" value="待就业"></el-option><el-option label="在职" value="在职"></el-option></el-select></el-form-item>			
			<el-form-item>
				<el-button size="small" type="primary" icon="el-icon-search" @click="search">搜索</el-button>
				<el-button size="small" type="primary" icon="el-icon-plus" @click="handleEdit()" >添加</el-button>
				
				<el-button size="small" type="danger" icon="el-icon-delete" @click="handleDeleteList()" v-if="userInfo.roles[0] == 'guanliyuan'">批量删除</el-button>
			</el-form-item>
		</el-form>
		<el-table size="small" :data="listData" highlight-current-row v-loading="loading" border element-loading-text="拼命加载中" @selection-change="handleSelectionChange">
			<el-table-column align="center" type="selection" width="60"></el-table-column>
			<el-table-column sortable prop="zhanghao" label="账号"></el-table-column>			<el-table-column sortable prop="gerenmingcheng" label="个人名称"></el-table-column>			<el-table-column align="center" sortable prop="xingbie" label="性别" ><template slot-scope="scope"><el-switch v-model="scope.row.xingbie ? true : false" active-color="#13ce66" active-text="男" inactive-text="女" inactive-color="#ff4949" @change="editxingbie(scope.$index, scope.row)"></el-switch></template></el-table-column><el-table-column sortable prop="zhuangtai" label="状态"></el-table-column>			<el-table-column sortable prop="youxiang" label="邮箱"></el-table-column>			<el-table-column sortable prop="xingqu" label="兴趣"></el-table-column>			<el-table-column align='center' sortable prop='gerentouxiang' label='个人头像' width='120'><template slot-scope='scope'><el-image :src='scope.row.gerentouxiang' style='height:70px'/></template></el-table-column>			
			<el-table-column sortable prop="addtime" label="添加时间" width="160">
				<template slot-scope="scope">
					<div>{{scope.row.addtime|datePipe('yyyy-MM-dd hh:mm:ss')}}</div>
				</template>
			</el-table-column>
			
			<el-table-column align="center" label="操作" min-width="160">
				<template slot-scope="scope">
					
					<!--liangbuan-->
					<el-button size="mini" type="success" @click="handleEdit(scope.$index, scope.row)" v-if="userInfo.roles[0] == 'guanliyuan' ">编辑</el-button>
					<el-button size="mini" type="danger" @click="deletePutongyonghu(scope.$index, scope.row)" v-if="userInfo.roles[0] == 'guanliyuan' ">删除</el-button>
					<el-button size='mini' type='primary' @click="handleDetail(scope.$index, scope.row)">详细</el-button>
					
				</template>
			</el-table-column>
		</el-table>
		<Pagination v-bind:child-msg="pageparm" @callFather="callFather"></Pagination>
		
		<el-dialog :title="title" :visible.sync="editFormVisible" width="30%" @click="closeDialog">
			<el-form label-width="120px" :model="editForm" :rules="rules" ref="editForm">
				<el-form-item  label="账号" prop="zhanghao"><el-input size="small" v-model="editForm.zhanghao" auto-complete="off" placeholder="请输入账号" style='width:50%'></el-input></el-form-item>				<el-form-item  label="个人名称" prop="gerenmingcheng"><el-input size="small" v-model="editForm.gerenmingcheng" auto-complete="off" placeholder="请输入个人名称" style='width:50%'></el-input></el-form-item>		<el-form-item  label="性别" prop="xingbie"><el-radio v-model="editForm.xingbie" :label=true>男</el-radio><el-radio v-model="editForm.xingbie" :label=false>女</el-radio></el-form-item>		<el-form-item  label='状态' prop="zhuangtai"><el-select size="small" v-model="editForm.zhuangtai" placeholder="请选择状态"><el-option selected label="请选择状态" value=""></el-option><el-option label="待就业" value="待就业"></el-option><el-option label="在职" value="在职"></el-option></el-select></el-form-item>		<el-form-item  label="邮箱" prop="youxiang"><el-input size="small" v-model="editForm.youxiang" auto-complete="off" placeholder="请输入邮箱" style='width:50%'></el-input></el-form-item>		<el-form-item  label="兴趣" prop="xingqu"><el-input size="small" v-model="editForm.xingqu" auto-complete="off" placeholder="请输入兴趣" style='width:50%'></el-input></el-form-item>		<el-form-item  label="简介" prop="jianjie"><el-input type="textarea" size="small" v-model="editForm.jianjie" auto-complete="off" placeholder="请输入简介" style='width:100%'></el-input></el-form-item>		<el-form-item  label='个人头像' prop='gerentouxiang'><el-upload class='avatar-uploader' action='http://localhost:9999/files/upload' :headers='headers' :show-file-list='false' :on-success='handleGerentouxiangSuccess' :before-upload='beforeGerentouxiangUpload'><img v-if='editForm.gerentouxiang' :src='editForm.gerentouxiang' class='avatar'><i v-else class='el-icon-plus avatar-uploader-icon'></i></el-upload></el-form-item>		
				
			</el-form>
			<div slot="footer" class="dialog-footer">
				<el-button size="small" @click="closeDialog">取消</el-button>
				<el-button size="small" type="primary" :loading="loading" class="title" @click="submitForm('editForm')">保存</el-button>
			</div>
		</el-dialog>
			
			
			<el-dialog :title="title" :visible.sync="detailFormVisible" width="60%" @click="closeDialogdetail">
			<table width="100%" border="0"  align="center" cellpadding="3" cellspacing="1" class="table table-striped table-bordered table-hover">
								<tr>
									<td width='11%' height=44>账号：</td><td width='39%'>{{editForm.zhanghao}}</td><td  rowspan=7 align=center><el-upload class='avatar-uploader'  :headers='headers' :show-file-list='false'  ><img v-if='editForm.gerentouxiang' :src='editForm.gerentouxiang' class='avatar'><i v-else class='el-icon-plus avatar-uploader-icon'></i></el-upload></td></tr><tr><td width='11%' height=44>密码：</td><td width='39%'>{{editForm.mima}}</td></tr><tr><td width='11%' height=44>个人名称：</td><td width='39%'>{{editForm.gerenmingcheng}}</td></tr><tr><td width='11%' height=44>性别：</td><td width='39%'>{{editForm.xingbie}}</td></tr><tr><td width='11%' height=44>状态：</td><td width='39%'>{{editForm.zhuangtai}}</td></tr><tr><td width='11%' height=44>邮箱：</td><td width='39%'>{{editForm.youxiang}}</td></tr><tr><td width='11%' height=44>兴趣：</td><td width='39%'>{{editForm.xingqu}}</td></tr><tr><td width='11%' height=100  >简介：</td><td width='39%' colspan=2 height=100 >{{editForm.jianjie}}</td></tr>
							</table>
			


			<div slot="footer" class="dialog-footer">
				<el-button size="small" @click="closeDialogdetail">关闭</el-button>

			</div>
		</el-dialog>
	</div>
</template>

<script>
import Pagination from "@/layout/pagination/Pagination";
import { putongyonghuList, putongyonghuSave, putongyonghuDelete,putongyonghuEdit,putongyonghuDeleteList } from '@/api/putongyonghu/putongyonghuApi';


import {Session} from "@/utils/storage";
export default {
	name: 'user',
	data() {
		return {
			loading: false, //是显示加载
			title: '',
			
			editFormVisible: false, //控制编辑页面显示与隐藏
			detailFormVisible: false,
			
			
			editForm: {
			},
			user:[],
			
			rules: {
				zhanghao: [{ required: true, message: '请输入账号', trigger: 'blur' },				],				mima: [{ required: true, message: '请输入密码', trigger: 'blur' },				],				
			},
			
			formInline: {
				page: 1,
				limit: 10,
			},
			
			
			listData: [],
			putongyonghus:[],
			
			checkmenu: [],
			pageparm: {
				currentPage: 1,
				pageSize: 10,
				total: 0
			}
		};
	},
	computed:{
		headers(){
			return {"token":Session.get("token")}
		}
	},
	watch: {
			'$route' (to, from) {
				// 路由发生变化页面刷新
				this.$router.go(0);
			}
		},
	components: {
		Pagination
	},
	created() {
		
		if (!Session.get('userInfo')) return false;
		this.userInfo = Session.get('userInfo');
		
		this.getdata(this.formInline)
		
	},
	methods: {
		getdata(parameter) {
			putongyonghuList(parameter)
					.then(res => {
						this.loading = false
						if (res.success == false) {
							this.$message({
								type: 'info',
								message: res.msg
							})
						} else {
							this.listData = res.data.list
							
							
							
							// 分页赋值
							this.pageparm.currentPage = this.formInline.current
							this.pageparm.pageSize = this.formInline.currentNum
							this.pageparm.total = res.data.total
						}
					})
					.catch(err => {
						this.loading = false
						this.$message.error('菜单加载失败，请稍后再试！')
					})
		},
		
		// 分页插件事件
		callFather(parm) {
			this.formInline.current = parm.currentPage
			this.getdata(this.formInline)
		},
		
		// 搜索事件
		search() {
			this.getdata(this.formInline)
		},
		//显示编辑界面
		handleEdit: function (index, row) {
			this.editFormVisible = true
			if (row != undefined && row != 'undefined') {
				this.title = '修改普通用户'
				this.editForm = row
			} else {
				this.title = '添加普通用户'
				this.editForm = {}
				
				
			}
		},
		
		handleDetail: function (index, row) {
			this.detailFormVisible = true
			if (row != undefined && row != 'undefined') {
				this.title = '普通用户详细'
				this.editForm = row
			}
		},
		closeDialogdetail() {
				this.getdata(this.formInline)
				this.detailFormVisible = false
			},
		//liangbuedit
		// 编辑、增加页面保存方法
		submitForm(editData) {
			this.$refs[editData].validate(valid => {
				if (valid) {
					if(this.editForm.id){
						putongyonghuEdit(this.editForm).then(res => {
							this.editFormVisible = false
							
							this.loading = false
							if (res.code == '0') {
								this.getdata(this.formInline)
								this.$message({
									type: 'success',
									message: '普通用户修改成功！'
								})
							} else {
								this.$message({
									type: 'info',
									message: res.msg
								})
							}
						}).catch(err => {
							this.editFormVisible = false
							this.loading = false
							this.getdata(this.formInline)
						if(err){
								this.$message.error(err)
							}else {
								this.$message.error('操作失败，请稍后再试！')
							}
						})
					}else {
						putongyonghuSave(this.editForm).then(res => {
							this.editFormVisible = false
							this.loading = false
							if (res.code == '0') {
								
								this.getdata(this.formInline)
								this.$message({
									type: 'success',
									message: '普通用户添加成功！'
								})
							} else {
								this.$message({
									type: 'info',
									message: res.msg
								})
							}
						}).catch(err => {
							this.editFormVisible = false
							this.loading = false
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
		// 删除公司
		deletePutongyonghu(index, row) {
			this.$confirm('确定要删除吗?', '信息', {
				confirmButtonText: '确定',
				cancelButtonText: '取消',
				type: 'warning'
			}).then(() => {
				putongyonghuDelete(row.id).then(res => {
					if (res.code == '0') {
						this.$message({
								type: 'success',
							message: '普通用户已删除!'
						})
						this.getdata(this.formInline)
					} else {
						this.$message({
							type: 'info',
							message: res.msg
						})
					}
				}).catch(err => {
					this.loading = false
					this.$message.error('操作失败，请稍后再试')
				})
			}).catch(() => {
				this.$message({
					type: 'info',
					message: '已取消删除'
				})
			})
		},
		handleSelectionChange(val){
			this.putongyonghus = val;
		},
		handleDeleteList(){
			const putongyonghus = this.putongyonghus;
			if(putongyonghus.length == 0){
				this.$message({
					type: 'error',
					message: '请至少选择一项进行删除'
				})
			}else {
				this.$confirm('确定要批量删除吗?', '信息', {
					confirmButtonText: '确定',
					cancelButtonText: '取消',
					type: 'warning'
				}).then(() => {
					putongyonghuDeleteList(putongyonghus).then(res => {
						if (res.code == '0') {
							this.$message({
								type: 'success',
								message: '批量删除成功!'
							})
							this.getdata(this.formInline)
						} else {
							this.$message({
								type: 'info',
								message: res.msg
							})
						}
					}).catch(err => {
						this.loading = false
						this.$message.error('操作失败，请稍后再试')
					})
				}).catch(() => {
					this.$message({
						type: 'info',
						message: '已取消删除'
					})
				})
			}
		},
		editxingbie(index,row){
			let data = {...row,xingbie:!row.xingbie}
			putongyonghuEdit(data).then(res => {
				this.editFormVisible = false
				this.loading = false
				if (res.code == '0') {
					this.getdata(this.formInline)
					this.$message({
						type: 'success',
						message: '性别修改成功！'
					})
				} else {
					this.$message({
						type: 'info',
						message: res.msg
					})
				}
			}).catch(err => {
				this.editFormVisible = false
				this.loading = false
				if(err){
					this.$message.error(err)
				}else {
					this.$message.error('操作失败，请稍后再试！')
				}
			})
		},		//xuaxnzeshxifou
		
		
		
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
		//youscwexnjiaxn
		// 关闭编辑、增加弹出框
		closeDialog() {
			this.getdata(this.formInline)
			this.editFormVisible = false
		}
	},
};
</script>

<style scoped lang="scss">
	@import './index.scss';
</style>
