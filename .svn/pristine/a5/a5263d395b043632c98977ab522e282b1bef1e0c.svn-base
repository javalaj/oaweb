<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true"%>
<script type="text/javascript">
	$(document).ready(function() {

		$("#${id} thead tr th input.i-checks").on('ifClicked', function(event) {
			if (true == $(this).is(':checked')) {
				$("#${id} tbody tr td input.i-checks").iCheck('uncheck');
			} else {
				$("#${id} tbody tr td input.i-checks").iCheck('check');
			}

		});

		var subChk = $("#${id} tbody tr td input.i-checks");

		subChk.on('ifClicked', function(event) {
			if (true == $(this).is(':checked')) {
				if (subChk.filter(":checked").length - 1 >= subChk.length) {
					$("#${id} thead tr th input.i-checks").iCheck('check');
				} else {
					$("#${id} thead tr th input.i-checks").iCheck('uncheck');
				}
			} else {
				if (subChk.filter(":checked").length + 1 >= subChk.length) {
					$("#${id} thead tr th input.i-checks").iCheck('check');
				} else {
					$("#${id} thead tr th input.i-checks").iCheck('uncheck');
				}
			}

		});

	});
</script>