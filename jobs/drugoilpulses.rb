require 'rubygems'
require 'nokogiri'
require 'open-uri'

URL1 = "http://agmarknet.nic.in/rep1newx1_today.asp"
druglist = []
pulses = []
oilseeds = []

begin
 page = Nokogiri::HTML(open(URL1))

 #SCHEDULER.every '30m' do
 SCHEDULER.every '30s' do

m=0
n=0
p=0

#puts "Title - " + page.css("title")[0].text.to_s
names = page.css("td font font[color='#000080']")

names.each do |names| 
    #puts names.text
    
    if names.text == "Bette"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut/Supari", value: "Rs."+rate }
    end
    if names.text == "Factory"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut:Factory", value: "Rs."+rate }
    end
    if names.text == "Bilegotu"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut:Bilegotu", value: "Rs."+rate }
    end
    if names.text == "Chippu"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut:Chippu", value: "Rs."+rate }
    end
    if names.text == "Cqca"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut:Cqca", value: "Rs."+rate }
    end
    if names.text == "Gorabalu"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut:Gorabalu", value: "Rs."+rate }
    end
    if names.text == "Kempugotu"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut:Kempugotu", value: "Rs."+rate }
    end
    if names.text == "Kole"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut:Kole", value: "Rs."+rate }
    end
    if names.text == "New Variety"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut:New Variety", value: "Rs."+rate }
    end
    if names.text == "Rashi"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Betelnut:Rashi", value: "Rs."+rate }
    end
    if names.text == "Ripe"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Arecanut(Betelnut/Supari)&var=Ripe&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            druglist[n+=1] = { label: "Betelnut:Ripe", value: "Rs."+rate }
        end
    end
    if names.text == "Saraku"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Saraku", value: "Rs."+rate }
    end
    if names.text == "Local"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Betal Leaves&var=Local')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            druglist[n+=1] = { label: "Betel Leaves", value: "Rs."+rate }
        end
    end
    if names.text == "Raw"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Arecanut(Betelnut/Supari)&var=Raw&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            druglist[n+=1] = { label: "Betelnut:Raw", value: "Rs."+rate }
        end
    end
    if names.text == "Supari"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Arecanut(Betelnut/Supari)&var=Supari&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            druglist[n+=1] = { label: "Supari", value: "Rs."+rate }
        end
    end
    if names.text == "Isabgul (Psyllium)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        druglist[n+=1] = { label: "Isabgul (Psyllium)", value: "Rs."+rate }
    end
    
