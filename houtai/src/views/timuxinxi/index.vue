<template>
	<div>
		<el-form :inline="true" :model="formInline" class="user-search">
			<el-form-item label=""><el-input size="small" v-model="formInline.timumingcheng" placeholder="输入题目名称"></el-input></el-form-item>
			<el-form-item styxlexulxie2 prop="timubiaoqian"
				><el-select size="small" v-model="formInline.timubiaoqian" placeholder="请选择题目标签"
					><el-option selected label="请选择题目标签" value=""></el-option><el-option label="java" value="java"></el-option
					><el-option label="c" value="c"></el-option><el-option label="go" value="go"></el-option><el-option label="rust" value="rust"></el-option
					><el-option label="c++" value="c++"></el-option></el-select
			></el-form-item>
			<el-form-item styxlexulxie3 prop="timuleixing"
				><el-select size="small" v-model="formInline.timuleixing" placeholder="请选择题目类型"
					><el-option selected label="请选择题目类型" value=""></el-option><el-option label="简答" value="简答"></el-option
					><el-option label="单选" value="单选"></el-option><el-option label="不定项" value="不定项"></el-option
					><el-option label="填空" value="填空"></el-option><el-option label="编程" value="编程"></el-option
					><el-option label="面经" value="面经"></el-option></el-select
			></el-form-item>
			<el-form-item styxlexulxie4 prop="timunandu"
				><el-select size="small" v-model="formInline.timunandu" placeholder="请选择题目难度"
					><el-option selected label="请选择题目难度" value=""></el-option><el-option label="简单" value="简单"></el-option
					><el-option label="中等" value="中等"></el-option><el-option label="困难" value="困难"></el-option></el-select
			></el-form-item>

			<el-form-item>
				<el-button size="small" type="primary" icon="el-icon-search" @click="search">搜索</el-button>
				<el-button size="small" type="primary" icon="el-icon-plus" @click="handleEdit()">添加</el-button>

				<el-button size="small" type="danger" icon="el-icon-delete" @click="handleDeleteList()" v-if="userInfo.roles[0] == 'guanliyuan'"
					>批量删除</el-button
				>
			</el-form-item>
		</el-form>
		<el-table
			size="small"
			:data="listData"
			highlight-current-row
			v-loading="loading"
			border
			element-loading-text="拼命加载中"
			@selection-change="handleSelectionChange"
		>
			<el-table-column align="center" type="selection" width="60"></el-table-column>
			<el-table-column sortable prop="timumingcheng" label="题目名称"></el-table-column>
			<el-table-column sortable prop="timubiaoqian" label="题目标签"></el-table-column>
			<el-table-column sortable prop="timuleixing" label="题目类型"></el-table-column>
			<el-table-column sortable prop="timunandu" label="题目难度"></el-table-column>
			<el-table-column align="center" sortable prop="timuwendang" label="题目文档" width="120"
				><template slot-scope="scope"><el-button @click="download(scope.row)">下载</el-button></template></el-table-column
			>
			<el-table-column sortable prop="shangchuanren" label="上传人"></el-table-column>

			<el-table-column sortable prop="addtime" label="添加时间" width="160">
				<template slot-scope="scope">
					<div>{{ scope.row.addtime | datePipe('yyyy-MM-dd hh:mm:ss') }}</div>
				</template>
			</el-table-column>

			<el-table-column align="center" label="操作" min-width="160">
				<template slot-scope="scope">
					<!--liangbuan-->
					<el-button
						size="mini"
						type="success"
						@click="handleEdit(scope.$index, scope.row)"
						v-if="userInfo.roles[0] == 'guanliyuan' || userInfo.roles[0] == 'putongyonghu'"
						>编辑</el-button
					>
					<el-button
						size="mini"
						type="danger"
						@click="deleteTimuxinxi(scope.$index, scope.row)"
						v-if="userInfo.roles[0] == 'guanliyuan' || userInfo.roles[0] == 'putongyonghu'"
						>删除</el-button
					>
					<el-button size="mini" type="primary" @click="handleDetail(scope.$index, scope.row)">详细</el-button>
					<el-button size="mini" type="info" @click="handleContent(scope.$index, scope.row)">内容设置</el-button>
				</template>
			</el-table-column>
		</el-table>
		<Pagination v-bind:child-msg="pageparm" @callFather="callFather"></Pagination>

		<el-dialog :title="title" :visible.sync="editFormVisible" width="30%" @click="closeDialog">
			<el-form label-width="120px" :model="editForm" :rules="rules" ref="editForm">
				<el-form-item label="题目名称" prop="timumingcheng"
					><el-input size="small" v-model="editForm.timumingcheng" auto-complete="off" placeholder="请输入题目名称" style="width: 50%"></el-input
				></el-form-item>
				<el-form-item label="题目标签" prop="timubiaoqian"
					><el-select size="small" v-model="editForm.timubiaoqian" placeholder="请选择题目标签"
						><el-option selected label="请选择题目标签" value=""></el-option><el-option label="java" value="java"></el-option
						><el-option label="c" value="c"></el-option><el-option label="go" value="go"></el-option><el-option label="rust" value="rust"></el-option
						><el-option label="c++" value="c++"></el-option></el-select
				></el-form-item>
				<el-form-item label="题目类型" prop="timuleixing"
					><el-select size="small" v-model="editForm.timuleixing" placeholder="请选择题目类型"
						><el-option selected label="请选择题目类型" value=""></el-option><el-option label="简答" value="简答"></el-option
						><el-option label="单选" value="单选"></el-option><el-option label="不定项" value="不定项"></el-option
						><el-option label="填空" value="填空"></el-option><el-option label="编程" value="编程"></el-option
						><el-option label="面经" value="面经"></el-option></el-select
				></el-form-item>
				<el-form-item label="题目难度" prop="timunandu"
					><el-select size="small" v-model="editForm.timunandu" placeholder="请选择题目难度"
						><el-option selected label="请选择题目难度" value=""></el-option><el-option label="简单" value="简单"></el-option
						><el-option label="中等" value="中等"></el-option><el-option label="困难" value="困难"></el-option></el-select
				></el-form-item>

				<!-- <el-form-item label="题目解析" prop="timujiexi"
					><el-input
						type="textarea"
						size="small"
						v-model="editForm.timujiexi"
						auto-complete="off"
						placeholder="请输入题目解析"
						style="width: 100%"
					></el-input
				></el-form-item> -->
				<el-form-item label="题目文档" prop="timuwendang"
					><el-upload
						class="avatar-uploader"
						action="http://localhost:9999/files/upload"
						:headers="headers"
						:show-file-list="false"
						:on-success="handleTimuwendangSuccess"
						><el-button>上传</el-button></el-upload
					></el-form-item
				>
				<el-form-item label="上传人" prop="shangchuanren"
					><el-input
						size="small"
						v-model="editForm.shangchuanren"
						auto-complete="off"
						placeholder="请输入上传人"
						style="width: 50%"
						disabled
					></el-input
				></el-form-item>
			</el-form>
			<div slot="footer" class="dialog-footer">
				<el-button size="small" @click="closeDialog">取消</el-button>
				<el-button size="small" type="primary" :loading="loading" class="title" @click="submitForm('editForm')">保存</el-button>
			</div>
		</el-dialog>

		<!--xiangxidhk-->
	</div>
