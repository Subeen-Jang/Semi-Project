<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="mdao" class="com.moim.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="sdao" class="com.moim.stat.StatDAO"></jsp:useBean>

<%
int idx=0;
if(request.getParameter("idx")!=null&&!request.getParameter("idx").equals("")){
	idx=Integer.parseInt(request.getParameter("idx"));
}
int result=mdao.dropMem(idx);

ArrayList<Integer> statarr=sdao.getInMoim(idx);
int result1=0;
int result2=0;
int result3=0;

if(result>0){
	result1=sdao.delStat(idx);
}
if(result>0){
	result2=sdao.makeMan(statarr);
}
if(result>0){
	result3=sdao.minusMem(statarr);
}
System.out.println(result1+" "+result2+" "+result3);
String msg=result>0?"탈퇴 완료":"탈퇴 실패";
session.invalidate();
%>
<script>
window.alert('<%=msg%>');
location.href='/moim/index.jsp';
</script>