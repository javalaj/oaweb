SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS oa_doc;
DROP TABLE IF EXISTS oa_doc_column;
DROP TABLE IF EXISTS oa_doc_read_apply;




/* Create Tables */

-- 文档管理表
CREATE TABLE oa_doc
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 标题
	title varchar(64) NOT NULL COMMENT '标题',
	-- 关键词
	keyword varchar(200) NOT NULL COMMENT '关键词',
	-- 文档归属部门
	office_id varchar(64) COMMENT '文档归属部门',
	-- 是否需要借阅（0：否；1：是）
	is_need_lend char(1) DEFAULT '0' COMMENT '是否需要借阅（0：否；1：是）',
	-- 是否为公共文档（0：否；1：是）
	is_public char(1) DEFAULT '0' COMMENT '是否为公共文档（0：否；1：是）',
	-- 附件
	file varchar(1000) COMMENT '附件',
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
) COMMENT = '文档管理表';


-- 文档栏目表
CREATE TABLE oa_doc_column
(
	-- 系统编号
	id varchar(64) NOT NULL COMMENT '系统编号',
	-- 父栏目编号
	parent_id varchar(64) COMMENT '父栏目编号',
	-- 父栏目树
	parent_ids varchar(2000) COMMENT '父栏目树',
	-- 名称
	name varchar(64) COMMENT '名称',
	-- 排序
	sort decimal(10,0) COMMENT '排序',
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
) COMMENT = '文档栏目表';


-- 文档阅读申请管理
CREATE TABLE oa_doc_read_apply
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 申请的文档
	doc_id varchar(64) COMMENT '申请的文档',
	-- 借阅状态（0：申请中；1：同意；2：不同意）
	lend_status char(1) COMMENT '借阅状态（0：申请中；1：同意；2：不同意）',
	-- 借阅人
	lend_user_id varchar(64) COMMENT '借阅人',
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
) COMMENT = '文档阅读申请管理';



