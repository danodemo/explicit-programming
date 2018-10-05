module Sham

	class Shamlisting
		
		def initialize(count)
				@count = count
				@document = {}
	 	end

	  def generate_listing
	  		static_fields
	    	generate_fields
	    	generate_address
	    	generate_features
	    	attach_images
	    	@document
	  end

	  private

	 	def static_fields
	  		@document = {
			    internal_id: nil,
			    orig_mls_number: nil,
			    mls_number: nil,
			    price_change_dts: @count.days.ago,
			    img_change_dts: @count.days.ago,
			    first_seen_dts: @count.days.ago,
			    sale_type: ['For Sale', 'For Rent'].sample,
			    listing_type: ['Short Sale', 'Foreclosure', 'New Construction', nil].sample,
			    property_type: ['Single Family Home', 'Single Family Home', 'Single Family Home', 'Condo', 'Condo', 'Townhouse', 'Land', 'Multi-Family'].sample,
			    property_type_id: nil,
			    status: 'Active',
			    foreclosure: nil,
			    short_sale: nil,
			    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi consequat quam nulla, nec gravida justo mollis a. Cras egestas arcu at metus gravida elementum. Duis sodales magna eu augue pharetra, sed tincidunt libero iaculis. Suspendisse consequat urna id lectus imperdiet sollicitudin. Sed et pharetra eros, vel blandit arcu. Maecenas quis mauris lectus. Ut risus felis, fringilla et consequat ut, mollis vitae nibh.',
			    virtual_tour_url: nil,
			    listing_office: 'SHAM Realty Group',
			    listing_office_id: '123SHAM',
			    listing_agent: 'Nigel Pensworth Livingston III',
			    listing_agent_id: 'NPL123',
			    colisting_agent_id: nil,
			    bedrooms: rand(1..6),
			    fullbaths: rand(1..4),
			    halfbaths: rand(0..4),
			    bathrooms: nil,
			    price: rand(50000..1000000),
			    taxes: nil,
			    tax_year: '2018',
			    hoa_monthly: [0, 100, 250, 500, 750, 1000, 1500, 2000].sample,
			    year_built: rand(1950..2018),
			    sqft: nil,
			    sqft_source: ['County Assessor', 'Owner', 'Realtor', 'Other'].sample,
			    acres: nil,
			    school_district: 'SHAM County',
			    elementary_school: ['SHAM Elementary', 'St. Sham Primary School'].sample,
			    middle_school: 'SHAM Middle School',
			    high_school: 'SHAM High School',
			    mls_area: 'Mountains',		     
			    county: 'Sham',
			    city: nil,
			    state: 'GA',
			    citystate: nil, #Do I even need to do this?
			    zip: [30143, 30705, 30708, 30521, 30511, 30525, 30177].sample,
			    address: nil,
			    subdivision: ['Crispy Estates', 'Derpington Run', 'Groucho Marx Estates', 'The Hill at Highwater', 'A Rundown Bunch of Houses', 'Merkins Abound', nil].sample,
			    street_name: nil,
			    building: nil,
			    unit_number: nil,
			    latitude: nil,
			    longitude: nil,
		    }
	 	end

	  def generate_fields
	  		@document[:prop_type_id] = prop_type_id
	    	@document[:bathrooms] = @document[:halfbaths].to_i + @document[:fullbaths].to_i
	    	@document[:taxes] = (@document[:price] / 100).to_f.round(2)
	    	@document[:sqft] = sqft
	    	@document[:acres] = acres
	    	@document[:foreclosure] = ( @document[:listing_type] == 'Foreclosure' )
	    	@document[:short_sale] = ( @document[:listing_type] == 'Short Sale' )
	    	@document[:building] = buildingname(@document)
	    	@document[:unit_number] = unitnumbers(@document)
	  end

	 	def generate_address
				street_name = ['Willivee Rd SE', 'Brighton St NW', 'S Ketamine Ave', 'W Dopamine Pl', 'Dogwood Dr NE', 'North Ave SW', 'Southwest Ave NE', 'NW Southron Pl', 'Frank Zappa Memorial Highway'].sample
				@document[:street_name] = street_name
				@document[:city] = ['Jasper', 'Talking Rock', 'Shamtown', 'Nelson', 'Baldwin', 'Bonbon', 'Derpsburg', 'Smolpupper City', 'New Oldtown'].sample
				@document[:address] = ran(400..4000).to_s + ' ' + street_name
				#add code to handle Lat-Long here
		end

	  def generate_features
		   	categories = Shamfeatures.new
		    @document.merge!(categories)
	  end

		def attach_images
				exterior_pics = []
				interior_pics = []

				images = {"images": [],}
				#each listing should get one sample from the exterior pics, and then 2-3 from the interior pics

		end

		def prop_type_id
				saletype = @document[:sale_type]
				case @document[:property_type]
				when 'Single Family Home'
					saletype == 'For Sale' ? 1 : 14
				when 'Condo'
					saletype == 'For Sale' ? 4 : 17
				when 'Townhouse'
					saletype == 'For Sale' ? 3 : 16
				when 'Land'
					5
				when 'Multi-Family'
					saletype == 'For Sale' ? 6 : 19
				end
		end

		def sqft
				case @document[:property_type]
				when 'Single Family Home', 'Multi-Family'
					rand(1000..15000)
				when 'Condo', 'Townhouse'
					rand(550..2000)
				when 'Land'
					nil
				end
		end

		def acres
				case @document[:property_type]
				when 'Single Family Home', 'Multi-Family'
					['.1', '.25', '.5', '.75', rand(1..10)].sample.to_f
				when 'Condo', 'Townhouse'
					0
				when 'Land'
					rand(1..1000)
				end
		end

		def buildingname
				if @document[:property_type] == 'Condo'
					['SHAM Tower', 'The Iron Tower', 'The Doldrums', 'Some Guy\'s Barn', 'Jenga Tower', 'SHAM Center'].sample
				else
					nil
				end
		end

		def unitnumbers
				if @document[:building].blank?
					nil
				else
					rand(1..400)
				end
		end

	end
end