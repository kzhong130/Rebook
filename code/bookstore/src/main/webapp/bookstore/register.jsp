<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>用table制作qq登录页面</title>
<meta charset="utf-8">
</head>
<body background="bg.jpg" topmargin="10" leftmargin="250">

<form>
<table width="800" height="600" border="0" cellpadding="5" cellspacing="5">

<tr align="left"><td colspan="3">|注册账号</td></tr>

<tr height="10" bgcolor="black"><td colspan="3"></td></tr>

<tr>
<td width="20%" align="right"><lable for="name">注册</lable></td>
<td width="60%"><input id="name" type="text" placeholder="输入昵称" style="width:100%;"></td>
<td><span>昵称不可以为空</span></td>
</tr>

<tr>
<td align="right"><lable for="password">密码</lable></td>
<td><input id="password" type="password" placeholder="输入密码" style="width:100%"></td>
<td><span>必须包含特殊字符</span></td>
</tr>

<tr>
<td align="right"><lable for="okps">确认密码</lable></td>
<td><input id="okps" type="password" placeholder="再次输入密码" style="width:100%"></td>
<td><span>密码要一致<span></td>
</tr>

<tr>
<td align="right"><lable for="man">性别</lable></td>
<td><input id="man" name="sex" type="radio">男<input type="radio" name="sex">女</td>
<td></td>
</tr>

<tr>
<td align="right">生日</td>
<td>
<select><option>1988年</option><option>1987年</option><option>1986年</option></select>
<select><option>12月</option><option>11月</option><option>10月</option></select>
<select><option>11d</option><option>12d</option><option>13d</option></select>
</td>
<td></td>
</tr>

<tr>
<td align="right">所在地</td>
<td>
<select><option>山东</option><option>北京</option></select>
<select><option>淄博</option><option>海淀</option></select>
</td>
<td></td>
</tr>

<tr>
<td align="right">手机号</td>
<td><input type="tel" placeholder="输入手机号码" style="width:100%;"></td>
<td></td>
</tr>

<tr>
<td></td>
<td>
<font size="1">
<p>可通过手机号码快速找回密码<br>
中国大陆地区以外手机点这里&nbsp&nbsp&nbsp<a href="https://www.baidu.com">点击这里</a></p>
</font>
</td>
<td></td>
</tr>

<tr>
<td></td>
<td>
<input type="text" style="width:60%;"><input type="button" value="获取验证码" style="width:39%">
</td>
<td></td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="立即注册" style="width:100%;"></td>
<td></td>
</tr>

<tr>
<td></td>
<td>
<font size="1">
<input type="checkbox" name="accept">同时开通qq空间<br>
<input type="checkbox" name="accept">我已经阅读相关条款
</font>
</td>
<td></td>
</tr>

</table>
</form>

</body>
</html>
