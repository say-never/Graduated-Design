import request from '@/utils/request';
// list
export const timuxinxiList = (params) => {
    return request({
        url: '/timuxinxi/page',
        method: 'post',
        data: params,
    })
};
export const timuxinxiDetail = (id) => {
    return request({
        url: '/timuxinxi/'+id,
        method: 'get',
    })
};
// add
export const timuxinxiSave = (params) => {
    return request({
        url: '/timuxinxi',
        method: 'post',
        data: params,
    })
};
// updt
export const timuxinxiEdit = (params) => {
    return request({
        url: '/timuxinxi',
        method: 'put',
        data: params,
    })
};
// delete
export const timuxinxiDelete = (id) => {
    return request({
        url: '/timuxinxi/'+id,
        method: 'delete',
    })
};
// pldel
export const timuxinxiDeleteList = (timuxinxis) => {
    return request({
        url: '/timuxinxi/deleteList',
        data:{list:timuxinxis},
        method: 'post',
    })
};
// all
export const timuxinxiAllList = () => {
    return request({
        url: '/timuxinxi',
        method: 'get',
    })
};

export const timuxinxi_tj_timubiaoqian = () => {return request({url: '/timuxinxi/timuxinxi_tj_timubiaoqian',method: 'get',})};export const timuxinxi_tj_timuleixing = () => {return request({url: '/timuxinxi/timuxinxi_tj_timuleixing',method: 'get',})};export const timuxinxi_tj_timunandu = () => {return request({url: '/timuxinxi/timuxinxi_tj_timunandu',method: 'get',})};