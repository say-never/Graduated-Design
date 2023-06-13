import request from '@/utils/request';

export function useMenuApi() {
	return {
		getMenuGuanliyuan: (params) => {
			// 本地数据，路径：`/public/xxx.json`
			return request({
				url: './guanliyuan.json',
				method: 'get',
				params,
			});

		},
		getMenuPutongyonghu: (params) => {
			return request({
				url: './putongyonghu.json',
				method: 'get',
				params,
			});
		},
		
	};
}
