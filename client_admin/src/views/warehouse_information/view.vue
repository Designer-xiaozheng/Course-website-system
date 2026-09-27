<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','item_name') || $check_field('add','item_name') || $check_field('set','item_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品名称" prop="item_name">
												<el-input id="item_name" v-model="form['item_name']" placeholder="请输入物品名称"
							  v-if="user_group === '管理员' || (form['warehouse_information_id'] && $check_field('set','item_name')) || (!form['warehouse_information_id'] && $check_field('add','item_name'))" :disabled="disabledObj['item_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','item_name')">{{form['item_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','serial_number') || $check_field('add','serial_number') || $check_field('set','serial_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品编号" prop="serial_number">
												<el-input id="serial_number" v-model="form['serial_number']" placeholder="请输入物品编号"
							  v-if="user_group === '管理员' || (form['warehouse_information_id'] && $check_field('set','serial_number')) || (!form['warehouse_information_id'] && $check_field('add','serial_number'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','serial_number')">{{form['serial_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','storage_location') || $check_field('add','storage_location') || $check_field('set','storage_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="存放位置" prop="storage_location">
												<el-input id="storage_location" v-model="form['storage_location']" placeholder="请输入存放位置"
							  v-if="user_group === '管理员' || (form['warehouse_information_id'] && $check_field('set','storage_location')) || (!form['warehouse_information_id'] && $check_field('add','storage_location'))" :disabled="disabledObj['storage_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','storage_location')">{{form['storage_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','item_quantity') || $check_field('add','item_quantity') || $check_field('set','item_quantity')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品数量" prop="item_quantity">
								<el-input-number id="item_quantity" v-model.number="form['item_quantity']"
						v-if="user_group === '管理员' || (form['warehouse_information_id'] && $check_field('set','item_quantity')) || (!form['warehouse_information_id'] && $check_field('add','item_quantity'))" :disabled="disabledObj['item_quantity_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','item_quantity')">{{form['item_quantity']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','item_information') || $check_field('add','item_information') || $check_field('set','item_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品信息" prop="item_information">
								<el-input type="textarea" id="item_information" v-model="form['item_information']" placeholder="请输入物品信息"
						v-if="user_group === '管理员' || (form['warehouse_information_id'] && $check_field('set','item_information')) || (!form['warehouse_information_id'] && $check_field('add','item_information'))" :disabled="disabledObj['item_information_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','item_information')">{{form['item_information']}}</div>
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
				field: "warehouse_information_id",
				url_add: "~/api/warehouse_information/add?",
				url_set: "~/api/warehouse_information/set?",
				url_get_obj: "~/api/warehouse_information/get_obj?",
				url_upload: "~/api/warehouse_information/upload?",

				query: {
					"warehouse_information_id": 0,
				},

				form: {
								"item_name":  '', // 物品名称
										"serial_number": this.$get_stamp(), // 物品编号
										"storage_location":  '', // 存放位置
										"item_quantity":  0, // 物品数量
										"item_information":  '', // 物品信息
											"warehouse_information_id": 0, // ID
						
				},
				disabledObj:{
								"item_name_isDisabled": false,
										"serial_number_isDisabled": false,
										"storage_location_isDisabled": false,
					          			"item_quantity_isDisabled": false,
										"item_information_isDisabled": false,
										},

	
		
		
		
		
	
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
					bl = this.$check_action('/warehouse_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/warehouse_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/warehouse_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/warehouse_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/warehouse_information/view','get');
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
