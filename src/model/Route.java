package model;

import java.util.ArrayList;

public class Route {
	private int route_index;
	private String loc;
	private ArrayList<RouteDetail> routeDetails;
	public Route(int route_index, String loc) {
		super();
		this.route_index = route_index;
		this.loc = loc;
		this.routeDetails = new ArrayList<RouteDetail>();
	}
	
	
	public int getRoute_index() {
		return route_index;
	}

	public String getLoc() {
		return loc;
	}

	public ArrayList<RouteDetail> getRouteDetails() {
		return routeDetails;
	}

	public void addDetail(int index, RouteDetail routeDetail) {
		routeDetails.add(index, routeDetail);
	}
	
	public String toString() {
		return route_index+"/"+loc+"/"+routeDetails.toString()+"\n";
	}
	
}
