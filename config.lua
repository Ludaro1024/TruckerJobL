Config = {}
Translation = {}
Config.Debug = true
Config.Spam = false

-- Blip Stuff --
Config.Blipname = "LKW Fahrer!"
Config.Blipcoord = vector3(1233.8623, -3235.2698, 5.5287)
Config.BlipID = 477
Config.BlipColorID = 1
Config.Truckmenu = vector3(1233.8623, -3235.2698, 5.5287)

-- Notify Stuff
Config.SNZNotify = false -- wenn beide false dann wird esx.shownotification benutzt.
Config.CustomNotify = false
function notify(header, txt)
ESX.ShowNotification(txt) 
    -- if u have a custom notify like okokNotify just input it here, and do txt as your text and header as the headline ;)
end

Config.Currency = "€"
Config.Buyabletrucks = true
Config.Lease = true
Config.LeasePrice = 100

Config.Trucks = {
 {spawnname = "hauker", label = "Hauler",price = "100"},

}

 -- PLEASE CHANGE THIS, I DIDNT DO ANYTHING BECAUSE ITS BALANCING (JUST PUT HOW MUCH EXP THE PERSON GETS IF THEY FINISH AN EASY NORMAL OR HARD JOB)
Config.Easyreward = 100
Config.Normalreward = 200
Config.Hardreward = 300


Config.UseOldESX = true        --Enable this if you use Any Esx Version between 1.2 and V1 Final, This Script will not work with Esx 1.1
Config.ESXEvent = 'esx:getSharedObject'     --Leave this alone if you don't know what you are doing ^^ only relevant if the above setting is true
Config.MYSQL = 'mysql-async'    --Either mysql-async or oxmysql
-- PLEASE EDIT R i didnt do it because of balancing
Config.Jobs = {
    -- J = Jobname (Name of the Mission) -- D = "easy" "normal" "hard" (difficulty) EXP = Required eXP S = starting coordinates (Truck) SH = Heading (Truck)  F = Finishing Coordinates V = Vehicle T= Trailer TT= Trailer Spawn, TH = Trailer Heading, R = Reward ($)-- 
    -- if NOTHING HAPPENS WHEN SELECTING THE JOB, BE SURE U INPUT RIGHT SPAWNNAME
    {J = "Bringe Holz vom Hafen zum Sägewerk", D = "hard", EXP = 0, S = vector3(1248.1285, -3298.5332, 5.8972), SH = 204.0312, F = vector3(-556.9644, 5379.0376, 70.0815), V = "hauler", T = "TrailerLogs", TT = vector3(1284.8077, -3317.3938, 5.9031), TH = 79.9587, R = 1},
    {J = "Bringe Weizen vom Hafen zur Farm", D = "normal", EXP = 0, S = vector3(1248.1285, -3298.5332, 5.8972), SH = 263.26065, F = vector3(1525.6123, 1719.6370, 109.9840), V = "hauler", T = "tr4", TT = vector3(1284.8077, -3317.3938, 5.9031), TH = 79.9587, R = 1},
    {J = "Bringe Autos zum Autohaus", D = "easy", EXP = 0, S = vector3(1248.1285, -3298.5332, 5.8972), SH = 263.26065, F = vector3(420, 420, 420), V = "hauler", T = "TR4", TT = vector3(1284.8077, -3317.3938, 5.9031), TH = 79.9587, R = 1},

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
        ['TruckItemName'] = 'Kauf dir einen Truck',
        ['TruckItemDesc'] = 'Hier kannst du dir Trucks Kaufen anstatt welche auszuleihen',
        ['price'] = 'Preis dieses Trucks:',
        ['JobsMenuName'] = 'Deine Verfügbaren jobs:',
        ['JobsMenuDesc'] = nil,
        ['notify'] = 'Drücke ~INPUT_CONTEXT~ um dein Trucker-Imperium zu öffnen',
        ['truckername'] = 'Trucker-Imperium',
        ['not_allowed_in_job'] = 'Mach erstmal deinen jetzigen beruf fertig! <3',
        ['spawned'] = 'Der Truck wurde gespawnt! <3!',
        ['finished'] = 'Dein Trucker-Job ist erledigt und dein Geld wurde dir auf dein Bankkonto überwiesen! <3',
        ['checkpoint'] = 'Dein Trucker-Job ist erledigt Nimm den rest der ladung mit und komm heim und bring den Truck Sicher zurück!',
        ['trailer_deleted'] = 'Dein Anhänger wurde gelöscht un´d du hast die Mission fehlgeschlagen, dein Truck wird in 10 Sekunden gelöscht',
        ['truck_deleted'] = 'Dein Truck wurde gelöscht, mehr erfolg beim nächsten mal!',
        ['NoTrailerAttached'] = 'Kein Anhänger erkannt, bitte Anhängen!',
        ['yourxp'] = 'Deine EXP:',
        ['reward'] = 'Du hast dein Gehalt Erhalten:',
        ['Lease'] = "Dir wurde für den Truck der dir geliehen wurde soviel abgezogen:",
        ['Sold'] = "Dein Truck wurde Der firma wieder gutgeschrieben",
    },
    ['en'] = {
        ['MainMenuname'] = 'Trucker-Job',
        ['MainMenuDesc'] = 'Start ur Trucker-Job Here!!',
        ['JobsItemName'] = 'Look at your Jobs',
        ['JobsItemDesc'] = 'You can get your Jobs here.',
        ['TruckItemName'] = 'Buy a Truck!',
        ['TruckItemDesc'] = 'Here you can buy Trucks for yourself',
        ['price'] = 'The Price of this truck:',
        ['JobsMenuName'] = 'Look at your Jobs:',
        ['JobsMenuDesc'] = nil,
        ['notify'] = 'Press ~INPUT_CONTEXT~ to open the Trucker-Menu',
        ['truckername'] = 'Trucker-Boss',
        ['not_allowed_in_job'] = 'Your Not allowed to start another job finish your first one!',
        ['spawned'] = 'The Truck got spawned and marked!<3!',
        ['finished'] = 'Your job is done! the money went on your bank-account! <3',
        ['checkpoint'] = 'The first Checkpoint is done! now come home and get yourself the reward! <3',
        ['trailer_deleted'] = 'Your Trailer was deleted, your mission is failed Truck will be deleted in 10 seconds aswell',
        ['truck_deleted'] = 'Your Truck was deleted, better luck next time!',
        ['NoTrailerAttached'] = 'No Trailer Attached please Attach it to your Vehicle!!!',
        ['yourxp'] = 'Your EXP:',
        ['reward'] = 'You got your loan for the job:',
        ['Lease'] = "You Leased the truck and got charged for it :",
        ['Sold'] = "Your Truck has been given back to the company",
    }
}