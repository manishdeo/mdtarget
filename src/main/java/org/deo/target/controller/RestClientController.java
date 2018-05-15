package org.deo.target.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

/**
 * REST service client
 */
@Controller
public class RestClientController {

	protected static Logger logger = Logger.getLogger("controller");

	private RestTemplate restTemplate = new RestTemplate();


	@RequestMapping("/")
	public String home(Model map) {
		return "index";
	}

	/**
	 * Retrieves all records from the REST provider and displays the records in
	 * a JSP page
	 * 
	 * @param <T>
	 */
	@RequestMapping(value = "/getallproviders", method = RequestMethod.GET)
	public <T> String getAllProviders(Model model) {
		logger.debug("Retrieve all providers");
		
		String url = "http://svc.metrotransit.org/NexTrip/Routes?format=json";

		try {
			ResponseEntity<Object[]> response = restTemplate.getForEntity(url, Object[].class);
			model.addAttribute("textvaluepair", response.getBody());

		} catch (Exception e) {
			logger.error(e);
		}

		return "services";
	}

	@RequestMapping(value = "/getdirection", method = RequestMethod.POST)
	public String getDirection(@RequestParam("route") String route, 
								@RequestParam(value = "direction") Integer direction,
								@RequestParam(value = "info") String businfo,
									Model model) {
		
		logger.debug("Retrieve all bus route with direction");

		String url ="http://svc.metrotransit.org/NexTrip/Stops/" + route + "/"+direction+"?format=json";

		try {
			ResponseEntity<Object[]> response = restTemplate.getForEntity(url, Object[].class);
			
			model.addAttribute("businfo", businfo);
			model.addAttribute("route", route);
			model.addAttribute("nextdirection", direction);
			model.addAttribute("nexttrip", response.getBody());

		} catch (Exception e) {
			logger.error(e);
		}

		return "direction";
	}
	
	@RequestMapping(value = "/nexttripdeparture", method = RequestMethod.POST)
	public String nextTripDeparture(@RequestParam("route") String route, 
						@RequestParam(value = "direction") Integer direction,
						@RequestParam(value = "code") String code,
						@RequestParam(value = "stop") String stop,
						Model model) {
		logger.debug("Retrieve all next departure");


		String url ="http://svc.metrotransit.org/NexTrip/" + route + "/"+direction+"/"+code+"?format=json";

		try {
			ResponseEntity<Object[]> response = restTemplate.getForEntity(url, Object[].class);
			
			model.addAttribute("stop", stop);
			model.addAttribute("routes", response.getBody());
			

		} catch (Exception e) {
			logger.error(e);
		}

		return "routepage";

	}
	

	
}
