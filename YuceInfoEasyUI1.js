/**
 * 
 * 
 */
//初始化列表，从后台读取数据
$('#YuceListTable').datagrid({
	columns : [ [ // 设置列表各列对应的字段和标题等
	{
		field : 'yuce_week', // 绑定数据源ID
		title : '周数', // 显示列名称
		align : 'center', // 内容在列居中
		width : 80 // 列的宽度
	}, {
		field : 'yuce_num',
		title : '销售额',
		align : 'center',
		width : 80
	},   ] ],
	remoteSort: false,
	pagination : true, // 开启分页
	url: YuceHandleUrl + "?func=All", // 获取数据地址
	loadFilter : pagerFilter, // 调用分页函数
});

// 分页函数
function pagerFilter(data) {
	if (typeof data.length == 'number' && typeof data.splice == 'function') {
		data = {
			total : data.length,
			rows : data
		}
	}
	var YuceListTable = $(this);
	var opts = YuceListTable.datagrid('options');
	var pager = YuceListTable.datagrid('getPager');
	pager.pagination({
		onSelectPage : function(pageNum, pageSize) {
			opts.pageNumber = pageNum;
			opts.pageSize = pageSize;
			pager.pagination('refresh', {
				pageNumber : pageNum,
				pageSize : pageSize
			});
			YuceListTable.datagrid('loadData',data);
		}
	});
	if (!data.originalRows) {
		data.originalRows = (data.rows);
	}
	var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
	var end = start + parseInt(opts.pageSize);
	data.rows = (data.originalRows.slice(start, end));
	return data;
}

// 新增礼物基本信息
function newYuce() {
	$('#Yuceinfodlg').dialog('open').dialog('setTitle', '添加礼物基本信息');
	$('#cinfofmyuce').form('clear');
	$("#visit_state").val('洽谈');          //select设置默认选择礼物状态“洽谈”，性别“男”

	$("#sex").val('——请选择礼物性别——');
	$('#cinfofmyuce').find('input').attr('readonly',false);
	$('#cinfofmyuce').find('select').attr({"disabled" : false});
	$('#visit_state').attr("readonly", true );

	Yuceinfodlgurl = YuceHandleUrl + "?func=Add";// 设置 url
}

// 编辑礼物基本信息
function editYuce() {
	var row = $('#YuceListTable').datagrid('getSelected');
	if (row) {
		$('#Yuceinfodlg').dialog('open').dialog('setTitle', '编辑礼物基本信息');
		$('#cinfofmyuce').form('load', row);
		$('#cinfofmyuce').find('input').attr('readonly',false);
		$('#cinfofmyuce').find('select').attr({"disabled" : false});
		$('#visit_state').attr("readonly", true );
		$('#staff_id').attr("readonly", true );
		$('#visit_name').attr({"readonly" : "readonly"});// 设置姓名输入框“只读”，即不可修改
		var visit_id = row.visit_id;
		Yuceinfodlgurl = YuceHandleUrl + '?visit_id=' + visit_id + "&func=Edit";// 设置 url
	} else {// 如果一条数据都没选择
		$.messager.alert('提示', '请选择要进行编辑的记录', 'warning');
	}
}

function isNumber(val){
    var regPos = /^[0-9]+.?[0-9]*/;
    if(regPos.test(val) && val > 0){  //判断是否是正的数字
        return true;
    }else{
        return false;
    }
}

function isInteger(val){
    if( val > 0 && val%1 === 0 ){     //判断是否是正整数
        return true;
    }else{
        return false;
    }
}

function isInteger2(val){
    if( val >= 0 && val%1 === 0 ){     //判断是否是非负整数
        return true;
    }else{
        return false;
    }
}

function isAgeValid(val){
    if ( val >= 8 && val <=100){
     return true;
    }
    return false;
}

function isPhoneValid(val){
    if ( val.length == 11){
     return true;
    }
    return false;
}

function isEnough(val){
    if ( val.length == 18){
     return true;
    }
    return false;
}

//保存礼物基本信息，新增和编辑共用
function saveYuce() {
	
	$('#cinfofmyuce').form('submit', {
		url : Yuceinfodlgurl,// url 的参数值保存在变量 Yuceinfodlgurl 中，可以在新增和修改记录的
		// js函数里修改这个参数值，以实现对话框的公用
		onSubmit : function() {
			return $(this).form('validate');// 对 form 中控件的输入值进行验证。
		},
		success : function(result) {
			debugger
			var result = eval('(' + result + ')');// 处理后台的返回值
			if (result.success) {
				$.messager.show({ // 显示返回消息
					title : '消息',
					msg : result.success
				});
				$('#Yuceinfodlg').dialog('close'); // 关闭对话框
				$('#YuceListTable').datagrid('reload'); // 重新加载数据
			} else {
				if (result.errorMsg) {
					$.messager.show({
						title : '消息',
						msg : result.errorMsg
					});
				}
			}
		}
	})
}

// 查询礼物基本信息，根据姓名搜索
function searchYuce() {
	var $uname = $('#cname');
	var ByName = $uname.val();
	$('#YuceListTable').datagrid('load').datagrid({
		url : YuceHandleUrl+ '?cname=' + encodeURI(ByName)+ "&func=Query" //使用encodeURI（）函数解决中文乱码问题
	});
}

function editYuce2() {
	
	$.messager.alert($('#YuceListTable'));
}
//删除礼物基本信息
function deleteYuce() {
	var row = $('#YuceListTable').datagrid('getSelected');
	if (row) {
		$.messager.confirm('Confirm', '确认要删除这条记录?', function(r) {
			if (r) {
				$.post(YuceHandleUrl + "?func=Del", {
					// 传递选中的行中指定列，注意名字和 field 相同！
					visit_id : row.visit_id
				}, function(result) {
					if (result.success) {
						$.messager.show({ // 显示返回消息
							title : '消息',
							msg : result.success
						});
					} else {
						if (result.errorMsg) {
							$.messager.show({
								title : '消息',
								msg : result.errorMsg
							});
						}
					}
					$('#YuceListTable').datagrid('reload'); // 重新加载数据
				}, 'json');
			}
		});
	} else {//如果一条数据都没选择
		$.messager.alert('提示', '请选择要删除的记录', 'warning');
	}
}


//查看礼物详细信息
function YuceMoreInfo() {
	var row = $('#YuceListTable').datagrid('getSelected');
	if (row) {
		$('#Yuceinfodlg').dialog('open').dialog('setTitle', '查看礼物详细信息');
		$('#cinfofmyuce').form('load', row);
		$('#cinfofmyuce').find('input').attr('readonly',true);
		$('#cinfofmyuce').find('select').attr({"disabled" : true});
	} else {// 如果一条数据都没选择
		$.messager.alert('提示', '请选择要进行编辑的记录', 'warning');
	}
}