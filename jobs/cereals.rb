require 'rubygems'
require 'nokogiri'
require 'open-uri'

URL = "http://agmarknet.nic.in/rep1newx1_today.asp"
cerealslist = []
fruits = []

begin
 page = Nokogiri::HTML(open(URL))

 #SCHEDULER.every '30m' do
 SCHEDULER.every '30m' do
 	m=0
 	n=0
	#puts "Title - " + page.css("title")[0].text.to_s
	names = page.css("td font font[color='#000080']")

	names.each do |names| 
		#puts names.text
    	
    	if names.text == "Bold"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Bajra(Pearl Millet)&amp;var=Hybrid&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Bajra:Bold", value: "Rs."+rate }
        	end
        end
        if names.text == "Deshi"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Bajra(Pearl Millet)&amp;var=Deshi&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Bajra:Deshi", value: "Rs."+rate }
        	end
        end
        if names.text == "Hybrid"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Bajra(Pearl Millet)&amp;var=Hybrid&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Bajra:Hybrid", value: "Rs."+rate }
        	end
        end
        if names.text == "Dara"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Barly (Jau)", value: "Rs."+rate }
        end
        if names.text == "Deshi"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Barley(Jau)&amp;var=Deshi&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Barley:Deshi", value: "Rs."+rate }
        	end
        end
        if names.text == "Jowar ( White)"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Jowar:White", value: "Rs."+rate }
        end
        if names.text == "Jowar (Yellow)"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Jowar:Yellow", value: "Rs."+rate }
        end
        if names.text == "White"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Jowar(Sorgham)&amp;var=White&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Jowar:White", value: "Rs."+rate }
        	end
        end
        if names.text == "Red"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Jowar(Sorgham)&amp;var=Red&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Jowar:Red", value: "Rs."+rate }
        	end
        end
        if names.text == "Hybrid/Local"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Maize", value: "Rs."+rate }
        end
        if names.text == "Sweet Corn (For Biscuits)"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Sweet Corn", value: "Rs."+rate }
        end
        if names.text == "Navane Hybrid"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Navane", value: "Rs."+rate }
        end
        if names.text == "A. Ponni"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Paddy-A.Ponni", value: "Rs."+rate }
        end
        if names.text == "5001"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Paddy 5001", value: "Rs."+rate }
        end
        if names.text == "Paddy Coarse"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Paddy Coarse", value: "Rs."+rate }
        end
        if names.text == "I.R. 36"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Paddy I.R. 36", value: "Rs."+rate }
        end
        if names.text == "Jaya"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Paddy Jaya", value: "Rs."+rate }
        end
        if names.text == "Sona Masuri (OLD)"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "SonaMasuri:OLD", value: "Rs."+rate }
        end
        if names.text == "Paddy"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Paddy", value: "Rs."+rate }
        end
        if names.text == "Fine"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Ragi", value: "Rs."+rate }
        end
        if names.text == "Basumathi"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Rice:Basumathi", value: "Rs."+rate }
        end
        if names.text == "Common"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Rice", value: "Rs."+rate }
        end
        if names.text == "IR-8"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "IR-8", value: "Rs."+rate }
        end
        if names.text == "Mataa Parboiled"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Mataa Parboiled", value: "Rs."+rate }
        end
        if names.text == "Ratnachudi (718 5-749)"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Ratnachudi", value: "Rs."+rate }
        end
        if names.text == "Rice Floor"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Rice Flour", value: "Rs."+rate }
        end
        if names.text == "1482"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Wheat:1482", value: "Rs."+rate }
        end
        if names.text == "Dara Mill Quality"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Wheat:DaraMill", value: "Rs."+rate }
        end
        if names.text == "Kalyan"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Wheat:Kalyan", value: "Rs."+rate }
        end
        if names.text == "Lokwan"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Wheat:Lokwan", value: "Rs."+rate }
        end
        if names.text == "Maharashtra 2189"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Wheat:2189", value: "Rs."+rate }
        end
        if names.text == "Rajasthan Tukdi"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Wheat:Tukdi", value: "Rs."+rate }
        end
        if names.text == "Red"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Ragi&amp;var=Red&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Ragi:Red", value: "Rs."+rate }
        	end
        end
        if names.text == "Local"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Ragi&amp;var=Local&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Ragi:Local", value: "Rs."+rate }
        	end
        end
        if names.text == "Dara"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Wheat&amp;var=Dara&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Wheat:Dara", value: "Rs."+rate }
        	end
        end
        if names.text == "Deshi"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Wheat&amp;var=Deshi&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Wheat:Deshi", value: "Rs."+rate }
        	end
        end
        if names.text == "Farmi"
        	if (names.parent.parent.previous_sibling).to_s == (page.xpath("//a[contains(@href, 'comm=Wheat&amp;var=Farmi&dt=')]")).to_s
        		rate = names.parent.parent.next_sibling.next_sibling.text.strip
        		cerealslist[n+=1] = { label: "Wheat:Farmi", value: "Rs."+rate }
        	end
        end
        if names.text == "Soji"
        	rate = names.parent.parent.next_sibling.next_sibling.text.strip
        	cerealslist[n+=1] = { label: "Soji", value: "Rs."+rate }
        end
    end
    names.each do |names| 
        #puts names.text

        if names.text == "American"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "American Apple", value: "Rs."+rate }
        end
        if names.text == "Apple"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Apple", value: "Rs."+rate }
        end
        if names.text == "Kasmir/Shimla - II"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Kasmir", value: "Rs."+rate }
        end
        if names.text == "Simla"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Shimla", value: "Rs."+rate }
        end
        if names.text == "Banana - Ripe"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Bana - Ripe", value: "Rs."+rate }
        end
        if names.text == "Elakki Bale"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Elakki Bale", value: "Rs."+rate }
        end
        if names.text == "Bhushavali(Pacha)"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Bhushavali(Pacha)", value: "Rs."+rate }
        end
        if names.text == "Karpura"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Karpura", value: "Rs."+rate }
        end
        if names.text == "Nendra Bale"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Nendra Bale", value: "Rs."+rate }
        end
        if names.text == "Poovan"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Poovan", value: "Rs."+rate }
        end
        if names.text == "Sapota"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Sapota", value: "Rs."+rate }
        end
        if names.text == "Green"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Grapes", value: "Rs."+rate }
        end
        if names.text == "Guava"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Guava", value: "Rs."+rate }
        end
        if names.text == "Jack Fruit"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Jack Fruit", value: "Rs."+rate }
        end
        if names.text == "Karbhuja"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Karbuja", value: "Rs."+rate }
        end
        if names.text == "Neelam"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Mango", value: "Rs."+rate }
        end
        if names.text == "Mousambi"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Mousambi", value: "Rs."+rate }
        end
        if names.text == "Orange"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Orange", value: "Rs."+rate }
        end
        if names.text == "Papaya"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Papaya", value: "Rs."+rate }
        end
        if names.text == "Pine Apple"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Pine Apple", value: "Rs."+rate }
        end
        if names.text == "Pomogranate"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Pomegranate", value: "Rs."+rate }
        end
        if names.text == "Tender Coconut"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Tender Coconut", value: "Rs."+rate }
        end
        if names.text == "Water Melon"
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fruits[m+=1] = { label: "Water Melon", value: "Rs."+rate }
        end
    end
	
	if cerealslist.empty? || fruits.empty?
		puts " cereals/fruits is empty"
	else
		puts "cereals/fruits not empty"
		#puts cereals
		#puts "\n", cerealslist
	end

  
  	#send_event('cereals',{items: commodity})
  	send_event('cereals', {items: cerealslist})
  	send_event('fruits', {items: fruits})
  end
 
rescue Exception => e
  	print e, "\n"
end

