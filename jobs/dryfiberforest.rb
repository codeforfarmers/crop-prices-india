require 'rubygems'
require 'nokogiri'
require 'open-uri'

URL2 = "http://agmarknet.nic.in/rep1newx1_today.asp"


begin
 page = Nokogiri::HTML(open(URL2))

 #SCHEDULER.every '30m' do
 SCHEDULER.every '30s' do

    l=0
    m=0
    n=0
    p=0
    q=0
    r=0

    dry = []
    fiber = []
    forest = []
    livestock = []
    spices = []
    other = []

    #puts "Title - " + page.css("title")[0].text.to_s
    names = page.css("td font font[color='#000080']")

    names.each do |names| 
    #puts names.text
    #dryfruits and beverages
    if names.text == "All Dust"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Tea&var=All Dust&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            dry[l+=1] = { label: "Tea:AllDust", value: "Rs."+rate }
            puts "\n Tea:"+rate
            puts "\n", dry
        end
    end
    if names.text == "Kernel"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        dry[l+=1] = { label: "Cashewnuts", value: "Rs."+rate }
    end
    if names.text == "Local(Raw)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        dry[l+=0] = { label: "Cashewnuts:Raw", value: "Rs."+rate }
    end
    if names.text == "Dry Grapes"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        dry[l+=0] = { label: "Dry Grapes", value: "Rs."+rate }
    end
    if names.text == "Tea"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        dry[l+=1] = { label: "Tea", value: "Rs."+rate }
    end
    if names.text == "Coffee"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        dry[l+=1] = { label: "Coffee", value: "Rs."+rate }
    end
    if names.text == "Cocoa"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        dry[l+=1] = { label: "Cocoa", value: "Rs."+rate }
    end
end
names.each do |names| 
    if names.text == "Cotton (Ginned)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        fiber[m+=1] = { label: "Cotton:Ginned", value: "Rs."+rate }
    end
    if names.text == "Cotton (Unginned)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        fiber[m+=1] = { label: "Cotton:Unginned", value: "Rs."+rate }
    end
    if names.text == "Desi"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Cotton&var=Desi&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fiber[m+=1] = { label: "Cotton:Desi", value: "Rs."+rate }
        end
    end
    if names.text == "DCH-32(Unginned)"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Cotton&var=DCH-32(Unginned)&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fiber[m+=1] = { label: "DCH32(Ungin)", value: "Rs."+rate }
        end
    end
    if names.text == "H.B (Unginned)"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Cotton&var=H.B (Unginned)&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fiber[m+=1] = { label: "HB(Unginned)", value: "Rs."+rate }
        end
    end
    if names.text == "H4"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Cotton&var=H4&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fiber[m+=1] = { label: "Cotton:H4", value: "Rs."+rate }
        end
    end
    if names.text == "LRA"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Cotton&var=LRA&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fiber[m+=1] = { label: "Cotton:LRA", value: "Rs."+rate }
        end
    end
    if names.text == "MCU"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Cotton&var=MCU&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fiber[m+=1] = { label: "Cotton:MCU", value: "Rs."+rate }
        end
    end
    if names.text == "MCU 5"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Cotton&var=MCU 5&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            fiber[m+=1] = { label: "Cotton:MCU 5", value: "Rs."+rate }
        end
    end
    if names.text == "Mungari (Ginned)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        fiber[m+=1] = { label: "Mungari", value: "Rs."+rate }
    end
    if names.text == "N-44"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        fiber[m+=1] = { label: "Cotton:N-44", value: "Rs."+rate }
    end
    if names.text == "Shanker 6 (B) 30mm FIne"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        fiber[m+=1] = { label: "Shanker6(B)30mmFine", value: "Rs."+rate }
    end
    if names.text == "Jute"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        fiber[m+=1] = { label: "Jute", value: "Rs."+rate }
    end
    if names.text == "TD-5"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        fiber[m+=1] = { label: "Jute:TD-5", value: "Rs."+rate }
    end
    if names.text == "Lint"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        fiber[m+=1] = { label: "Lint", value: "Rs."+rate }
    end
