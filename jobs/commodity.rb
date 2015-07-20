require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://agmarknet.nic.in/rep1newx1_today.asp"

commodity = []

begin
 page = Nokogiri::HTML(open(PAGE_URL))

 #SCHEDULER.every '6os' do
 SCHEDULER.every '35m' do
    n=0

	puts "Title - " + page.css("title")[0].text.to_s+ "\n"
    
    puts "Time - " + page.css("tr")[4].text.strip+ "\n"
    
    puts "Date - " + page.css("tr")[3].css("p strong font")[3].text.strip+ "\n"

    time = page.css("tr")[4].text.strip
    
	names = page.css("td font font[color='#000080']")
	puts "LIST OF COMMODITY.....- " + names.length.to_s+ "\n"
	
    
	names.each do |names| 
		#puts names.text
    	if names.text == "Tomato"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Tomato", value: "Rs."+rate }
        end
    	if names.text == "White Pumpkin"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "White Pumpkin", value: "Rs."+rate }
    	end
    	if names.text == "Onion"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Onion", value: "Rs."+rate }
    	end
    	if names.text == "Pumpkin"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Pumpkin", value: "Rs."+rate }
    	end
    	if names.text == "Potato"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Potato", value: "Rs."+rate }
    	end
    	if names.text == "Ashgourd"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Ashgourd", value: "Rs."+rate }
    	end
    	if names.text == "Banana - Green"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Banana - Green", value: "Rs."+rate }
    	end
    	if names.text == "Beetroot"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Beetroot", value: "Rs."+rate }
    	end
    	if names.text == "Bhindi"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Bhindi/Okra", value: "Rs."+rate }
    	end
    	if names.text == "Bottle Gourd"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Bottle Gourd", value: "Rs."+rate }
    	end
    	if names.text == "Bitter Gourd"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Bitter Gourd", value: "Rs."+rate }
    	end
    	if names.text == "Brinjal"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Brinjal/Eggplant", value: "Rs."+rate }
    	end
        if names.text == "Round"
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Brinjal&var=Round&dt=')]")).to_s
                rate = names.parent.parent.next_sibling.next_sibling.text.strip
                commodity[n+=1] = { label: "Brinjal:Round", value: "Rs."+rate }
            end
        end
        if names.text == "Round/Long"
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Brinjal&var=Round/Long&dt=')]")).to_s
                rate = names.parent.parent.next_sibling.next_sibling.text.strip
                commodity[n+=1] = { label: "Brinjal:Long", value: "Rs."+rate }
            end
        end
    	if names.text == "Cabbage"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Cabbage", value: "Rs."+rate }
    	end
    	if names.text == "Capsicum"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Capsicum", value: "Rs."+rate }
    	end
    	if names.text == "Carrot"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Carrot", value: "Rs."+rate }
    	end
    	if names.text == "Cauliflower"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Cauliflower", value: "Rs."+rate }
    	end
    	if names.text == "Chilly Capsicum"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Chilly Capsicum", value: "Rs."+rate }
    	end
    	if names.text == "Cluster Beans"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Cluster Beans", value: "Rs."+rate }
    	end
    	if names.text == "Coriander"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Coriander", value: "Rs."+rate }
    	end
    	if names.text == "Cowpea (Veg)"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Cowpea (Veg)", value: "Rs."+rate }
    	end
    	if names.text == "Cucumbar"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Cucumber", value: "Rs."+rate }
    	end
    	if names.text == "Drumstick"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Drumstick", value: "Rs."+rate }
    	end
        if names.text == "Field Pea"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            commodity[n+=1] = { label: "Field Pea", value: "Rs."+rate }
        end
    	if names.text == "Green Chilly"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Green Chilly", value: "Rs."+rate }
    	end
    	if names.text == "Green Ginger"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Green Ginger", value: "Rs."+rate }
    	end
        if names.text == "Leafy Vegetables"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "LeafyVeg", value: "Rs."+rate }
    	end
    	if names.text == "Mango - Raw-Ripe"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Green Mango", value: "Rs."+rate }
    	end
    	if names.text == "Knool Khol"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Knool Khol", value: "Rs."+rate }
    	end
    	if names.text == "Methi"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Methi", value: "Rs."+rate }
    	end
    	if (names.text == "Small")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Onion&var=Small&dt')]")).to_s
        	   rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	   commodity[n+=1] = { label: "Small Onion", value: "Rs."+rate }
            end
        end
        if (names.text == "Red")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Onion&var=Red&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Red Onion", value: "Rs."+rate }
            end
        end
        if (names.text == "Big")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Onion&var=Big&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Big Onion", value: "Rs."+rate }
            end
        end
        if (names.text == "Local")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Onion&var=Local&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Onion Local", value: "Rs."+rate }
            end
        end
        if (names.text == "Nasik")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Onion&var=Nasik&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Nasik Onion", value: "Rs."+rate }
            end
        end
    	if names.text == "Peas Wet"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Green Peas", value: "Rs."+rate }
    	end
    	if names.text == "Raddish"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Raddish", value: "Rs."+rate }
    	end
    	if names.text == "Ridgeguard(Tori)"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Ridgeguard(Tori)", value: "Rs."+rate }
    	end
    	if names.text == "Snakeguard"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Snakeguard", value: "Rs."+rate }
    	end
    	if names.text == "Sweet Pumpkin"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Sweet Pumpkin", value: "Rs."+rate }
    	end
    	if names.text == "Tapioca"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Tapioca", value: "Rs."+rate }
    	end
    	if names.text == "Amaranthus"
    		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	commodity[n+=1] = { label: "Amaranthus", value: "Rs."+rate }
    	end
        if names.text == "Gwar"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            commodity[n+=1] = { label: "Gwar", value: "Rs."+rate }
        end
        if names.text == "Sweet Potato"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            commodity[n+=1] = { label: "Sweet Potato", value: "Rs."+rate }
        end
        if (names.text == "(Red Nanital)")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Potato&var=(Red Nanital)&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "RedNanital", value: "Rs."+rate }
            end
        end
        if (names.text == "Big")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Potato&var=Big&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Potato:Big", value: "Rs."+rate }
            end
        end
        if (names.text == "F.A.Q.")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Potato&var=F.A.Q.&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Potato:F.A.Q", value: "Rs."+rate }
            end
        end
        if (names.text == "Jalander")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Potato&var=Jalander&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Potato:Jalander", value: "Rs."+rate }
            end
        end
        if (names.text == "Jyoti")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Potato&var=Jyoti&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Potato:Jyoti", value: "Rs."+rate }
            end
        end
        if (names.text == "Local")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Potato&var=Local&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Potato:Local", value: "Rs."+rate }
            end
        end
        if (names.text == "Red")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Potato&var=Red&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Potato:Red", value: "Rs."+rate }
            end
        end
        if (names.text == "Deshi")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Tomato&var=Deshi&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Tomato:Deshi", value: "Rs."+rate }
            end
        end
        if (names.text == "Hybrid")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Tomato&var=Hybrid&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Tomato:Hybrid", value: "Rs."+rate }
            end
        end
        if (names.text == "Local")
            if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Tomato&var=Local&dt')]")).to_s
               rate = names.parent.parent.next_sibling.next_sibling.text.strip
               commodity[n+=1] = { label: "Tomato:Local", value: "Rs."+rate }
            end
        end

	end
	
	if commodity.empty?
		puts "COMMODITY is empty"    
	else
        #puts "\n", commodity
        puts "COMMODITY not empty"
	end
	
  	#send_event('commodity', {items: [label:'Tomato', value:'1300']})
    send_event('commodity',{items: commodity})
    send_event('at', { text: datetime.to_s})
  end
 
rescue Exception => e
  	print e, "\n"
end

