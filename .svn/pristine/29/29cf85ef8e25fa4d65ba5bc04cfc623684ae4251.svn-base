SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS oa_emp_join_approval;
DROP TABLE IF EXISTS oa_emp_opinion;




/* Create Tables */

-- 员工入职审批表
CREATE TABLE oa_emp_join_approval
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 性别
	sex char(1) COMMENT '性别',
	-- 最高学历
	degrees char(1) COMMENT '最高学历',
	-- 入职时间
	entry_time datetime COMMENT '入职时间',
	-- 姓名
	emp_name varchar(64) COMMENT '姓名',
	-- 民族
	nation varchar(64) COMMENT '民族',
	-- 归属部门
	office_id varchar(64) COMMENT '归属部门',
	-- 职务
	duty varchar(64) COMMENT '职务',
	-- 职称
	title varchar(64) COMMENT '职称',
	-- 身份证号
	id_number varchar(64) COMMENT '身份证号',
	-- 现家庭住址
	home_address varchar(64) COMMENT '现家庭住址',
	-- 试用期工资
	probation_salary varchar(64) COMMENT '试用期工资',
	-- 正式期工资
	regular_salary varchar(64) COMMENT '正式期工资',
	-- 流程实例ID
	proc_ins_id varchar(64) COMMENT '流程实例ID',
	-- 部门副总意见
	dept_minister_opinion varchar(200) COMMENT '部门副总意见',
	-- 人力资源部意见
	hr_opinion varchar(200) COMMENT '人力资源部意见',
	-- 行政人事副总意见
	hr_minister_opinion varchar(200) COMMENT '行政人事副总意见',
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
	-- 是否已经转为用户信息数据（0：未转；1：已转；）
	is_converttouser char(1) DEFAULT '0' COMMENT '是否已经转为用户信息数据（0：未转；1：已转；）',
	-- 是否已进入流程（0：未开启；1：已开启）
	is_start char(1) DEFAULT '0' COMMENT '是否已进入流程（0：未开启；1：已开启）',
	PRIMARY KEY (id)
) COMMENT = '员工入职审批表';


CREATE TABLE oa_emp_opinion
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 意见类别（0：已有漏洞；1：新功能）
	type char(1) DEFAULT '0' COMMENT '意见类别（0：漏洞提交；1：新功能建议）',
	-- 意见标题
	title varchar(64) NOT NULL COMMENT '意见标题',
	-- 意见
	opinion varchar(1000) NOT NULL COMMENT '意见',
	-- 附件
	file varchar(1000) COMMENT '附件',
	-- 是否已处理（0：未处理；1：已处理）
	isTreated char(1) DEFAULT '0' COMMENT '是否已处理（0：未处理；1：已处理）',
	-- 处理人
	treated_user_id varchar(64) COMMENT '处理人',
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
)COMMENT = '用户意见表';