end
names.each do |names|
    if names.text == "Chapathi"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "TamarindFruitChapathi", value: "Rs."+rate }
    end  
    if names.text == "Tamarind Fruit"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "Tamarind Fruit", value: "Rs."+rate }
    end
    if names.text == "Flower A/c"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "TamarindFlower A/c", value: "Rs."+rate }
    end
    if names.text == "Non A/c Flower"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "TamarindNonFlower A/c", value: "Rs."+rate }
    end
    if names.text == "Tamarind Seed"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "Tamarind Seed", value: "Rs."+rate }
    end
    if names.text == "Subabul"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "Wood:Subabul", value: "Rs."+rate }
    end
    if names.text == "Eucalyptus"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "Eucalyptus", value: "Rs."+rate }
    end  
    if names.text == "Bay leaf(Tejpatta)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "Bay Leaf", value: "Rs."+rate }
    end  
    if names.text == "Broomstick"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "Broomstick", value: "Rs."+rate }
    end
    if names.text == "Wood"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        forest[n+=1] = { label: "Wood", value: "Rs."+rate }
    end
end
names.each do |names|  
    if names.text == "Cow"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Cow", value: "Rs."+rate }
    end
    if names.text == "He Baffelo"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "He Buffalo", value: "Rs."+rate }
    end
    if names.text == "She Baffelo"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "She Buffalo", value: "Rs."+rate }
    end
    if names.text == "Ox"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Ox", value: "Rs."+rate }
    end 
    if names.text == "Sheep Medium"   
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Sheep Medium", value: "Rs."+rate }
    end 
    if names.text == "Goat"   
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Goat", value: "Rs."+rate }
    end 
    if names.text == "Bull"   
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Bull", value: "Rs."+rate }
    end 
    if names.text == "Egg"   
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Egg", value: "Rs."+rate }
    end
    if names.text == "Calf"   
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Calf", value: "Rs."+rate }
    end
    if names.text == "Fish"   
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Fish", value: "Rs."+rate }
    end
    if names.text == "Pigs"   
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Pigs", value: "Rs."+rate }
    end
    if names.text == "Hen"   
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Hen", value: "Rs."+rate }
    end
    if names.text == "Cock"   
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        livestock[p+=1] = { label: "Cock", value: "Rs."+rate }
    end
end
names.each do |names|  
    if names.text == "Malabar"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "MalabarPepper", value: "Rs."+rate }
    end
    if names.text == "Cloves"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Cloves", value: "Rs."+rate }
    end
    if names.text == "Soanf"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Soanf", value: "Rs."+rate }
    end
    if names.text == "Cardamoms"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Cardamoms", value: "Rs."+rate }
    end
    if names.text == "Nutmeg"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Nutmeg", value: "Rs."+rate }
    end
    if names.text == "1st Sort"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "ChilliRed", value: "Rs."+rate }
    end
    if names.text == "Coconut"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Coconut", value: "Rs."+rate }
    end
    if names.text == "Coriander Seed"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "CorianderSeed", value: "Rs."+rate }
    end 
    if names.text == "Cummin Seed(Jeera)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "JeeraSeed", value: "Rs."+rate }
    end  
    if names.text == "Guntur"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "GunturChilli", value: "Rs."+rate }
    end 
    #Drychillies -Red,Red New, Red Top,Talu,White
    if names.text == "Garlic"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Garlic", value: "Rs."+rate }
    end
    if names.text == "Vegitable-free"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Ginger", value: "Rs."+rate }
    end
    if names.text == "Fresh (Assam)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Ginger", value: "Rs."+rate }
    end
    if names.text == "Methiseeds"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Methiseeds", value: "Rs."+rate }
    end
    if names.text == "Turmeric"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Turmeric", value: "Rs."+rate }
    end
    if names.text == "Turmeric Powder"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "TurmericPowder", value: "Rs."+rate }
    end
    if names.text == "Rajapuri"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Turmeric:Rajapuri", value: "Rs."+rate }
    end
    if names.text == "Bulb"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Turmeric:Bulb", value: "Rs."+rate }
    end
    if names.text == "Finger"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Turmeric:Finger", value: "Rs."+rate }
    end
    #if names.text == "Dry"
        # both turmeric, ginger
        #if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Gur(Jaggery)&var=Red&dt')]")).to_s
         #   rate = names.parent.parent.next_sibling.next_sibling.text.strip
          #  other[r+=1] = { label: "Turmeric:Dry", value: "Rs."+rate }
        #end
    #end
    if names.text == "Grade-I"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Coconut:I", value: "Rs."+rate }
    end
    if names.text == "Grade-II"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Coconut:II", value: "Rs."+rate }
    end
    if names.text == "Grade-III"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Coconut:III", value: "Rs."+rate }
    end
    if names.text == "Mace"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "Mace", value: "Rs."+rate }
    end
    if names.text == "Garbled"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "PepperGarbled", value: "Rs."+rate }
    end
    if names.text == "Ungrabled"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        spices[q+=1] = { label: "PepperUngarbled", value: "Rs."+rate }
    end
    