</template>

<script>
import Pagination from '@/layout/pagination/Pagination';
import { timuxinxiList, timuxinxiSave, timuxinxiDelete, timuxinxiEdit, timuxinxiDeleteList } from '@/api/timuxinxi/timuxinxiApi';

import { Session } from '@/utils/storage';
export default {
	name: 'user',
	data() {
		return {
			loading: false, //是显示加载
			title: '',

			editFormVisible: false, //控制编辑页面显示与隐藏
			//detaitFormVsisisble

			editForm: {},
			user: [],

			rules: {
				timumingcheng: [{ required: true, message: '请输入题目名称', trigger: 'blur' }],
			},

			formInline: {
				page: 1,
				limit: 10,
			},

			listData: [],
			timuxinxis: [],

			checkmenu: [],
			pageparm: {
				currentPage: 1,
				pageSize: 10,
				total: 0,
			},
		};
	},
	computed: {
		headers() {
			return { token: Session.get('token') };
		},
	},
	watch: {
		$route(to, from) {
			// 路由发生变化页面刷新
			this.$router.go(0);
		},
	},
	components: {
		Pagination,
	},
	created() {
		if (!Session.get('userInfo')) return false;
		this.userInfo = Session.get('userInfo');
		if (this.userInfo.roles[0] == 'putongyonghu') {
			this.formInline.shangchuanren = this.userInfo.zhanghao;
		}

		this.getdata(this.formInline);
	},
	methods: {
		getdata(parameter) {
			timuxinxiList(parameter)
				.then((res) => {
					this.loading = false;
					if (res.success == false) {
						this.$message({
							type: 'info',
							message: res.msg,
						});
					} else {
						this.listData = res.data.list;

						// 分页赋值
						this.pageparm.currentPage = this.formInline.current;
						this.pageparm.pageSize = this.formInline.currentNum;
						this.pageparm.total = res.data.total;
					}
				})
				.catch((err) => {
					this.loading = false;
					this.$message.error('菜单加载失败，请稍后再试！');
				});
		},

		// 分页插件事件
		callFather(parm) {
			this.formInline.current = parm.currentPage;
			this.getdata(this.formInline);
		},

		// 搜索事件
		search() {
			this.getdata(this.formInline);
		},
		//显示编辑界面
		handleEdit: function (index, row) {
			this.editFormVisible = true;
			if (row != undefined && row != 'undefined') {
				this.title = '修改题目信息';
				this.editForm = row;
			} else {
				this.title = '添加题目信息';
				this.editForm = {};
				if (this.userInfo.roles[0] == 'putongyonghu') {
					this.editForm.shangchuanren = this.userInfo.zhanghao;
				}
				if (this.userInfo.roles[0] == 'guanliyuan') {
					this.editForm.shangchuanren = this.userInfo.yonghuming;
				}
			}
		},
		handleContent: function (index, row) {
			this.$router.push('/timuxinxi/tinymceEditor/' + row.id);
		},
		handleDetail(index, row) {
			const w = window.open('about:blank');
			w.location.href = 'http://localhost:8080/#/timuxinxidetail/' + row.id;
		},

		//liangbuedit
		// 编辑、增加页面保存方法
		submitForm(editData) {
			this.$refs[editData].validate((valid) => {
				if (valid) {
					if (this.editForm.id) {
						timuxinxiEdit(this.editForm)
							.then((res) => {
								this.editFormVisible = false;

								this.loading = false;
								if (res.code == '0') {
									this.getdata(this.formInline);
									this.$message({
										type: 'success',
										message: '题目信息修改成功！',
									});
								} else {
									this.$message({
										type: 'info',
										message: res.msg,
									});
								}
							})
							.catch((err) => {
								this.editFormVisible = false;
								this.loading = false;
								this.getdata(this.formInline);
								if (err) {
									this.$message.error(err);
								} else {
									this.$message.error('操作失败，请稍后再试！');
								}
							});
					} else {
						timuxinxiSave(this.editForm)
							.then((res) => {
								this.editFormVisible = false;
								this.loading = false;
								if (res.code == '0') {
									this.getdata(this.formInline);
									this.$message({
										type: 'success',
										message: '题目信息添加成功！',
									});
								} else {
									this.$message({
										type: 'info',
										message: res.msg,
									});
								}
							})
							.catch((err) => {
								this.editFormVisible = false;
								this.loading = false;
								if (err) {
									this.$message.error(err);
								} else {
									this.$message.error('操作失败，请稍后再试！');
								}
							});
					}
				} else {
					return false;
				}
			});
		},
		// 删除公司
		deleteTimuxinxi(index, row) {
			this.$confirm('确定要删除吗?', '信息', {
				confirmButtonText: '确定',
				cancelButtonText: '取消',
				type: 'warning',
			})
				.then(() => {
					timuxinxiDelete(row.id)
						.then((res) => {
							if (res.code == '0') {
								this.$message({
									type: 'success',
									message: '题目信息已删除!',
								});
								this.getdata(this.formInline);
							} else {
								this.$message({
									type: 'info',
									message: res.msg,
								});
							}
						})
						.catch((err) => {
							this.loading = false;
							this.$message.error('操作失败，请稍后再试');
						});
				})
				.catch(() => {
					this.$message({
						type: 'info',
						message: '已取消删除',
					});
				});
		},
		handleSelectionChange(val) {
			this.timuxinxis = val;
		},
		handleDeleteList() {
			const timuxinxis = this.timuxinxis;
			if (timuxinxis.length == 0) {
				this.$message({
					type: 'error',
					message: '请至少选择一项进行删除',
				});
			} else {
				this.$confirm('确定要批量删除吗?', '信息', {
					confirmButtonText: '确定',
					cancelButtonText: '取消',
					type: 'warning',
				})
					.then(() => {
						timuxinxiDeleteList(timuxinxis)
							.then((res) => {
								if (res.code == '0') {
									this.$message({
										type: 'success',
										message: '批量删除成功!',
									});
									this.getdata(this.formInline);
								} else {
									this.$message({
										type: 'info',
										message: res.msg,
									});
								}
							})
							.catch((err) => {
								this.loading = false;
								this.$message.error('操作失败，请稍后再试');
							});
					})
					.catch(() => {
						this.$message({
							type: 'info',
							message: '已取消删除',
						});
					});
			}
		},
		//xuaxnzeshxifou

		handleTimuwendangSuccess(res, file) {
			if (res.code == '0') {
				this.editForm.timuwendang = '/files/download/' + res.data.id;
			}
		},
		download(data) {
			location.href = data.timuwendang;
		},
		//youscwexnjiaxn
		// 关闭编辑、增加弹出框
		closeDialog() {
			this.getdata(this.formInline);
			this.editFormVisible = false;
		},
	},
};
</script>

<style scoped lang="scss">
@import './index.scss';
</style>
