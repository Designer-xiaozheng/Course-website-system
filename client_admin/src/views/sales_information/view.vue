<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','sales_date') || $check_field('add','sales_date') || $check_field('set','sales_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="销售日期" prop="sales_date">
								<el-date-picker :disabled="disabledObj['sales_date_isDisabled']" v-if="user_group === '管理员' || (form['sales_information_id'] && $check_field('set','sales_date')) || (!form['sales_information_id'] && $check_field('add','sales_date'))" id="sales_date"
						v-model="form['sales_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','sales_date')">{{form['sales_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_name') || $check_field('add','vehicle_name') || $check_field('set','vehicle_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆名称" prop="vehicle_name">
												<el-input id="vehicle_name" v-model="form['vehicle_name']" placeholder="请输入车辆名称"
							  v-if="user_group === '管理员' || (form['sales_information_id'] && $check_field('set','vehicle_name')) || (!form['sales_information_id'] && $check_field('add','vehicle_name'))" :disabled="disabledObj['vehicle_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_name')">{{form['vehicle_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_unit_price') || $check_field('add','vehicle_unit_price') || $check_field('set','vehicle_unit_price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆单价" prop="vehicle_unit_price">
								<el-input-number id="vehicle_unit_price" v-model.number="form['vehicle_unit_price']"
						v-if="user_group === '管理员' || (form['sales_information_id'] && $check_field('set','vehicle_unit_price')) || (!form['sales_information_id'] && $check_field('add','vehicle_unit_price'))" :disabled="disabledObj['vehicle_unit_price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','vehicle_unit_price')">{{form['vehicle_unit_price']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','sales_volumes') || $check_field('add','sales_volumes') || $check_field('set','sales_volumes')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="销售数量" prop="sales_volumes">
								<el-input-number id="sales_volumes" v-model.number="form['sales_volumes']"
						v-if="user_group === '管理员' || (form['sales_information_id'] && $check_field('set','sales_volumes')) || (!form['sales_information_id'] && $check_field('add','sales_volumes'))" :disabled="disabledObj['sales_volumes_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','sales_volumes')">{{form['sales_volumes']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','sales_amount') || $check_field('add','sales_amount') || $check_field('set','sales_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="销售金额" prop="sales_amount">
												<el-input id="sales_amount" v-model="form['sales_amount']" placeholder="请输入销售金额"
							  v-if="user_group === '管理员' || (form['sales_information_id'] && $check_field('set','sales_amount')) || (!form['sales_information_id'] && $check_field('add','sales_amount'))"  @focus="set_sales_amount()" :disabled="disabledObj['sales_amount_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','sales_amount')">{{form['sales_amount']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','sales_staff') || $check_field('add','sales_staff') || $check_field('set','sales_staff')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="销售员工" prop="sales_staff">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_sales_staff(form['sales_staff']) }}
							<!--<el-input id="business_name" v-model="form['sales_staff']" placeholder="请输入销售员工"-->
							<!--v-if="user_group === '管理员' || (form['sales_information_id'] && $check_field('set','sales_staff')) || (!form['sales_information_id'] && $check_field('add','sales_staff'))" :disabled="disabledObj['sales_staff_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','sales_staff')">{{form['sales_staff']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['sales_information_id'] && $check_field('set','sales_staff')) || (!form['sales_information_id'] && $check_field('add','sales_staff'))" id="sales_staff" v-model="form['sales_staff']" :disabled="disabledObj['sales_staff_isDisabled']">
								<el-option v-for="o in list_user_sales_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','sales_staff')" id="sales_staff" v-model="form['sales_staff']" :disabled="true">
								<el-option v-for="o in list_user_sales_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="sales_staff" v-model="form['sales_staff']" :disabled="disabledObj['sales_staff_isDisabled']">
							<el-option v-for="o in list_user_sales_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','employee_name') || $check_field('add','employee_name') || $check_field('set','employee_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工姓名" prop="employee_name">
												<el-input id="employee_name" v-model="form['employee_name']" placeholder="请输入员工姓名"
							  v-if="user_group === '管理员' || (form['sales_information_id'] && $check_field('set','employee_name')) || (!form['sales_information_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','employee_name')">{{form['employee_name']}}</div>
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
				field: "sales_information_id",
				url_add: "~/api/sales_information/add?",
				url_set: "~/api/sales_information/set?",
				url_get_obj: "~/api/sales_information/get_obj?",
				url_upload: "~/api/sales_information/upload?",

				query: {
					"sales_information_id": 0,
				},

				form: {
								"sales_date":  '', // 销售日期
										"vehicle_name":  '', // 车辆名称
										"vehicle_unit_price":  0, // 车辆单价
										"sales_volumes":  0, // 销售数量
										"sales_amount":  '', // 销售金额
										"sales_staff": 0, // 销售员工
										"employee_name":  '', // 员工姓名
											"sales_information_id": 0, // ID
						
				},
				disabledObj:{
								"sales_date_isDisabled": false,
										"vehicle_name_isDisabled": false,
					          			"vehicle_unit_price_isDisabled": false,
					          			"sales_volumes_isDisabled": false,
										"sales_amount_isDisabled": false,
										"sales_staff_isDisabled": false,
										"employee_name_isDisabled": false,
										},

	
		
		
		
		
		
					// 用户列表
				list_user_sales_staff: [],
						// 用户组
				group_user_sales_staff: "",
				
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
										set_sales_amount(){
				this.form.sales_amount = parseFloat(this.form.vehicle_unit_price) * parseFloat(this.form.sales_volumes)
			},
							
	
				/**
			 * 获取员工用户用户列表
			 */
			async get_list_user_sales_staff() {
                // if(this.user_group !== "管理员" && this.form["sales_staff"] === 0) {
                //     this.form["sales_staff"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=员工用户");
                if(json.result && json.result.list){
                    this.list_user_sales_staff = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取员工用户用户组
			 */
			async get_group_user_sales_staff() {
							this.form["sales_staff"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=员工用户");
				if(json.result && json.result.obj){
					this.group_user_sales_staff = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_sales_staff(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_sales_staff.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["sales_staff"] = id
									_this.disabledObj['sales_staff' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "sales_staff") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_sales_staff(id){
				var obj = this.list_user_sales_staff.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
		
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
		        if (this.form["sales_date"].indexOf("-")===-1){
          this.form["sales_date"] = this.$toTime(parseInt(this.form["sales_date"]),"yyyy-MM-dd")
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


		        if(this.form["sales_date"]=="0000-00-00"){
          this.form["sales_date"] = null;
        }
				if(parseInt(this.form["sales_date"]) > 9999){
					this.form["sales_date"] = this.$toTime(parseInt(this.form["sales_date"]),"yyyy-MM-dd")
				}
																				

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
					bl = this.$check_action('/sales_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/sales_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/sales_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/sales_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/sales_information/view','get');
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
															this.get_list_user_sales_staff();
					this.get_group_user_sales_staff();
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
