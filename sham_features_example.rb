module Sham

	class Shamfeatures
		
		def initialize
			@categories = {}
			gogo_gadget_categories
			gogo_gadget_dynamic_fields
		  gogo_gadget_standard_fields
	 	end

  	def gogo_gadget_categories
  		@categories = {
  			'categories': {
		    	'General': {
		    		'Basement': ['Yes','No'].sample,
		    		'Parking': ['Garage', 'Carport', 'Off-Street', 'On-Street', 'Structure', 'None'].sample,
		    		'Parking Spaces': nil,
		    		'Stories': rand(1..4),
		    		'Style': ['Cabin', 'Cottage', 'Ranch', 'Victorian', 'Loft', 'Farm', 'Split-Level', 'Craftsman', 'Rowhome', 'Duplex', 'Triplex', 'Multiplex', 'Business', 'Office', 'High-Rise', 'Low-Rise', 'Acreage', 'Other'].sample,
		    		'Zoning': ['Commercial', 'Residential', 'Mixed-Use', 'Agriculture'].sample,
		    	},
		    	'Interior': {
		    		'Appliances': [],
		    		'Cooling': ['Central', 'Shared', 'Wall-Unit', 'None', 'Other'].sample,
		    		'Heating': ['Central Furnace', 'Shared', 'Under-Floor', 'Radiator', 'Wood Stove', 'Fireplace', 'None', 'Other'].sample,
		    		'Flooring': ['Hardwood - New', 'Hardwood - Reclaimed', 'Carpet', 'Concrete', 'Poured Concrete', 'Tile', 'Stone', 'Linoleum', 'Dirt'].sample,
		    		'Fireplace': ['Yes', 'No'].sample,
		    		'More Interior Features': [],
		    	},
		    	'Exterior': {
		    		'Pool': ['Yes', 'No', 'Community'].sample,
		    		'Construction': [( ['Pre-Fab', 'Modular', 'New Construction', 'Traditional'].sample ), ( ['Brick', 'Wood', 'Straw-Bale', 'Stone', 'Concrete', 'Steel'].sample )],
		    		'Roof': ['Shingle', 'Thatched', 'Composite', 'Concrete', 'Copper', 'Flat', 'Metal', 'Slate', 'Tar/Gravel', 'Tile', 'Wood', 'Other'].sample,
		    		'Lot Details': ['Cul de Sac', 'Dead-End', 'Wooded', 'Oversized', 'Shared', 'Sloped', 'Corner Lot', 'Flood Plain', 'Private'].sample,
		    		'View': ['Mountain', 'City', 'Forest', 'Lake', 'River', 'Skyline', 'Pool'].sample,
		    		'Waterfront': ['Yes', 'No'].sample,
		    		'Waterfront Details': [],
		    	},
		    	'Community': {
		    		'Building Amenities': [],
		    		'Community Features': [],
		    		'Accessibility Features': [],
		    		'Security Features': [],
		    		'Pets Allowed': ['Yes', 'No'].sample,
		    		'Green Energy Features': [],
		    	}
	    	},
	    }
  	end

  	def gogo_gadget_dynamic_fields
  		appliance_list = ['Oven', 'Stove', 'Refrigerator', 'Microwave', 'Dishwasher', 'Disposal', 'Trash Compactor', 'Blender', 'Food Processor', 'Wine Cellar', 'Humidor', 'Hot Plate', 'Washer', 'Dryer']
  		interior_list = ['Chandelier', 'Wall Sconces', 'Decorative Columns', 'Marble Countertops', 'Granite Countertops', 'New Cabinets', 'Sunroom', 'Garden Room', 'Built-In Shelves', 'Walk-In Closets', 'Mudroom', 'Laundry Room', 'Office', 'Wood Paneling', 'Guest Room', 'Vaulted Ceilings', 'Wide Doors', 'Insulated Windows', 'Speakers Throughout', 'Home Theatre', 'Upgraded Lighting', 'New Appliances', 'Roomba Included']
  		waterfront_list = ['Dock Included', 'No Dock Access', 'Public Marina', 'Lake Frontage', 'River Frontage', 'Other Frontage', 'Public Beach', 'Private Beach', 'Ocean Frontage']
  		building_list = ['Free Laundy', 'Paid Laundry', 'Elevator', 'Escalator', 'Emergency Generators', 'Concierge', 'Valet Parking', 'Private Gym', 'Pet Grooming Station', 'Public Transport']
  		community_list = ['Near Public Transit', 'Gym Membership Included', 'Country Club', 'Senior Community', 'Section-8 Accepted', 'Pet Friendly', 'Special Needs Community', 'Adjacent Park', 'Public Garden', 'Clubhouse', 'Gold Course', 'Marina Membership Included', 'Horse Property', 'Gated Community', 'Community Center']
  		accessibility_list = ['Wheelchair Accessible', 'Accessible Bathroom', 'Wide Doors/Entrance', 'Slip Bars', 'Ramp Entry', 'ADA Compliant Kitchen', 'Nurse Quarters']
  		security_list = ['Armed Guards', 'Electric Fence', 'Monitored Parking', 'Front-Desk Attendant (Human)', 'Front-Desk Attendant (Cyborg)', 'Secure Mail', 'Secure Parking', 'Safety Patrol', 'Guard Dogs', 'Robot Guard Dogs', 'Robot Guard Dogs with Lasers on their Heads', 'Off-Duty Police Security', 'Private Security', 'Moat', 'Drawbridge', 'Dragon', 'Electronic Locks']
  		green_list = ['Solar Roof', 'Solar Array', 'Geo-Thermal Power', 'Solar Windows', 'Energy Star Appliances', 'Energy Star Heating/Cooling', 'LEED Certification', 'HERS Certification', 'Improved Insulation', 'Water Recycling', 'Rain Collection', 'Hamster-Powered Generator']
  		#General
  		@categories['Parking Spaces'] = ( @categories['Parking'] == 'None' ? 0 : rand(1..6) )
  		#Interior
  		@categories['Appliances'] = sampler(2, 5, appliance_list)
  		@categories['More Interior Features'] = sampler(4, 8, interior_list)
  		#Exterior
  		@categories['Waterfront Details'] = ( @categories['Waterfront'] == 'No' ? nil : sampler(1, 2, waterfront_list) )
  		#Community
  		@categories['Building Amenities'] = sampler(2, 6, building_list)
  		@categories['Community Features'] = sampler(2, 6, community_list)
  		@categories['Accessibility Features'] = ['None', sampler(1, 4, accessibility_list)].sample
  		@categories['Security Features'] = sampler(2, 4, security_list)
  		@categories['Green Energy Features'] = ['None', sampler(1,4, green_list)].sample
  	end

  	def gogo_gadget_standard_fields
  		standard = {
  			'standardized': {
	  			'pets': @categories['Pets Allowed'] == 'Yes',
	      	'pool': @categories['Pool'] == 'Yes' || @categories['Pool'] == 'Community',
	      	'view': !@categories['View'].blank?,
	      	'garage': @categories['Parking'].include?('Garage'),
	      	'carport': @categories['Parking'].include?('Carport'),
	      	'fireplace': @categories['Fireplace'] == 'Yes',
	      	'basement': @categories['Basement'] == 'Yes',
	      	'waterfront': @categories['Waterfront'] == 'Yes',
	      	'eco_friendly': !@categories['Green Energy Features'].include?('None'),
	      	'single_story': @categories['Stories'] == 1, 
	      	'ada_accessible': !@categories['Accessibility Features'] == 'None'
	      }
  		}
  		@categories.merge!(standard)
  	end

  	def sampler(min, max, array)
  		( rand(min..max).times.map { array.sample } ).uniq
  	end

  	return @categories
	end
end