Config = {}
Translation = {}
Config.Debug = true

-- Blip Stuff --
Config.Blipname = "LKW Fahrer!"
Config.Blipcoord = vector3(1233.8623, -3235.2698, 5.5287)
Config.BlipID = 477
Config.BlipColorID = 1
Config.Truckmenu = vector3(1233.8623, -3235.2698, 5.5287)

-- Notify Stuff
Config.SNZNotify = true -- wenn beide false dann wird esx.shownotification benutzt.
Config.CustomNotify = false
function notify(header, txt)
    ESX.ShowNotification(txt) 
    -- if u have a custom notify like okokNotify just input it here, and do txt as your text and header as the headline ;)
end

Config.Currency = "€"

 -- PLEASE CHANGE THIS, I DIDNT DO ANYTHING BECAUSE ITS BALANCING (JUST PUT HOW MUCH EXP THE PERSON GETS IF THEY FINISH AN EASY NORMAL OR HARD JOB)
Config.Easyreward = 100
Config.Normalreward = 200
Config.Hardreward = 300



Config.MYSQL = 'mysql-async'    --Either mysql-async or oxmysql
-- PLEASE EDIT R i didnt do it because of balancing
Config.Jobs = {
    -- J = Jobname (Name of the Mission) -- D = "easy" "normal" "hard" (difficulty) EXP = Required eXP S = starting coordinates (Truck) SH = Heading (Truck)  F = Finishing Coordinates V = Vehicle T= Trailer TT= Trailer Spawn, TH = Trailer Heading, R = Reward ($)-- 
    {J = "Bringe Holz vom Hafen zum Sägewerk", D = "hard", EXP = 200, S = vector3(1243.8436, -3298.6514, 5.6375), SH = 278.9662, F = vector3(420, 420, 420), V = "hauler", T = "TR2", TT = vector3(1288.6229, -3312.3245, 5.9719), TH = 87.5498, R = 1},
}

--Config.Easy.reward =
--Config.Normal.reward =
--Config.Hard.reward =


Config.Locale = "de"

Translation = {
    ['de'] = {
        ['MainMenuname'] = 'Trucker-Imperium',
        ['MainMenuDesc'] = 'Starten sie ihr Trucker Imperium Hier!',
        ['JobsItemName'] = 'Sieh deine Jobs an',
        ['JobsItemDesc'] = 'Hier bekommst du diene Jobs',
        ['JobsMenuName'] = 'Deine Verfügbaren jobs:',
        ['JobsMenuDesc'] = nil,
        ['notify'] = 'Drücke ~INPUT_CONTEXT~ um dein Trucker-Imperium zu öffnen',
        ['truckername'] = 'Trucker-Imperium',
        ['not_allowed'] = 'Auf diesen Beruf hast du keinen Zugriff!',
        ['spawned'] = 'Der Truck wurde gespawnt! <3!',
        ['finished'] = 'Dein Trucker-Job ist erledigt und dein Geld wurde dir auf dein Bankkonto überwiesen! <3',
        ['checkpoint'] = 'Dein Trucker-Job ist erledigt Nimm den rest der ladung mit und komm heim und bring den Truck Sicher zurück!',
        ['trailer_deleted'] = 'Dein Anhänger wurde gelöscht un´d du hast die Mission fehlgeschlagen, dein Truck wird in 10 Sekunden gelöscht',
        ['truck_deleted'] = 'Dein Truck wurde gelöscht, mehr erfolg beim nächsten mal!',
        ['NoTrailerAttached'] = "Kein Anhänger erkannt, bitte Anhängen!",
        ['reward'] = "Du hast dein Gehalt Erhalten:",
    },
    ['en'] = {
        ['MainMenuname'] = 'Trucker-Imperium',
        ['MainMenuDesc'] = 'Starten sie ihr Trucker Imperium Hier!',
        ['JobsItemName'] = 'Sieh deine Jobs an',
        ['JobsItemDesc'] = 'Hier bekommst du deine Jobs',
        ['JobsMenuName'] = 'Deine Verfügbaren jobs:',
        ['JobsMenuDesc'] = nil,
        ['notify'] = 'Drücke ~INPUT_CONTEXT~ um dein Trucker-Imperium zu öffnen',
        ['truckername'] = 'Trucker-Imperium',
        ['not_allowed'] = 'Auf diesen Beruf hast du keinen Zugriff!',
        ['spawned'] = 'Der Truck wurde gespawnt! <3!',
        ['finished'] = 'Dein Trucker-Job ist erledigt und dein Geld wurde dir auf dein Bankkonto überwiesen! <3',
        ['checkpoint'] = 'Dein Trucker-Job ist erledigt und dein Geld wurde dir auf dein Bankkonto überwiesen! <3',
        ['trailer_deleted'] = 'Dein Anhänger wurde gelöscht un´d du hast die Mission fehlgeschlagen, dein Truck wird in 10 Sekunden gelöscht',
        ['truck_deleted'] = 'Dein Truck wurde gelöscht, mehr erfolg beim nächsten mal',
        ['NoTrailerAttached'] = "No Trailer Attached please Attach it to your Vehicle!!!",
        ['reward'] = "You got your loan for the job:",
    }
}