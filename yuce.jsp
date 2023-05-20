<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
html, body {
	height: 100%;
}
</style> 
<title>Insert title here</title>
<!-- 引入Jquery -->
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui-1.10.11/jquery.min.js"></script>
<!-- 引入Jquery_easyui -->
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui-1.10.11/jquery.easyui.min.js"></script>
<!-- 引入easyUi国际化--中文 -->
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui-1.10.11/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入easyUi默认的CSS格式--蓝色 -->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-easyui-1.10.11/themes/default/easyui.css" />
<!-- 引入easyUi小图标 -->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-easyui-1.10.11/themes/icon.css" />
<script type="text/javascript">
var YuceHandleUrl="<%=path%>//YuceInfoHandle";

var staff_id = '<%=session.getAttribute("staff_id")%>';
</script>
</head>
<body>
	<table id="YuceListTable" title="我的预测" toolbar="#toolbar"
		style="width: 100%; height: auto" rownumbers="true" fitColumns="true"
		singleSelect="true">
	</table>

	<div id="toolbar">
		<table>
			<tr>
				<td><a href="#" class="easyui-linkbutton" iconCls="icon-jia"
					plain="true" onclick="newYuce()">新增销售信息</a>
					</td>
				<td>
					<div class="datagrid-btn-separator"></div>
				</td>
				<td><a href="#" class="easyui-linkbutton" iconCls="icon-gai"
					plain="true" onclick="editYuce()">修改销售信息</a>
				</td>
				<td>
					<div class="datagrid-btn-separator"></div>
					</td>
				<td><a href="#" class="easyui-linkbutton" iconCls="icon-yuce"
					plain="true" onclick="editYuce2()">预测</a>
				</td>
				<td>
					<div class="datagrid-btn-separator"></div>
					</td>
				<td>
				</td>
				
					<div class="datagrid-btn-separator"></div>
				</td>
				
			</tr>
		</table>
	</div>

	<div id="Yuceinfodlg" title="预测信息" class="easyui-dialog"
		style="width: 900px; height: 430px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="cinfofmyuce" method="post">
			<table width="850" border="1">
				<colgroup>
					<col span="1" width="300">
					<col span="1" width="300">
					<col span="1" width="300">
				</colgroup>
				<tr>
					<td class="citem"><label>销售额</label><input
						name="yuce_num" id="yuce_num" class="easyui-validatebox"
						required="true" /></td>
							<td class="citem"><label>周数</label><input
						name="yuce_week" id="yuce_week"
						class="easyui-validatebox"	required="true" /></td>
					</select></td>
					
					
				</tr>
				<tr>
				
				
				
				</tr>
			
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-cun" plain="true"
			onclick="saveYuce()">保存</a> 
		<a href="#" class="easyui-linkbutton" iconCls="icon-fou" plain="true"
			onclick="javascript:$('#Yuceinfodlg').dialog('close')">退出</a>
	</div>

<script type="text/javascript" src="<%=path%>/js/YuceInfoEasyUI1.js"></script>
</body>
</html>