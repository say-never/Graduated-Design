import request from '@/utils/request';
// list
export const putongyonghuList = (params) => {
    return request({
        url: '/putongyonghu/page',
        method: 'post',
        data: params,
    })
};
export const putongyonghuDetail = (id) => {
    return request({
        url: '/putongyonghu/'+id,
        method: 'get',
    })
};
// add
export const putongyonghuSave = (params) => {
    return request({
        url: '/putongyonghu',
        method: 'post',
        data: params,
    })
};
// updt
export const putongyonghuEdit = (params) => {
    return request({
        url: '/putongyonghu',
        method: 'put',
        data: params,
    })
};
// delete
export const putongyonghuDelete = (id) => {
    return request({
        url: '/putongyonghu/'+id,
        method: 'delete',
    })
};
// pldel
export const putongyonghuDeleteList = (putongyonghus) => {
    return request({
        url: '/putongyonghu/deleteList',
        data:{list:putongyonghus},
        method: 'post',
    })
};
// all
export const putongyonghuAllList = () => {
    return request({
        url: '/putongyonghu',
        method: 'get',
    })
};
export const putongyonghuUpdatePassword = (params) =>{ return request({ url: `/putongyonghu/updatePassword`, method: 'put',data: {...params,mima:params.password}, })};
