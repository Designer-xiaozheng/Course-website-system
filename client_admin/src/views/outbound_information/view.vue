<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','item_name') || $check_field('add','item_name') || $check_field('set','item_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品名称" prop="item_name">
												<el-input id="item_name" v-model="form['item_name']" placeholder="请输入物品名称"
							  v-if="user_group === '管理员' || (form['outbound_information_id'] && $check_field('set','item_name')) || (!form['outbound_information_id'] && $check_field('add','item_name'))" :disabled="disabledObj['item_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','item_name')">{{form['item_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','serial_number') || $check_field('add','serial_number') || $check_field('set','serial_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="物品编号" prop="serial_number">
												<el-input id="serial_number" v-model="form['serial_number']" placeholder="请输入物品编号"
							  v-if="user_group === '管理员' || (form['outbound_information_id'] && $check_field('set','serial_number')) || (!form['outbound_information_id'] && $check_field('add','serial_number'))" :disabled="disabledObj['serial_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','serial_number')">{{form['serial_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','delivery_date') || $check_field('add','delivery_date') || $check_field('set','delivery_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="出库日期" prop="delivery_date">
								<el-date-picker :disabled="disabledObj['delivery_date_isDisabled']" v-if="user_group === '管理员' || (form['outbound_information_id'] && $check_field('set','delivery_date')) || (!form['outbound_information_id'] && $check_field('add','delivery_date'))" id="delivery_date"
						v-model="form['delivery_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','delivery_date')">{{form['delivery_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','outbound_quantity') || $check_field('add','outbound_quantity') || $check_field('set','outbound_quantity')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="出库数量" prop="outbound_quantity">
												<el-input id="outbound_quantity" v-model="form['outbound_quantity']" placeholder="请输入出库数量"
							  v-if="user_group === '管理员' || (form['outbound_information_id'] && $check_field('set','outbound_quantity')) || (!form['outbound_information_id'] && $check_field('add','outbound_quantity'))" :disabled="disabledObj['outbound_quantity_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','outbound_quantity')">{{form['outbound_quantity']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','outbound_employee') || $check_field('add','outbound_employee') || $check_field('set','outbound_employee')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="出库员工" prop="outbound_employee">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_outbound_employee(form['outbound_employee']) }}
							<!--<el-input id="business_name" v-model="form['outbound_employee']" placeholder="请输入出库员工"-->
							<!--v-if="user_group === '管理员' || (form['outbound_information_id'] && $check_field('set','outbound_employee')) || (!form['outbound_information_id'] && $check_field('add','outbound_employee'))" :disabled="disabledObj['outbound_employee_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','outbound_employee')">{{form['outbound_employee']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['outbound_information_id'] && $check_field('set','outbound_employee')) || (!form['outbound_information_id'] && $check_field('add','outbound_employee'))" id="outbound_employee" v-model="form['outbound_employee']" :disabled="disabledObj['outbound_employee_isDisabled']">
								<el-option v-for="o in list_user_outbound_employee" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','outbound_employee')" id="outbound_employee" v-model="form['outbound_employee']" :disabled="true">
								<el-option v-for="o in list_user_outbound_employee" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="outbound_employee" v-model="form['outbound_employee']" :disabled="disabledObj['outbound_employee_isDisabled']">
							<el-option v-for="o in list_user_outbound_employee" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','employee_name') || $check_field('add','employee_name') || $check_field('set','employee_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工姓名" prop="employee_name">
												<el-input id="employee_name" v-model="form['employee_name']" placeholder="请输入员工姓名"
							  v-if="user_group === '管理员' || (form['outbound_information_id'] && $check_field('set','employee_name')) || (!form['outbound_information_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']"></el-input>
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
				field: "outbound_information_id",
				url_add: "~/api/outbound_information/add?",
				url_set: "~/api/outbound_information/set?",
				url_get_obj: "~/api/outbound_information/get_obj?",
				url_upload: "~/api/outbound_information/upload?",

				query: {
					"outbound_information_id": 0,
				},

				form: {
								"item_name":  '', // 物品名称
										"serial_number":  '', // 物品编号
										"delivery_date":  '', // 出库日期
										"outbound_quantity":  '', // 出库数量
										"outbound_employee": 0, // 出库员工
										"employee_name":  '', // 员工姓名
											"outbound_information_id": 0, // ID
						
				},
				disabledObj:{
								"item_name_isDisabled": false,
										"serial_number_isDisabled": false,
										"delivery_date_isDisabled": false,
										"outbound_quantity_isDisabled": false,
										"outbound_employee_isDisabled": false,
										"employee_name_isDisabled": false,
										},

	
		
		
		
		
					// 用户列表
				list_user_outbound_employee: [],
						// 用户组
				group_user_outbound_employee: "",
				
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
				/**
			 * 获取员工用户用户列表
			 */
			async get_list_user_outbound_employee() {
                // if(this.user_group !== "管理员" && this.form["outbound_employee"] === 0) {
                //     this.form["outbound_employee"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=员工用户");
                if(json.result && json.result.list){
                    this.list_user_outbound_employee = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取员工用户用户组
			 */
			async get_group_user_outbound_employee() {
							this.form["outbound_employee"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=员工用户");
				if(json.result && json.result.obj){
					this.group_user_outbound_employee = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_outbound_employee(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_outbound_employee.source_table+"/get_obj?"
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
												_this.form["outbound_employee"] = id
									_this.disabledObj['outbound_employee' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "outbound_employee") {
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
					get_user_outbound_employee(id){
				var obj = this.list_user_outbound_employee.getObj({"user_id":id});
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
										// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
													
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
						        if (this.form["delivery_date"].indexOf("-")===-1){
          this.form["delivery_date"] = this.$toTime(parseInt(this.form["delivery_date"]),"yyyy-MM-dd")
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


								        if(this.form["delivery_date"]=="0000-00-00"){
          this.form["delivery_date"] = null;
        }
				if(parseInt(this.form["delivery_date"]) > 9999){
					this.form["delivery_date"] = this.$toTime(parseInt(this.form["delivery_date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/outbound_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/outbound_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/outbound_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/outbound_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/outbound_information/view','get');
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
													this.get_list_user_outbound_employee();
					this.get_group_user_outbound_employee();
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
