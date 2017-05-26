package mx.com.amx.unotv.params.portlet;

import java.io.*;
import javax.portlet.*;

import org.apache.log4j.Logger;

public class MX_UNO_PBO_ParamsPortlet extends javax.portlet.GenericPortlet {
	
	private Logger logger=Logger.getLogger(MX_UNO_PBO_ParamsPortlet.class);
	
	public void init() throws PortletException{
		super.init();
	}

	
	public void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		logger.debug("===== doView =====");
		String dispatch=(String) (request.getPortletSession().getAttribute("dispatch")==null || request.getPortletSession().getAttribute("dispatch").equals("")?"inicio":request.getPortletSession().getAttribute("dispatch"));

		try {
			logger.debug("dispatch: "+dispatch);
			
			if(dispatch.equalsIgnoreCase("inicio")){
				dispatch="/resources/jsp/inicio_params.jsp";
			}
			
			response.setContentType(request.getResponseContentType());
			PortletRequestDispatcher rd = getPortletContext().getRequestDispatcher(dispatch);
			rd.include(request,response);
		} catch (Exception e) {
			logger.error("Error DoView: ",e);
		}
	}
	
	public void processAction(ActionRequest request, ActionResponse response) throws PortletException, java.io.IOException {
		// TODO: auto-generated method stub
	}

}
