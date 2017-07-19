SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS sys_workflow_var;




/* Create Tables */

-- 工作流变量表
CREATE TABLE sys_workflow_var
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 流程名称
	workflow_name varchar(64) COMMENT '流程名称',
	-- 流程标识
	workflow_identification varchar(64) COMMENT '流程标识',
	-- 变量名称
	var_name varchar(64) COMMENT '变量名称',
	-- 变量描述
	var_description varchar(64) COMMENT '变量描述',
	-- 变量值
	var_value varchar(1000) COMMENT '变量值',
	-- 变量类型（0：自解析；1：用户名；2：角色名）
	var_type char(1) DEFAULT '0' COMMENT '变量类型（0：自解析；1：用户名；2：角色名）',
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
) COMMENT = '工作流变量表';



