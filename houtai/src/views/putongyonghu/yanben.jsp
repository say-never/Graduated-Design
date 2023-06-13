<template>
	<div>
		<el-form :inline="true" :model="formInline" class="user-search">
			<el-form-item label=""><el-input size="small" v-model="formInline.zhanghao" placeholder="�����˺�"></el-input></el-form-item>			<el-form-item label=""><el-input size="small" v-model="formInline.gerenmingcheng" placeholder="�����������"></el-input></el-form-item>			<el-form-item styxlexulxie5  prop="zhuangtai"><el-select size="small" v-model="formInline.zhuangtai" placeholder="��ѡ��״̬"><el-option selected label="��ѡ��״̬" value=""></el-option><el-option label="����ҵ" value="����ҵ"></el-option><el-option label="��ְ" value="��ְ"></el-option></el-select></el-form-item>			
			<el-form-item>
				<el-button size="small" type="primary" icon="el-icon-search" @click="search">����</el-button>
			</el-form-item>
		</el-form>
		<el-table size="small" :data="listData" highlight-current-row v-loading="loading" border element-loading-text="ƴ��������" @selection-change="handleSelectionChange">
			<el-table-column align="center" type="selection" width="60"></el-table-column>
			<el-table-column sortable prop="zhanghao" label="�˺�"></el-table-column>			<el-table-column sortable prop="mima" label="����"></el-table-column>			<el-table-column sortable prop="gerenmingcheng" label="��������"></el-table-column>			<el-table-column sortable prop="xingbie" label="�Ա�"></el-table-column>			<el-table-column sortable prop="zhuangtai" label="״̬"></el-table-column>			<el-table-column sortable prop="youxiang" label="����"></el-table-column>			<el-table-column sortable prop="xingqu" label="��Ȥ"></el-table-column>			<el-table-column align='center' sortable prop='gerentouxiang' label='����ͷ��' width='120'><template slot-scope='scope'><el-image :src='scope.row.gerentouxiang' style='height:70px'/></template></el-table-column>			
			<el-table-column sortable prop="addtime" label="���ʱ��" width="160">
				<template slot-scope="scope">
					<div>{{scope.row.addtime|datePipe('yyyy-MM-dd hh:mm:ss')}}</div>
				</template>
			</el-table-column>
			
			<el-table-column align="center" label="����" min-width="160">
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
			loading: false, //����ʾ����
			title: '',
			editFormVisible: false, //���Ʊ༭ҳ����ʾ������
			
			editForm: {
			},
			user:[],
			
			rules: {
				zhanghao: [{ required: true, message: '�������˺�', trigger: 'blur' },				],				mima: [{ required: true, message: '����������', trigger: 'blur' },				],				
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
				// ·�ɷ����仯ҳ��ˢ��
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
							
							// ��ҳ��ֵ
							this.pageparm.currentPage = this.formInline.current
							this.pageparm.pageSize = this.formInline.currentNum
							this.pageparm.total = res.data.total
						}
					})
					.catch(err => {
						this.loading = false
						this.$message.error('�˵�����ʧ�ܣ����Ժ����ԣ�')
					})
		},
		//qixuzhijixsuan3
		// ��ҳ����¼�
		callFather(parm) {
			this.formInline.current = parm.currentPage
			this.getdata(this.formInline)
		},
		//xia2sui1
		// �����¼�
		search() {
			this.getdata(this.formInline)
		},
		//��ʾ�༭����
		handleEdit: function (index, row) {
			this.editFormVisible = true
			if (row != undefined && row != 'undefined') {
				this.title = '�޸���ͨ�û�'
				this.editForm = row
			} else {
				this.title = '�����ͨ�û�'
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
		// �༭������ҳ�汣�淽��
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
									message: '��ͨ�û��޸ĳɹ���'
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
								this.$message.error('����ʧ�ܣ����Ժ����ԣ�')
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
									message: '��ͨ�û���ӳɹ���'
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
								this.$message.error('����ʧ�ܣ����Ժ����ԣ�')
							}
						})
					}
				} else {
					return false
				}
			})
		},
		// ɾ����˾
		
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
					this.$message.error('�ϴ�ͼƬֻ���� JPG ��ʽ!');
				}
				if (!isLt2M) {
					this.$message.error('�ϴ�ͼƬ��С���ܳ��� 2MB!');
				}
				return isJPG && isLt2M;
			},				
		// �رձ༭�����ӵ�����
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