end
names.each do |names| 
    #puts names.text
    
    if names.text == "Alasande Grem"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Alasande", value: "Rs."+rate }
    end
    if names.text == "Arhar (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "ArharWhole", value: "Rs."+rate }
    end
    if names.text == "Arhar Dal(Tur)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "ArharDalTur", value: "Rs."+rate }
    end
    if names.text == "Avare (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "AvareDal", value: "Rs."+rate }
    end
    if names.text == "Medium"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Arhar (Tur)&var=Medium&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "ArharMedium", value: "Rs."+rate }
        end
    end
    if names.text == "Beans (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Beans", value: "Rs."+rate }
    end
    if names.text == "Average (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "BengalGramAvg", value: "Rs."+rate }
    end
    if names.text == "Bengal Gram Dal"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "BengalGramDal", value: "Rs."+rate }
    end
    if names.text == "Black Gram (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "BlackGramWhole", value: "Rs."+rate }
    end
    if names.text == "Bengal Gram (Split)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "BengalGramSplit", value: "Rs."+rate }
    end
    if names.text == "Black Gram Dal"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "BlackGramDal", value: "Rs."+rate }
    end
    if names.text == "Desi"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Black Grams (Urd Beans)&var=Desi&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "BlackGramDesi", value: "Rs."+rate }
        end
    end
    if names.text == "Hybrid"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Black Grams (Urd Beans)&var=Hybrid&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "BlackGramHybrid", value: "Rs."+rate }
        end
    end
    if names.text == "Local"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Black Grams (Urd Beans)&var=Local&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "BlackGramLocal", value: "Rs."+rate }
        end
    end
    if names.text == "Bold"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Bengal Grams(Gram)&var=Bold&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "BengalGramBold", value: "Rs."+rate }
        end
    end
    
    if names.text == "Desi (Whole)"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Bengal Grams(Gram)&var=Desi (Whole)&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "BengalGramDesi", value: "Rs."+rate }
        end
    end
    if names.text == "Gulabi"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "BengalGramGulabi", value: "Rs."+rate }
    end
    if names.text == "Jawari/Local"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Jawari/Local", value: "Rs."+rate }
    end
    if names.text == "Chennangi Dal"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Chennangi Dal", value: "Rs."+rate }
    end
    if names.text == "Cowpea (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Cowpea (Whole)", value: "Rs."+rate }
    end
    if names.text == "Cowpea (W-S)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Cowpea (W-S)", value: "Rs."+rate }
    end
    if names.text == "Bold"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Green Grams (Moong)&var=Bold&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "GreenGramBold", value: "Rs."+rate }
        end
    end
    if names.text == "Green Gram Dhall-I"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Green Gram Dal", value: "Rs."+rate }
    end
    if names.text == "Green (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Green Whole", value: "Rs."+rate }
    end
    if names.text == "Hybrid"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Green Grams (Moong)&var=Hybrid&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "GreenHybrid", value: "Rs."+rate }
        end
    end
    if names.text == "Local"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Green Grams (Moong)&var=Local&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "GreenLocal", value: "Rs."+rate }
        end
    end
    if names.text == "Local (Whole)"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Green Grams (Moong)&var=Local (Whole)&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "GreenLocalWhole", value: "Rs."+rate }
        end
    end
    if names.text == "Medium"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Green Grams (Moong)&var=Medium&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "GreenMedium", value: "Rs."+rate }
        end
    end
    if names.text == "Green Peas"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Green Peas", value: "Rs."+rate }
    end
    if names.text == "White Fozi"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "GreenPeasWhite", value: "Rs."+rate }
    end
    if names.text == "Horse gram (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Horse Gram", value: "Rs."+rate }
    end
    if names.text == "Lak (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Lak (Whole)", value: "Rs."+rate }
    end
    if names.text == "Masur Dal"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Masur Dal", value: "Rs."+rate }
    end
    if names.text == "Masoor Gola"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "Masoor Gola", value: "Rs."+rate }
    end
    if names.text == "(Whole)"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Red Grams&var=(Whole)&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "RedGramWhole", value: "Rs."+rate }
        end
    end
    if names.text == "Desi(Whole)"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Red Grams&var=Desi(Whole)&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "RedGramDesi", value: "Rs."+rate }
        end
    end
    if names.text == "F.A.Q. (Whole)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        pulses[m+=1] = { label: "RedGramFAQ", value: "Rs."+rate }
    end
    if names.text == "Local"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Red Grams&var=Local&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            pulses[m+=1] = { label: "RedGramLocal", value: "Rs."+rate }
        end
    end
