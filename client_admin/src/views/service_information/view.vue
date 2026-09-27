<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','vehicle_name') || $check_field('add','vehicle_name') || $check_field('set','vehicle_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车辆名称" prop="vehicle_name">
												<el-input id="vehicle_name" v-model="form['vehicle_name']" placeholder="请输入车辆名称"
							  v-if="user_group === '管理员' || (form['service_information_id'] && $check_field('set','vehicle_name')) || (!form['service_information_id'] && $check_field('add','vehicle_name'))" :disabled="disabledObj['vehicle_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','vehicle_name')">{{form['vehicle_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','license_plate') || $check_field('add','license_plate') || $check_field('set','license_plate')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="车牌号码" prop="license_plate">
												<el-input id="license_plate" v-model="form['license_plate']" placeholder="请输入车牌号码"
							  v-if="user_group === '管理员' || (form['service_information_id'] && $check_field('set','license_plate')) || (!form['service_information_id'] && $check_field('add','license_plate'))" :disabled="disabledObj['license_plate_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','license_plate')">{{form['license_plate']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','repair_date') || $check_field('add','repair_date') || $check_field('set','repair_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="维修日期" prop="repair_date">
								<el-date-picker :disabled="disabledObj['repair_date_isDisabled']" v-if="user_group === '管理员' || (form['service_information_id'] && $check_field('set','repair_date')) || (!form['service_information_id'] && $check_field('add','repair_date'))" id="repair_date"
						v-model="form['repair_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','repair_date')">{{form['repair_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','maintenance_staff') || $check_field('add','maintenance_staff') || $check_field('set','maintenance_staff')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="维修员工" prop="maintenance_staff">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_maintenance_staff(form['maintenance_staff']) }}
							<!--<el-input id="business_name" v-model="form['maintenance_staff']" placeholder="请输入维修员工"-->
							<!--v-if="user_group === '管理员' || (form['service_information_id'] && $check_field('set','maintenance_staff')) || (!form['service_information_id'] && $check_field('add','maintenance_staff'))" :disabled="disabledObj['maintenance_staff_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','maintenance_staff')">{{form['maintenance_staff']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['service_information_id'] && $check_field('set','maintenance_staff')) || (!form['service_information_id'] && $check_field('add','maintenance_staff'))" id="maintenance_staff" v-model="form['maintenance_staff']" :disabled="disabledObj['maintenance_staff_isDisabled']">
								<el-option v-for="o in list_user_maintenance_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','maintenance_staff')" id="maintenance_staff" v-model="form['maintenance_staff']" :disabled="true">
								<el-option v-for="o in list_user_maintenance_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="maintenance_staff" v-model="form['maintenance_staff']" :disabled="disabledObj['maintenance_staff_isDisabled']">
							<el-option v-for="o in list_user_maintenance_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','employee_name') || $check_field('add','employee_name') || $check_field('set','employee_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工姓名" prop="employee_name">
												<el-input id="employee_name" v-model="form['employee_name']" placeholder="请输入员工姓名"
							  v-if="user_group === '管理员' || (form['service_information_id'] && $check_field('set','employee_name')) || (!form['service_information_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','employee_name')">{{form['employee_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','maintenance_costs') || $check_field('add','maintenance_costs') || $check_field('set','maintenance_costs')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="维修费用" prop="maintenance_costs">
								<el-input-number id="maintenance_costs" v-model.number="form['maintenance_costs']"
						v-if="user_group === '管理员' || (form['service_information_id'] && $check_field('set','maintenance_costs')) || (!form['service_information_id'] && $check_field('add','maintenance_costs'))" :disabled="disabledObj['maintenance_costs_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','maintenance_costs')">{{form['maintenance_costs']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','fault_cause') || $check_field('add','fault_cause') || $check_field('set','fault_cause')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="故障原因" prop="fault_cause">
								<el-input type="textarea" id="fault_cause" v-model="form['fault_cause']" placeholder="请输入故障原因"
						v-if="user_group === '管理员' || (form['service_information_id'] && $check_field('set','fault_cause')) || (!form['service_information_id'] && $check_field('add','fault_cause'))" :disabled="disabledObj['fault_cause_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','fault_cause')">{{form['fault_cause']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','maintenance_notes') || $check_field('add','maintenance_notes') || $check_field('set','maintenance_notes')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="维修笔记" prop="maintenance_notes">
								<el-input type="textarea" id="maintenance_notes" v-model="form['maintenance_notes']" placeholder="请输入维修笔记"
						v-if="user_group === '管理员' || (form['service_information_id'] && $check_field('set','maintenance_notes')) || (!form['service_information_id'] && $check_field('add','maintenance_notes'))" :disabled="disabledObj['maintenance_notes_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','maintenance_notes')">{{form['maintenance_notes']}}</div>
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
				field: "service_information_id",
				url_add: "~/api/service_information/add?",
				url_set: "~/api/service_information/set?",
				url_get_obj: "~/api/service_information/get_obj?",
				url_upload: "~/api/service_information/upload?",

				query: {
					"service_information_id": 0,
				},

				form: {
								"vehicle_name":  '', // 车辆名称
										"license_plate":  '', // 车牌号码
										"repair_date":  '', // 维修日期
										"maintenance_staff": 0, // 维修员工
										"employee_name":  '', // 员工姓名
										"maintenance_costs":  0, // 维修费用
										"fault_cause":  '', // 故障原因
										"maintenance_notes":  '', // 维修笔记
											"service_information_id": 0, // ID
						
				},
				disabledObj:{
								"vehicle_name_isDisabled": false,
										"license_plate_isDisabled": false,
										"repair_date_isDisabled": false,
										"maintenance_staff_isDisabled": false,
										"employee_name_isDisabled": false,
					          			"maintenance_costs_isDisabled": false,
										"fault_cause_isDisabled": false,
										"maintenance_notes_isDisabled": false,
										},

	
		
		
		
					// 用户列表
				list_user_maintenance_staff: [],
						// 用户组
				group_user_maintenance_staff: "",
				
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
				/**
			 * 获取员工用户用户列表
			 */
			async get_list_user_maintenance_staff() {
                // if(this.user_group !== "管理员" && this.form["maintenance_staff"] === 0) {
                //     this.form["maintenance_staff"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=员工用户");
                if(json.result && json.result.list){
                    this.list_user_maintenance_staff = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取员工用户用户组
			 */
			async get_group_user_maintenance_staff() {
							this.form["maintenance_staff"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=员工用户");
				if(json.result && json.result.obj){
					this.group_user_maintenance_staff = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_maintenance_staff(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_maintenance_staff.source_table+"/get_obj?"
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
												_this.form["maintenance_staff"] = id
									_this.disabledObj['maintenance_staff' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "maintenance_staff") {
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
					get_user_maintenance_staff(id){
				var obj = this.list_user_maintenance_staff.getObj({"user_id":id});
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
						        if (this.form["repair_date"].indexOf("-")===-1){
          this.form["repair_date"] = this.$toTime(parseInt(this.form["repair_date"]),"yyyy-MM-dd")
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


								        if(this.form["repair_date"]=="0000-00-00"){
          this.form["repair_date"] = null;
        }
				if(parseInt(this.form["repair_date"]) > 9999){
					this.form["repair_date"] = this.$toTime(parseInt(this.form["repair_date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/service_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/service_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/service_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/service_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/service_information/view','get');
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
											this.get_list_user_maintenance_staff();
					this.get_group_user_maintenance_staff();
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
