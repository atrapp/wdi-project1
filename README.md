wdi-project1
============

http://wdi-project1-helpr.herokuapp.com/

https://github.com/atrapp/wdi-project1/blob/master/README.md

Title
=====
Helpr!

Description
===========
Here you can create requests or offers of help in different categories (e.g. Computer, Shopping, Pets etc.) at public locations which you can search within a radius of your given address.

http://imgur.com/MFAT4VW


API
===
Geokit for Rails. Consists of a generic Gem (geokit) and a Rails plugin (geokit-rails). It calculates the distance of two points on the earth, provides geocoding (finding associated coordinates - latitude and longitude - from e.g. given addresses) from multiple providers (Google, Yahoo, Geocoder.us and Geocoder.ca). 

Passing on the coordinates to StaticMapHelper the app displays a Google map image with address marker.

Favorite code
=============
offers_controller.rb

def search
  @search_cat = params[:search_cat].values.first 
  @start_location = params[:start_location]
  @radius = params[:radius]
      
  if @search_cat !="" && @start_location !="" && @radius !="" 
    nearby_locations = Location.within(@radius, origin: @start_location)
    potential_offers = nearby_locations.map { |location| location.offers }.flatten
    @offers = potential_offers.select { |offer| offer.category.title == @search_cat} 
  else
    redirect_to offers_path
  end
end
