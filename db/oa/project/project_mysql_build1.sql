SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS oa_project_document;
DROP TABLE IF EXISTS oa_project_operation;
DROP TABLE IF EXISTS oa_project_weekreport;
DROP TABLE IF EXISTS oa_project;
DROP TABLE IF EXISTS oa_project_approval;
DROP TABLE IF EXISTS oa_project_member;




/* Create Tables */

-- 项目表
CREATE TABLE oa_project
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 项目阶段
	project_stage char(1) COMMENT '项目阶段',
	-- 服务类别
	contract_type char(1) COMMENT '服务类别',
	-- 是否投标
	is_bid char(1) COMMENT '是否投标',
	-- 录入时间
	write_time datetime COMMENT '录入时间',
	-- 预计投标日期
	expected_bid_time datetime COMMENT '预计投标日期',
	-- 立项日期
	establishment_time datetime COMMENT '立项日期',
	-- 预计签约时间
	book_contract_time datetime COMMENT '预计签约时间',
	-- 实际签约时间
	actual_contract_time datetime COMMENT '实际签约时间',
	-- 实际投标日期
	actual_bid_time datetime COMMENT '实际投标日期',
	-- 项目启动日期
	project_start_time datetime COMMENT '项目启动日期',
	-- 项目金额
	project_money decimal(19,4) COMMENT '项目金额',
	-- 预计金额
	expected_money decimal(19,4) COMMENT '预计金额',
	-- 合同金额
	contract_money decimal(19,4) COMMENT '合同金额',
	-- 客户经理
	account_manager_id varchar(64) COMMENT '客户经理',
	-- 商务支持
	business_manager_id varchar(64) COMMENT '商务支持',
	-- 技术支持
	technical_manager_id varchar(64) COMMENT '技术支持',
	-- 工程经理
	project_manager_id varchar(64) COMMENT '工程经理',
	-- 客户名称
	account_name varchar(64) COMMENT '客户名称',
	-- 项目编号
	project_no varchar(64) COMMENT '项目编号',
	-- 项目名称
	project_name varchar(64) COMMENT '项目名称',
	-- 项目背景描述
	project_bg_description varchar(500) COMMENT '项目背景描述',
	-- 所属行业
	owned_industry varchar(64) COMMENT '所属行业',
	-- 流程实例ID
	proc_ins_id varchar(64) COMMENT '流程实例ID',
	-- 项目附件
	project_file varchar(1000) COMMENT '项目附件',
	-- 市场部主管意见
	marketing_director_opinion varchar(200) COMMENT '市场部主管意见',
	-- 商务部副总意见
	vice_minister_opinion varchar(200) COMMENT '商务部副总意见',
	-- 售前部经理意见
	pre_sales_manager_opinion varchar(200) COMMENT '售前部经理意见',
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
	-- 可查看的人员权限列表（id集合用,分割）
	view_permission varchar(2000) COMMENT '可查看的人员权限列表（id集合用,分割）',
	-- 录入方式（0：申请审批转档，1：手动录入）
	write_way char(1) COMMENT '录入方式（0：申请审批转档，1：手动录入）',
	PRIMARY KEY (id)
) COMMENT = '项目表';


