<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','customer_name') || $check_field('add','customer_name') || $check_field('set','customer_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="客户姓名" prop="customer_name">
												<el-input id="customer_name" v-model="form['customer_name']" placeholder="请输入客户姓名"
							  v-if="user_group === '管理员' || (form['customer_information_id'] && $check_field('set','customer_name')) || (!form['customer_information_id'] && $check_field('add','customer_name'))" :disabled="disabledObj['customer_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','customer_name')">{{form['customer_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','customer_gender') || $check_field('add','customer_gender') || $check_field('set','customer_gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="客户性别" prop="customer_gender">
								<el-select id="customer_gender" v-model="form['customer_gender']"
						v-if="user_group === '管理员' || (form['customer_information_id'] && $check_field('set','customer_gender')) || (!form['customer_information_id'] && $check_field('add','customer_gender'))">
						<el-option v-for="o in list_customer_gender" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','customer_gender')">{{form['customer_gender']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','customer_address') || $check_field('add','customer_address') || $check_field('set','customer_address')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="客户住址" prop="customer_address">
												<el-input id="customer_address" v-model="form['customer_address']" placeholder="请输入客户住址"
							  v-if="user_group === '管理员' || (form['customer_information_id'] && $check_field('set','customer_address')) || (!form['customer_information_id'] && $check_field('add','customer_address'))" :disabled="disabledObj['customer_address_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','customer_address')">{{form['customer_address']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系电话" prop="contact_number">
												<el-input id="contact_number" v-model="form['contact_number']" placeholder="请输入联系电话"
							  v-if="user_group === '管理员' || (form['customer_information_id'] && $check_field('set','contact_number')) || (!form['customer_information_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_number')">{{form['contact_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','customer_information') || $check_field('add','customer_information') || $check_field('set','customer_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="客户信息" prop="customer_information">
								<el-input type="textarea" id="customer_information" v-model="form['customer_information']" placeholder="请输入客户信息"
						v-if="user_group === '管理员' || (form['customer_information_id'] && $check_field('set','customer_information')) || (!form['customer_information_id'] && $check_field('add','customer_information'))" :disabled="disabledObj['customer_information_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','customer_information')">{{form['customer_information']}}</div>
							</el-form-item>
			</el-col>
					
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "customer_information_id",
				url_add: "~/api/customer_information/add?",
				url_set: "~/api/customer_information/set?",
				url_get_obj: "~/api/customer_information/get_obj?",
				url_upload: "~/api/customer_information/upload?",

				query: {
					"customer_information_id": 0,
				},

				form: {
								"customer_name":  '', // 客户姓名
										"customer_gender":  '', // 客户性别
										"customer_address":  '', // 客户住址
										"contact_number":  '', // 联系电话
										"customer_information":  '', // 客户信息
											"customer_information_id": 0, // ID
						
				},
				disabledObj:{
								"customer_name_isDisabled": false,
										"customer_gender_isDisabled": false,
										"customer_address_isDisabled": false,
										"contact_number_isDisabled": false,
										"customer_information_isDisabled": false,
										},

	
						// 客户性别选项列表
				list_customer_gender: ['男','女'],
	
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
														
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
														$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


															

			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																					return msg;
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/customer_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/customer_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/customer_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/customer_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/customer_information/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
												},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
