SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS oa_contract_protocol;
DROP TABLE IF EXISTS oa_contract_purchase_stage;
DROP TABLE IF EXISTS oa_contract_purchase;
DROP TABLE IF EXISTS oa_contract_purchase_pay_approval;
DROP TABLE IF EXISTS oa_contract_purchase_product;
DROP TABLE IF EXISTS oa_contract_sales_stage;
DROP TABLE IF EXISTS oa_contract_sales;




/* Create Tables */

-- 协议框架合同
CREATE TABLE oa_contract_protocol
(
	-- 系统编号
	id varchar(64) NOT NULL COMMENT '系统编号',
	-- 合同编号
	contract_no varchar(64) COMMENT '合同编号',
	-- 合同名称
	contract_name varchar(64) COMMENT '合同名称',
	-- 合同状态
	contract_status char(1) COMMENT '合同状态',
	-- 关联的项目
	project_id varchar(64) COMMENT '关联的项目',
	-- 项目名称（旧）
	project_old_name varchar(64) COMMENT '项目名称（旧）',
	-- 合同类别
	contract_type char(1) COMMENT '合同类别',
	-- 合同金额
	contract_money decimal(19,4) DEFAULT 0 COMMENT '合同金额',
	-- 合同签订日期
	contract_time datetime COMMENT '合同签订日期',
	-- 合作单位
	cooperation_units varchar(64) COMMENT '合作单位',
	-- 合作内容
	cooperation_contents varchar(1000) COMMENT '合作内容',
	-- 联系人
	contact varchar(64) COMMENT '联系人',
	-- 联系电话
	contact_number varchar(64) COMMENT '联系电话',
	-- 合同截止日期
	contract_end_time datetime COMMENT '合同截止日期',
	-- 合同归档情况
	filing_status varchar(100) COMMENT '合同归档情况',
	-- 合同电子版
	contract_electronic_version varchar(1000) COMMENT '合同电子版',
	-- 合同扫描件
	contract_scan_attachment varchar(1000) COMMENT '合同扫描件',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '协议框架合同';


-- 采购合同表
CREATE TABLE oa_contract_purchase
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 合同编号
	contract_no varchar(64) COMMENT '合同编号',
	-- 合同名称
	contract_name varchar(64) COMMENT '合同名称',
	-- 合同状态
	contract_status char(1) COMMENT '合同状态',
	-- 关联的项目
	project_id varchar(64) COMMENT '关联的项目',
	-- 项目名称（旧）
	project_old_name varchar(64) COMMENT '项目名称（旧）',
	-- 合同类别
	contract_type char(1) COMMENT '合同类别',
	-- 合同金额
	contract_money decimal(19,4) DEFAULT 0 COMMENT '合同金额',
	-- 合同签订日期
	contract_time datetime COMMENT '合同签订日期',
	-- 关联的销售合同
	contract_sales_id varchar(64) COMMENT '关联的销售合同',
	-- 供应商
	supplier_id varchar(64) COMMENT '供应商',
	-- 供应商质保期开始日期
	supplier_warranty_start_time datetime COMMENT '供应商质保期开始日期',
	-- 供应商质保期结束日期
	supplier_warranty_end_time datetime COMMENT '供应商质保期结束日期',
	-- 合同归档情况
	filing_status
 varchar(100) COMMENT '合同归档情况',
	-- 是否已验货（0：否；1：是）
	is_inspected char(1) DEFAULT '0' COMMENT '是否已验货（0：否；1：是）',
	-- 验货单文件
	inspection_files varchar(1000) COMMENT '验货单文件',
	-- 验货时间
	inspection_time datetime COMMENT '验货时间',
	-- 验货人
	inspection_user_id varchar(64) COMMENT '验货人',
	-- 是否可以新增阶段（0：否；1：是）
	is_add_stage_abled char(1) DEFAULT '0' COMMENT '是否可以新增阶段（0：否；1：是）',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '采购合同表';


-- 采购合同付款申请流程表
CREATE TABLE oa_contract_purchase_pay_approval
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 关联的采购合同阶段
	oa_contract_purchase_stage_id varchar(64) COMMENT '关联的采购合同阶段',
	-- 付款申请编号
	pay_approval_no varchar(64) COMMENT '付款申请编号',
	-- 申请人
	applicant_id varchar(64) COMMENT '申请人',
	-- 申请日期
	apply_date datetime COMMENT '申请日期',
	-- 采购合同面向对象（0：与甲方；1：与合作方）
	contract_purchase_targeted_for char(1) COMMENT '采购合同面向对象（0：与甲方；1：与合作方）',
	-- 付款比例金额
	pay_percent_money varchar(64) COMMENT '付款比例金额',
	-- 付款金额
	pay_money decimal(19,4) DEFAULT 0 COMMENT '付款金额',
	-- 内容概括
	content_description varchar(400) COMMENT '内容概括',
	-- 附件
	file varchar(1000) COMMENT '附件',
	-- 客户经理意见
	accountManagerOpinion varchar(200) COMMENT '客户经理意见',
	-- 商务部联系人意见
	business_dept_linkman_opinion varchar(200) COMMENT '商务部联系人意见',
	-- 项目经理意见
	project_manager_opinion varchar(200) COMMENT '项目经理意见',
	-- 财务部付款要求
	finance_dept_payment_request varchar(200) COMMENT '财务部付款要求',
	-- 领导意见
	leader_opinion varchar(200) COMMENT '领导意见',
	-- 工程部经理意见
	engineering_dept_manager_opinion varchar(200) COMMENT '工程部经理意见',
	-- 技术部副总意见
	tech_dept_vice_president_opinion varchar(200) COMMENT '技术部副总意见',
	-- 商务经理意见
	business_manager_opinion varchar(200) COMMENT '商务经理意见',
	-- 商务部副总意见
	business_dept_vice_president_opinion varchar(200) COMMENT '商务部副总意见',
	-- 财务部副总意见
	finance_dept_vice_president_opinion varchar(200) COMMENT '财务部副总意见',
	-- 总经理意见
	general_manager_opinion varchar(200) COMMENT '总经理意见',
	-- 流程实例ID
	proc_ins_id varchar(64) COMMENT '流程实例ID',
	-- 审批状态（0：未送审；1：部门副总审批；2：人力资源审批；3：行政人事副总审批；x：已结案；y：已销毁）
	status char(1) COMMENT '审批状态（0：未送审；1：部门副总审批；2：人力资源审批；3：行政人事副总审批；x：已结案；y：已销毁）',
	-- 是否已进入流程（0：未开启；1：已开启）
	is_start char(1) COMMENT '是否已进入流程（0：未开启；1：已开启）',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '采购合同付款申请流程表';


-- 采购合同采购物品登记表
CREATE TABLE oa_contract_purchase_product
(
	-- 主键
	id varchar(64) NOT NULL COMMENT '主键',
	-- 商品归属的采购合同
	contract_purchase_id varchar(64) COMMENT '商品归属的采购合同',
	-- 名称
	name varchar(64) COMMENT '名称',
	-- 品牌型号
	product_type varchar(64) COMMENT '品牌型号',
	-- 单位
	unit varchar(64) COMMENT '单位',
	-- 数量
	num decimal(19,1) COMMENT '数量',
	-- 单价
	price decimal(19,1) COMMENT '单价',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '采购合同采购物品登记表';


-- 采购合同阶段信息
CREATE TABLE oa_contract_purchase_stage
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 关联的采购合同
	contract_purchase_id varchar(64) COMMENT '关联的采购合同',
	-- 合同付款阶段
	pay_stage char(1) COMMENT '合同付款阶段',
	-- 合同阶段序号
	pay_stage_index decimal(19,4) DEFAULT 0 COMMENT '合同阶段序号',
	-- 阶段名称
	pay_stage_name varchar(64) COMMENT '阶段名称',
	-- 阶段状态（0：初始化）
	pay_stage_status char(1) DEFAULT '0' COMMENT '阶段状态（0：初始化）',
	-- 是否已全部到货
	is_goods_arrived  char(1) COMMENT '是否已全部到货',
	-- 验货单是否备齐
	is_inspection_sheet_ready char(1) COMMENT '验货单是否备齐',
	-- 付款时间
	pay_time datetime COMMENT '付款时间',
	-- 付款金额
	pay_money decimal(19,4) COMMENT '付款金额',
	-- 发票金额
	billing_money decimal(19,4) COMMENT '发票金额',
	-- 发票号
	billing_no varchar(64) COMMENT '发票号',
	-- 票种
	billing_type char(1) COMMENT '票种',
	-- 开票日期
	billing_time datetime COMMENT '开票日期',
	-- 开票内容
	billing_content varchar(200) COMMENT '开票内容',
	-- 发票扫描件
	billing_file varchar(1000) COMMENT '发票扫描件',
	-- 进度对应工作是否完成
	is_work_progress_completed char(1) COMMENT '进度对应工作是否完成',
	-- 进度文档
	work_progress_file varchar(1000) COMMENT '进度文档',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '采购合同阶段信息';


-- 销售合同表
CREATE TABLE oa_contract_sales
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 合同编号
	contract_no varchar(64) COMMENT '合同编号',
	-- 合同名称
	contract_name varchar(64) COMMENT '合同名称',
	-- 合同状态
	contract_status char(1) COMMENT '合同状态',
	-- 关联的项目
	project_id varchar(64) COMMENT '关联的项目',
	-- 项目名称（旧）
	project_old_name varchar(64) COMMENT '项目名称（旧）',
	-- 合同类别
	contract_type char(1) COMMENT '合同类别',
	-- 合同金额
	contract_money decimal(19,4) DEFAULT 0 COMMENT '合同金额',
	-- 合同签订日期
	contract_time datetime COMMENT '合同签订日期',
	-- 服务内容
	service_type varchar(64) COMMENT '服务内容',
	-- 客户类别
	custumer_type char(1) COMMENT '客户类别',
	-- 合同甲方
	contract_partya varchar(64) COMMENT '合同甲方',
	-- 甲方开票信息
	partya_ticket varchar(1000) COMMENT '甲方开票信息',
	-- 合同保修开始时间
	warranty_start_time datetime COMMENT '合同保修开始时间',
	-- 合同保修结束日期
	warranty_end_time datetime COMMENT '合同保修结束日期',
	-- 项目负责人
	project_leader_id varchar(64) COMMENT '项目负责人',
	-- 质保金金额
	guarantee_money decimal(19,4) DEFAULT 0 COMMENT '质保金金额',
	-- 质保金收取时间
	guarantee_money_charge_time datetime COMMENT '质保金收取时间',
	-- 是否是反点合同
	is_counter_point_contract char(1) DEFAULT '0' COMMENT '是否是反点合同',
	-- 是否经过招投标
	is_bidding_off char(1) DEFAULT '0' COMMENT '是否经过招投标',
	-- 合同电子版
	contract_electronic_version varchar(1000) COMMENT '合同电子版',
	-- 合同扫描件
	contract_scan_attachment varchar(1000) COMMENT '合同扫描件',
	-- 违约惩罚
	punishment varchar(1000) COMMENT '违约惩罚',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '销售合同表';


-- 销售合同阶段信息
CREATE TABLE oa_contract_sales_stage
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 关联的销售合同
	contract_sales_id varchar(64) COMMENT '关联的销售合同',
	-- pay_stage
	pay_stage char(1) COMMENT 'pay_stage',
	-- 验收完成时间
	check_complete_time datetime COMMENT '验收完成时间',
	-- 验收资料
	check_file varchar(1000) COMMENT '验收资料',
	-- 是否已开票
	is_billing char(1) COMMENT '是否已开票',
	-- 开票金额
	billing_money decimal(19,4) DEFAULT 0 COMMENT '开票金额',
	-- 开票日期
	billing_time datetime COMMENT '开票日期',
	-- 是否已收款
	is_gathering char(1) COMMENT '是否已收款',
	-- 开票内容
	billing_content varchar(200) COMMENT '开票内容',
	-- 发票号
	billing_no varchar(64) COMMENT '发票号',
	-- 收票回执
	billing_receipt varchar(200) COMMENT '收票回执',
	-- 票种
	billing_type char(1) COMMENT '票种',
	-- 情况说明
	situation_description varchar(200) COMMENT '情况说明',
	-- 合同阶段序号
	pay_stage_index int(10) DEFAULT 1 COMMENT '合同阶段序号',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '销售合同阶段信息';



/* Create Foreign Keys */

ALTER TABLE oa_contract_purchase_stage
	ADD FOREIGN KEY (contract_purchase_id)
	REFERENCES oa_contract_purchase (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE oa_contract_sales_stage
	ADD FOREIGN KEY (contract_sales_id)
	REFERENCES oa_contract_sales (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



