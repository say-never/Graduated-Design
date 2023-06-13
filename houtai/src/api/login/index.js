import request from '@/utils/request';

export const login =(params) => {
	if(params.role == '管理员'){return request({url: '/guanliyuan/login',method: 'post',data: {yonghuming:params.username,mima:params.password},});}
	else if(params.role == '普通用户'){return request({url: '/putongyonghu/login',method: 'post',data: {zhanghao:params.username,mima:params.password},});}
	
	
}