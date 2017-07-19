SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS oa_loan_daily_approval;
DROP TABLE IF EXISTS oa_loan_main;
DROP TABLE IF EXISTS oa_loan_repayment;




/* Create Tables */

-- 日常借支审批表
CREATE TABLE oa_loan_daily_approval
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 是否用于采购
	is_purchase char(1) COMMENT '是否用于采购',
	-- 借款人
	loan_user_id varchar(64) COMMENT '借款人',
	-- 项目经理
	project_manager_id varchar(64) COMMENT '项目经理',
	-- 借支事由
	loan_reason varchar(500) COMMENT '借支事由',
	-- 借支金额
	loan_money decimal(19,1) COMMENT '借支金额',
	-- 标题
	title varchar(100) COMMENT '标题',
	-- 部门负责人意见
	exam2_opinion varchar(200) COMMENT '部门负责人意见',
	-- 财务副总意见
	exam3_opinion varchar(200) COMMENT '财务副总意见',
	-- 总经理意见
	exam4_opinion varchar(200) COMMENT '总经理意见',
	-- 项目经理意见
	exam5_opinion varchar(200) COMMENT '项目经理意见',
	-- 会计意见
	exam6_opinion varchar(200) COMMENT '会计意见',
	-- 出纳意见
	exam7_opinion varchar(200) COMMENT '出纳意见',
	-- 申请时间
	approval_time datetime COMMENT '申请时间',
	-- 审批通过时间
	approval_pass_time datetime COMMENT '审批通过时间',
	-- 流程实例ID
	proc_ins_id varchar(64) COMMENT '流程实例ID',
	-- 申请单号
	approval_no varchar(64) COMMENT '申请单号',
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
	-- 审批状态（0：未送审；1：部门副总审批；2：人力资源审批；3：行政人事副总审批；x：已结案；y：已销毁）
	status char(1) DEFAULT '0' COMMENT '审批状态（0：未送审；1：部门副总审批；2：人力资源审批；3：行政人事副总审批；x：已结案；y：已销毁）',
	-- 是否已进入流程（0：未开启；1：已开启）
	is_start char(1) DEFAULT '0' COMMENT '是否已进入流程（0：未开启；1：已开启）',
	PRIMARY KEY (id)
) COMMENT = '日常借支审批表';


-- 借支单主表
CREATE TABLE oa_loan_main
(
	-- 系统编号
	id varchar(64) NOT NULL COMMENT '系统编号',
	-- 借支单类型
	loan_type char(1) COMMENT '借支单类型',
	-- 借支单状态
	loan_status char(1) COMMENT '借支单状态',
	-- 借支人
	loan_user_id varchar(64) COMMENT '借支人',
	-- 借支单号
	loan_no varchar(64) COMMENT '借支单号',
	-- 申请日期
	approval_time datetime COMMENT '申请日期',
	-- 借支金额
	loan_money decimal(19,1) COMMENT '借支金额',
	-- 借支日期
	loan_time datetime COMMENT '借支日期',
	-- 销账日期
	write_off_time datetime COMMENT '销账日期',
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
	PRIMARY KEY (id),
	UNIQUE (id)
) COMMENT = '借支单主表';


-- 借支还款表
CREATE TABLE oa_loan_repayment
(
	-- 系统编号
	id varchar(64) NOT NULL COMMENT '系统编号',
	-- 金额
	repayment_money decimal(19,1) COMMENT '金额',
	-- 销账类型
	repayment_type char(1) COMMENT '销账类型',
	-- 关联的借支单ID
	loan_main_id varchar(64) COMMENT '关联的借支单ID',
	-- 借支人
	loan_user_id varchar(64) COMMENT '借支人',
	-- 报销单号
	billing_no varchar(64) COMMENT '报销单号',
	-- 经办人
	deal_user_id varchar(64) COMMENT '经办人',
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
	PRIMARY KEY (id),
	UNIQUE (id)
) COMMENT = '借支还款表';