end
names.each do |names| 
    #puts names.text
    
    if names.text == "Caster"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Castor", value: "Rs."+rate }
    end
    if names.text == "Caster seed"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Castor Seed", value: "Rs."+rate }
    end
    if names.text == "Copra Oil"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Copra Oil", value: "Rs."+rate }
    end
    if names.text == "Copra"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Copra", value: "Rs."+rate }
    end
    if names.text == "Medium"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Copra&var=Medium&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Copra:Medium", value: "Rs."+rate }
        end
    end
    if names.text == "Black"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Gingelly (Sesamum, Sesame, Til) &var=Black&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Sesame:Black", value: "Rs."+rate }
        end
    end
    if names.text == "Red"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Gingelly (Sesamum, Sesame, Til) &var=Red&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Sesame:Red", value: "Rs."+rate }
        end
    end
    if names.text == "White"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Gingelly (Sesamum, Sesame, Til) &var=White&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Sesame:White", value: "Rs."+rate }
        end
    end
    if names.text == "Black"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Sesamum(Sesame,Gingelly,Til)&var=Black&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Sesame:Black", value: "Rs."+rate }
        end
    end
    if names.text == "Red"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Sesamum(Sesame,Gingelly,Til)&var=Red&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Sesame:Red", value: "Rs."+rate }
        end
    end
    if names.text == "Sesame"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Sesame", value: "Rs."+rate }
    end
    if names.text == "White"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Sesamum(Sesame,Gingelly,Til)&var=White&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Sesame:White", value: "Rs."+rate }
        end
    end
    if names.text == "Ground Nut Oil"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "GroundnutOil", value: "Rs."+rate }
    end
    if names.text == "Ground Nut Seed"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "GroundnutSeed", value: "Rs."+rate }
    end
    if names.text == "Big (With Shell)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "GroundnutBig", value: "Rs."+rate }
    end
    if names.text == "Bold"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Groundnut&var=Bold&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "GroundnutBold", value: "Rs."+rate }
        end
    end
    if names.text == "Bold Kernel"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Groundnut&var=Bold Kernel&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Bold Kernel", value: "Rs."+rate }
        end
    end
    if names.text == "DMV-7"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "DMV-7", value: "Rs."+rate }
    end
    if names.text == "G20"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "G20", value: "Rs."+rate }
    end
    if names.text == "Groundnut(Split)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Groundnut(Split)", value: "Rs."+rate }
    end
    if names.text == "Groundnut seed"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Groundnut seed", value: "Rs."+rate }
    end
    if names.text == "Gungri(With Shell)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Gungri(With Shell)", value: "Rs."+rate }
    end
    if names.text == "Local"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Groundnut&var=Local&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Local", value: "Rs."+rate }
        end
    end
    if names.text == "TMV-2"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "TMV-2", value: "Rs."+rate }
    end
    if names.text == "Linseed"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Linseed", value: "Rs."+rate }
    end
    if names.text == "Mustard"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Mustard", value: "Rs."+rate }
    end
    if names.text == "Laha(Sarsib)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Laha(Sarsib)", value: "Rs."+rate }
    end
    if names.text == "Lohi Black"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Lohi Black", value: "Rs."+rate }
    end
    if names.text == "Sarson(Black)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Sarson(Black)", value: "Rs."+rate }
    end
    if names.text == "Yellow (Black)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Yellow(Black)", value: "Rs."+rate }
    end
    if names.text == "Neem Seed"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Neam Seed", value: "Rs."+rate }
    end
    if names.text == "Safflower"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Safflower", value: "Rs."+rate }
    end
    if names.text == "Soyabeen"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Soyabean", value: "Rs."+rate }
    end
    if names.text == "Yellow"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Soyabean&var=Yellow&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Soyabean:Yellow", value: "Rs."+rate }
        end
    end
    if names.text == "Sunflower"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Sunflower", value: "Rs."+rate }
    end
    if names.text == "Hybrid"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Sunflower&var=Hybrid&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Sunflower:Hybrid", value: "Rs."+rate }
        end
    end
    if names.text == "Local"
        if (names.parent.parent.previous_sibling).to_s ==  (page.xpath("//a[contains(@href, 'comm=Sunflower&var=Local&dt')]")).to_s
            rate = names.parent.parent.next_sibling.next_sibling.text.strip
            oilseeds[p+=1] = { label: "Sunflower:Local", value: "Rs."+rate }
        end
    end
    if names.text == "Sunflower Seed"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Sunflower Seed", value: "Rs."+rate }
    end
    if names.text == "Suva (Dill Seed)"
        rate = names.parent.parent.next_sibling.next_sibling.text.strip
        oilseeds[p+=1] = { label: "Suva(Dill Seed)", value: "Rs."+rate }
    end
end

if druglist.empty? || pulses.empty? || oilseeds.empty?
    puts "hash druglist/pulses/oilseeds is empty"
    else
    puts "hash druglist/pulses/oilseeds not empty"
    #puts "\n", druglist
end

send_event('drugs', {items: druglist})
send_event('pulses', {items: pulses})
send_event('oilseeds', {items: oilseeds})

puts "\n", druglist
puts "\n", pulses
puts "\n", oilseeds

  	
  end
 
rescue Exception => e
  	print e, "\n"
end

