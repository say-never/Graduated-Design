<template>
	<div>
		<el-form :inline="true" :model="formInline" class="user-search">
			<el-form-item label=""><el-input size="small" v-model="formInline.zhanghao" placeholder="输入账号"></el-input></el-form-item>			<el-form-item label=""><el-input size="small" v-model="formInline.gerenmingcheng" placeholder="输入个人名称"></el-input></el-form-item>			<el-form-item styxlexulxie5  prop="zhuangtai"><el-select size="small" v-model="formInline.zhuangtai" placeholder="请选择状态"><el-option selected label="请选择状态" value=""></el-option><el-option label="待就业" value="待就业"></el-option><el-option label="在职" value="在职"></el-option></el-select></el-form-item>			
			<el-form-item>
				<el-button size="small" type="primary" icon="el-icon-search" @click="search">搜索</el-button>
			</el-form-item>
		</el-form>
		<el-table size="small" :data="listData" highlight-current-row v-loading="loading" border element-loading-text="拼命加载中" @selection-change="handleSelectionChange">
			<el-table-column align="center" type="selection" width="60"></el-table-column>
			<el-table-column sortable prop="zhanghao" label="账号"></el-table-column>			<el-table-column sortable prop="mima" label="密码"></el-table-column>			<el-table-column sortable prop="gerenmingcheng" label="个人名称"></el-table-column>			<el-table-column sortable prop="xingbie" label="性别"></el-table-column>			<el-table-column sortable prop="zhuangtai" label="状态"></el-table-column>			<el-table-column sortable prop="youxiang" label="邮箱"></el-table-column>			<el-table-column sortable prop="xingqu" label="兴趣"></el-table-column>			<el-table-column align='center' sortable prop='gerentouxiang' label='个人头像' width='120'><template slot-scope='scope'><el-image :src='scope.row.gerentouxiang' style='height:70px'/></template></el-table-column>			
			<el-table-column sortable prop="addtime" label="添加时间" width="160">
				<template slot-scope="scope">
					<div>{{scope.row.addtime|datePipe('yyyy-MM-dd hh:mm:ss')}}</div>
				</template>
			</el-table-column>
			
			<el-table-column align="center" label="操作" min-width="160">
				<template slot-scope="scope">
					<!--lianjie1-->
				</template>
			</el-table-column>
		</el-table>
		<Pagination v-bind:child-msg="pageparm" @callFather="callFather"></Pagination>
		
		
			
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
		this.getdata(this.formInline)
		if (!Session.get('userInfo')) return false;
		this.userInfo = Session.get('userInfo');
		
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
		//qixuzhijixsuan3
		// 分页插件事件
		callFather(parm) {
			this.formInline.current = parm.currentPage
			this.getdata(this.formInline)
		},
		//xia2sui1
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
		addSalary(index,row){
				this.$router.push({
					name:'xmkuaixAdd',
					params:{
						id:row.id
					}
				})
			},
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
		
		handleSelectionChange(val){
			this.putongyonghus = val;
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
