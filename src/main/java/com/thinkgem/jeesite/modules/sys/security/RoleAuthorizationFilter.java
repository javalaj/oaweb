/*package com.thinkgem.jeesite.modules.sys.security;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.authz.RolesAuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;

public class RoleAuthorizationFilter extends RolesAuthorizationFilter {

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
        Subject subject = getSubject(request, response);  
        String[] rolesArray = (String[]) mappedValue;  
  
        if (rolesArray == null || rolesArray.length == 0) {  
            // no roles specified, so nothing to check - allow access.  
            return true;  
        }  
  
        Set<String> roles = CollectionUtils.asSet(rolesArray);  
        for (String role : roles) {  
            if (subject.hasRole(role)) {  
                return true;  
            }  
        }  
        return false;
	}
	
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
    	HttpServletRequest httpServletRequest = (HttpServletRequest) request; 
    	HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        Subject subject = getSubject(request, response);
        if (subject.getPrincipal() == null) {
        	

        	if (!"XMLHttpRequest".equalsIgnoreCase(httpServletRequest.getHeader("X-Requested-With"))) {
        		saveRequestAndRedirectToLogin(request, response);
        	}else{
        		httpServletResponse.setCharacterEncoding("UTF-8"); 
        		PrintWriter out = httpServletResponse.getWriter(); 
        		out.println("{success:false,message:'您尚未登录或登录时间过长,请重新登录!'}"); 
        		out.flush(); 
        		out.close(); 
        	}
        } else {
        	if (!"XMLHttpRequest".equalsIgnoreCase(httpServletRequest.getHeader("X-Requested-With"))) {
        		String unauthorizedUrl = getUnauthorizedUrl();
                if (StringUtils.hasText(unauthorizedUrl)) {
                    WebUtils.issueRedirect(request, response, unauthorizedUrl);
                } else {
                    WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
                }
        	}else{
        		httpServletResponse.setCharacterEncoding("UTF-8"); 
        		PrintWriter out = httpServletResponse.getWriter(); 
        		out.println("{success:false,message:'您没有足够的权限执行该操作!'}"); 
        		out.flush(); 
        		out.close(); 
        	}
            
        }
        return false;
    }

}
*/