import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},


	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},








	// 员工用户路由
	{
		path: '/employee_users/table',
		name: 'employee_users_table',
		component: () => import('../views/employee_users/table.vue'),
		meta: {
			index: 0,
			title: '员工用户列表'
		}
	},
	{
		path: '/employee_users/view',
		name: 'employee_users_view',
		component: () => import('../views/employee_users/view.vue'),
		meta: {
			index: 0,
			title: '员工用户详情'
		}
	},
	// 维修信息路由
	{
		path: '/service_information/table',
		name: 'service_information_table',
		component: () => import('../views/service_information/table.vue'),
		meta: {
			index: 0,
			title: '维修信息列表'
		}
	},
	{
		path: '/service_information/view',
		name: 'service_information_view',
		component: () => import('../views/service_information/view.vue'),
		meta: {
			index: 0,
			title: '维修信息详情'
		}
	},
	// 销售信息路由
	{
		path: '/sales_information/table',
		name: 'sales_information_table',
		component: () => import('../views/sales_information/table.vue'),
		meta: {
			index: 0,
			title: '销售信息列表'
		}
	},
	{
		path: '/sales_information/view',
		name: 'sales_information_view',
		component: () => import('../views/sales_information/view.vue'),
		meta: {
			index: 0,
			title: '销售信息详情'
		}
	},
	// 仓库信息路由
	{
		path: '/warehouse_information/table',
		name: 'warehouse_information_table',
		component: () => import('../views/warehouse_information/table.vue'),
		meta: {
			index: 0,
			title: '仓库信息列表'
		}
	},
	{
		path: '/warehouse_information/view',
		name: 'warehouse_information_view',
		component: () => import('../views/warehouse_information/view.vue'),
		meta: {
			index: 0,
			title: '仓库信息详情'
		}
	},
	// 出库信息路由
	{
		path: '/outbound_information/table',
		name: 'outbound_information_table',
		component: () => import('../views/outbound_information/table.vue'),
		meta: {
			index: 0,
			title: '出库信息列表'
		}
	},
	{
		path: '/outbound_information/view',
		name: 'outbound_information_view',
		component: () => import('../views/outbound_information/view.vue'),
		meta: {
			index: 0,
			title: '出库信息详情'
		}
	},
	// 入库信息路由
	{
		path: '/warehousing_information/table',
		name: 'warehousing_information_table',
		component: () => import('../views/warehousing_information/table.vue'),
		meta: {
			index: 0,
			title: '入库信息列表'
		}
	},
	{
		path: '/warehousing_information/view',
		name: 'warehousing_information_view',
		component: () => import('../views/warehousing_information/view.vue'),
		meta: {
			index: 0,
			title: '入库信息详情'
		}
	},
	// 客户信息路由
	{
		path: '/customer_information/table',
		name: 'customer_information_table',
		component: () => import('../views/customer_information/table.vue'),
		meta: {
			index: 0,
			title: '客户信息列表'
		}
	},
	{
		path: '/customer_information/view',
		name: 'customer_information_view',
		component: () => import('../views/customer_information/view.vue'),
		meta: {
			index: 0,
			title: '客户信息详情'
		}
	},
	// 通知公告路由
	{
		path: '/notice_announcement/table',
		name: 'notice_announcement_table',
		component: () => import('../views/notice_announcement/table.vue'),
		meta: {
			index: 0,
			title: '通知公告列表'
		}
	},
	{
		path: '/notice_announcement/view',
		name: 'notice_announcement_view',
		component: () => import('../views/notice_announcement/view.vue'),
		meta: {
			index: 0,
			title: '通知公告详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "农用车4S店管理系统-admin";
	document.title = title;
})

export default router