end
names.each do |names|  
    if names.text == "Broken Rice"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Broken Rice", value: "Rs."+rate }
    end
    if names.text == "Bunch Beans"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Bunch Beans", value: "Rs."+rate }
    end
    if names.text == "Dalda"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Dalda", value: "Rs."+rate }
    end
    if names.text == "Achhu"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Gur(Jaggery)", value: "Rs."+rate }
    end
    if names.text == "Disara"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Disara", value: "Rs."+rate }
    end
    if names.text == "NO 3"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Jaggery:NO3", value: "Rs."+rate }
    end
    if names.text == "Disara"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Disara", value: "Rs."+rate }
    end
    if names.text == "Pathari"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Pathari", value: "Rs."+rate }
    end
    if names.text == "Red"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Gur(Jaggery)&var=Red&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            other[r+=1] = { label: "Gur:Red", value: "Rs."+rate }
        end
    end
    if names.text == "Yellow"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Gur(Jaggery)&var=Yellow&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            other[r+=1] = { label: "Gur:Yellow", value: "Rs."+rate }
        end
    end
    if names.text == "Nizamabad"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Nizamabad", value: "Rs."+rate }
    end
    if names.text == "Unde"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Unde", value: "Rs."+rate }
    end
    if names.text == "Maida Atta"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Maida Atta", value: "Rs."+rate }
    end
    if names.text == "Chini"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Chini", value: "Rs."+rate }
    end
    if names.text == "Wheat Atta"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Wheat Atta", value: "Rs."+rate }
    end
    if names.text == "Yam"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Yam", value: "Rs."+rate }
    end 
    if names.text == "Rubber"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Rubber", value: "Rs."+rate }
    end  
    if names.text == "RSS-4"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Rubber:RSS4", value: "Rs."+rate }
    end 
    if names.text == "Jau"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Jau", value: "Rs."+rate }
    end
    if names.text == "Sugar"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Sugar", value: "Rs."+rate }
    end
    if names.text == "Fine"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Sugar&var=Fine&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            other[r+=1] = { label: "Sugar:Fine", value: "Rs."+rate }
        end
    end
    if names.text == "Shakkar"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Shakkar", value: "Rs."+rate }
    end
    if names.text == "Taramira"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Dalda", value: "Rs."+rate }
    end
    if names.text == "Ghee"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Ghee", value: "Rs."+rate }
    end
    if names.text == "Rajgir"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        other[r+=1] = { label: "Rajgir", value: "Rs."+rate }
    end
end

if dry.empty? || fiber.empty? || forest.empty? || livestock.empty? || spices.empty? || other.empty? 
    puts "list dry/fiber/forest/livestock/spices/other is empty"
    else
    puts "list dry/fiber/forest/livestock/spices/other not empty"
end

send_event('dryfruits', {items: dry})
send_event('fibercrops', {items: fiber})
send_event('forest', {items: forest})
send_event('livestock', {items: livestock})
send_event('spices', {items: spices})
send_event('other', {items: other})

  	
  end
 
rescue Exception => e
  	print e, "\n"
end
