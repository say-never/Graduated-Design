
import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const routes = [

  {
    path: '/',
    name: 'xinwentongzhi',
    component: () => import('../views/xinwentongzhi.vue')
  },
  {
    path: '/error',
    name: 'Error',
    component: () => import('../components/Error.vue')
  },
  {
    path: '/xinwentongzhidetail/:id',
    name: 'xinwentongzhidetail',
    component: () => import('../views/xinwentongzhidetail.vue')
  },
  {
    path: '/xinwentongzhi',
    name: 'xinwentongzhi',
    component: () => import('../views/xinwentongzhi.vue')
  },

  {
    path: '/timuxinxidetail/:id',
    name: 'timuxinxidetail',
    component: () => import('../views/timuxinxidetail.vue')
  },
  {
    path: '/timuxinxi',
    name: 'timuxinxi',
    component: () => import('../views/timuxinxi.vue')
  },
  {
    path: '/collect',
    name: 'Collect',
    component: () => import('../views/Collect.vue'),
    meta: {
      requireAuth: true // 需要验证登录状态
    }
  },

  {
    path: '/liuyan',
    name: 'Liuyan',
    component: () => import('../views/Liuyan.vue'),
    meta: {
      requireAuth: true // 需要验证登录状态
    }
  },


]

const router = new Router({
  routes
})

/* 由于Vue-router在3.1之后把$router.push()方法改为了Promise。所以假如没有回调函数，错误信息就会交给全局的路由错误处理。
vue-router先报了一个Uncaught(in promise)的错误(因为push没加回调) ，然后再点击路由的时候才会触发NavigationDuplicated的错误(路由出现的错误，全局错误处理打印了出来)。*/
// 禁止全局路由错误处理打印
const originalPush = Router.prototype.push;
Router.prototype.push = function push(location, onResolve, onReject) {
  if (onResolve || onReject)
    return originalPush.call(this, location, onResolve, onReject)
  return originalPush.call(this, location).catch(err => err)
}

export default router