-- 项目表
CREATE TABLE oa_project_approval
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 项目阶段
	project_stage char(1) COMMENT '项目阶段',
	-- 服务类别
	contract_type char(1) COMMENT '服务类别',
	-- 是否投标
	is_bid char(1) COMMENT '是否投标',
	-- 录入时间
	write_time datetime COMMENT '录入时间',
	-- 预计投标日期
	expected_bid_time datetime COMMENT '预计投标日期',
	-- 立项日期
	establishment_time datetime COMMENT '立项日期',
	-- 预计签约时间
	book_contract_time datetime COMMENT '预计签约时间',
	-- 实际签约时间
	actual_contract_time datetime COMMENT '实际签约时间',
	-- 实际投标日期
	actual_bid_time datetime COMMENT '实际投标日期',
	-- 项目启动日期
	project_start_time datetime COMMENT '项目启动日期',
	-- 项目金额
	project_money decimal(19,4) COMMENT '项目金额',
	-- 预计金额
	expected_money decimal(19,4) COMMENT '预计金额',
	-- 合同金额
	contract_money decimal(19,4) COMMENT '合同金额',
	-- 客户经理
	account_manager_id varchar(64) COMMENT '客户经理',
	-- 商务支持
	business_manager_id varchar(64) COMMENT '商务支持',
	-- 技术支持
	technical_manager_id varchar(64) COMMENT '技术支持',
	-- 工程经理
	project_manager_id varchar(64) COMMENT '工程经理',
	-- 客户名称
	account_name varchar(64) COMMENT '客户名称',
	-- 项目编号
	project_no varchar(64) COMMENT '项目编号',
	-- 项目名称
	project_name varchar(64) COMMENT '项目名称',
	-- 项目背景描述
	project_bg_description varchar(500) COMMENT '项目背景描述',
	-- 所属行业
	owned_industry varchar(64) COMMENT '所属行业',
	-- 流程实例ID
	proc_ins_id varchar(64) COMMENT '流程实例ID',
	-- 项目附件
	project_file varchar(1000) COMMENT '项目附件',
	-- 市场部主管意见
	marketing_director_opinion varchar(200) COMMENT '市场部主管意见',
	-- 商务部副总意见
	vice_minister_opinion varchar(200) COMMENT '商务部副总意见',
	-- 售前部经理意见
	pre_sales_manager_opinion varchar(200) COMMENT '售前部经理意见',
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
	-- 可查看的人员权限列表（id集合用,分割）
	view_permission varchar(2000) COMMENT '可查看的人员权限列表（id集合用,分割）',
	-- 审批状态（0：未送审；1：市场部主管审批；2：商务部副总审批；3：商务部联系人审批；4：售前经理审批；5：项目售前技术确认；6：项目管理专员编号；7：已结案；x：已销毁）
	status char(1) DEFAULT '0' COMMENT '审批状态（0：未送审；1：市场部主管审批；2：商务部副总审批；3：商务部联系人审批；4：售前经理审批；5：项目售前技术确认；6：项目管理专员编号；7：已结案；x：已销毁）',
	-- 是否已进入流程（0：未开启；1：已开启）
	is_start char(1) DEFAULT '0' COMMENT '是否已进入流程（0：未开启；1：已开启）',
	PRIMARY KEY (id)
) COMMENT = '项目表';


-- 项目文档表
CREATE TABLE oa_project_document
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 文档名称
	project_file varchar(1000) COMMENT '文档名称',
	-- 填写人
	write_user_id varchar(64) COMMENT '填写人',
	-- 更新人
	update_user_id varchar(64) COMMENT '更新人',
	-- 编号
	report_no varchar(64) COMMENT '编号',
	-- 所属项目
	project_id varchar(64) COMMENT '所属项目',
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
) COMMENT = '项目文档表';


-- 项目成员表
CREATE TABLE oa_project_member
(
	-- 系统编号
	id varchar(64) COMMENT '系统编号',
	-- 关联的项目
	project_id varchar(64) COMMENT '关联的项目',
	-- 关联的用户
	user_id varchar(64) COMMENT '关联的用户',
	-- 职责
	duty varchar(200) COMMENT '职责',
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
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）'
) COMMENT = '项目成员表';


-- 项目处理表
CREATE TABLE oa_project_operation
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 所属项目
	project_id varchar(64) COMMENT '所属项目',
	-- 处理时间
	operation_time timestamp COMMENT '处理时间',
	-- 处理人
	operation_person_id varchar(64) COMMENT '处理人',
	-- 处理描述
	operation_description varchar(500) COMMENT '处理描述',
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
) COMMENT = '项目处理表';


-- 项目周报表
CREATE TABLE oa_project_weekreport
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 标题
	title varchar(64) COMMENT '标题',
	-- 编号
	report_no varchar(64) COMMENT '编号',
	-- 周报文档
	project_report_file varchar(1000) COMMENT '周报文档',
	-- 填写人
	write_user_id varchar(64) COMMENT '填写人',
	-- 完成任务数
	completed_task varchar(64) COMMENT '完成任务数',
	-- 新增任务数
	added_task varchar(64) COMMENT '新增任务数',
	-- 更新人
	update_user_id varchar(64) COMMENT '更新人',
	-- 所属项目
	project_id varchar(64) COMMENT '所属项目',
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
) COMMENT = '项目周报表';



/* Create Foreign Keys */

ALTER TABLE oa_project_document
	ADD FOREIGN KEY (project_id)
	REFERENCES oa_project (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE oa_project_operation
	ADD FOREIGN KEY (project_id)
	REFERENCES oa_project (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE oa_project_weekreport
	ADD FOREIGN KEY (project_id)
	REFERENCES oa_project (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



