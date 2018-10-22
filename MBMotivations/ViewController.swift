//
//  ViewController.swift
//  MB Motivation App
//
//  Created by: Thomas Brun on 08/18/18.
//  Owner: Mergim Berisha
//  Copyright © 2018 MB Motivations, Inc. All rights reserved.
//

//Import all needed Swift Libraries
import UIKit
import UserNotifications

class ViewController: UIViewController {

    //Initialization of GUI Switch
    @IBOutlet weak var UISwitch: UISwitch!
    @IBOutlet weak var QuoteLabel: UILabel!
    
    var time: Date?
    
    //All Quotes. Important: Needs to be in order. Index is the same as Authors.
    let stringQuotes = [
        "Deine Zeit ist begrenzt. Also verschwende sie nicht, um das Leben eines anderen zu leben. - Steve Jobs",
        "Erfolg hat nur wer tut, während er auf den Erfolg wartet. - Thomas Alva Edison",
        "Wenn alles gegen dich zu laufen scheint, erinnere dich daran, dass das Flugzeug gegen den Wind abhebt, nicht mit ihm. - Henry Ford",
        "Probleme sind Gelegenheiten, zu zeigen, was man kann. - Duke Ellington",
        "Die Strasse zum Erfolg ist immer eine Baustelle. - Lily Tomlin",
        "Kritik ist leichter zu ertragen, wenn du einsiehst, dass Menschen, die nicht kritisiert werden, diejenigen sind, die keine Risiken eingehen. - Donald Trump",
        "Wie schnell sich ein >>nicht jetzt<< in ein >>niemals<< verwandelt. - Martin Luther King",
        "Was wir am wenigsten brauchen, ist ein Mensch, der uns zwingt, das zu tun, was wir können. - Ralph Waldo Emerson",
        "Die Menschen sind es, die Deinen zukünftigen Erfolg bestimmen. Umgebe Dich mit guten Leuten und Du wirst nicht scheitern. - Wayne Huizenga",
        "Geld kommt, wenn man Erfolg hat. Wer Geld anstrebt, wird es aber nie zu einem gross. Vermögen bringen. - Rene Benko",
        "Wenn die Guten nicht kämpfen, werden die Schlechten siegen. - Platon",
        "Die beste Form der Rache ist Erfolg. - Michael Douglas",
        "Wer nicht jeden Tag etwas für seine Gesundheit aufbringt, muss eines Tages viel Zeit für die Krankheit opfern. - Sebastian Kneipp",
        "Wer kein Ziel hat, kann auch keines erreichen. - Laotse",
        "Versuche nicht, ein erfolgreicher, sondern ein wertvoller Mensch zu werden. - Albert Einstein",
        "Nichts wissen ist keine Schande, wohl aber, nichts lernen wollen. - Sokrates",
        "Der grösste Fehler, den wir in unserem Leben machen können, ist zu denken, wir würden für irgendjemanden ausser uns selbst arbeiten. - Brian Tracy",
        "Die meisten Menschen haben Angst vor dem Tod, weil sie nicht genug aus ihrem Leben gemacht haben. - Peter Ustinov",
        "Die Tragödie des Lebens liegt nicht im Nichterreichen seines Ziels. Die Tragödie des Lebens liegt darin keine Ziele zu haben, die man erreichen kann. - Benjamin Mays",
        "Der Hauptgrund dafür, warum die meisten Menschen nicht das bekommen, was sie wollen, ist der, dass sie gar nicht wissen, was sie wollen. - T. Harv Eker",
        "Wenn du keinen konkreten Plan hast, wanderst du nur umher. Du kannst ein gutes Schiff oder Flugzeug haben, aber ohne besonderes Ziel, wo du hin willst, irrst du nur herum. - Arnold Schwarzenegger",
        "Ein Problem ist halb gelöst, wenn es klar formuliert ist. - John Dewey",
        "Sehe dich nicht als der Architekt Deiner Karriere, sondern als ein Bildhauer. Gehe davon aus, dass Du viel hämmern, stemmen, kratzen und polieren musst. - B. C. Forbes",
        "Wer etwas will, findet Wege. Wer etwas nicht will, findet Gründe. - Willy Meurer",
        "Wer hohe Türme bauen will, muss lange beim Fundament verweilen. - Anton Bruckner",
        "Eine Investition in Wissen bringt noch immer die besten Zinsen. - Benjamin Franklin",
        "Niemand der sein Bestes gegeben hat, hat es später bereut. - George Halas",
        "Wenn du etwas verändern willst, beginne mit dem Menschen den du jeden Morgen im Spiegel siehst. - Simone Weil",
        "Gewinner tun das, wovor sie sich fürchten. - Franco Columbo",
        "Wann immer du sagst: >>Das hätte ich auch geschafft<<, denke daran, sie haben es getan. - Unbekannt",
        "Wenn Du in Deinem Training immer nur 90% gibst, dann wirst Du auch wenn es darauf ankommt nur 90% geben. - Michael Owen",
        "Die Kunst ist, einmal mehr aufzustehen, als man umgeworfen wird. - Winston Churchill",
        "Wer einen Misserfolg nur als kleinen Umweg betrachtet, verliert nie sein Ziel aus den Augen. - Martin Luther",
        "Mit Fleiß, mit Mut und festem Willen lässt jeder Wunsch sich endlich stillen. - Novalis",
        "Unsere Körper sind unsere Gärten – unsere Willen sind unsere Gärtner. - William Shakespeare",
        "In dem Moment an dem du am Aufgeben bist, denke daran, warum du so viel gegeben hast. - Fernando Torres",
        "Entweder werden wir einen Weg finden oder wir machen einen! - Hannibal",
        "Der Schmerz, den du heute fühlst, ist die Kraft, die du morgen spürst. - Unbekannt",
        "Indem man das, was man zu tun hat, aufschiebt, läuft man Gefahr, es nie tun zu können. - Charles-Pierre Baudelaire",
        "Gefühl von Grenze darf nicht heißen: >>hier bist du zu Ende<<, sondern: >>hier hast du noch zu wachsen<<. - Emil Gött",
        "Kontinuierliche Anstrengung – nicht Kraft oder Intelligenz – ist der Schlüssel, um Dein Potential freizusetzen. - Liane Cardes",
        "Hindernisse sollten Dich nicht aufhalten. Wenn Du gegen eine Wand läufst, dreh Dich nicht um, gib nicht auf. Finde heraus wie Du darüber klettern, hindurchgehen oder aussen rum gehen kannst. - Michael Jordan",
        "Mach es wie die Briefmarke. Sie sichert sich den Erfolg durch die Fähigkeiten einer Sache festzuhalten bis sie ankommt. - Josh Billings",
        "Auch im Alphabet kommt Anstrengung vor Erfolg. - Deutsche Weisheit",
        "Egal was um Dich herum passiert, nimm es nicht persönlich. Nichts, was andere Leute tun, passiert wegen Dir, sondern wegen ihnen selbst. - Miguel Ruiz",
        "Ich habe geweint, weil ich keine Schuhe hatte, bis ich einen traf, der keine Füsse hatte. - Giacomo Graf Leopardi",
        "Willst du etwas wissen, so frage einen Erfahrenen und keine Gelehrten. - Chinesische Weisheit",
        "Gibt es etwa eine bessere Motivation als Erfolg. - Ion Tiriac",
        "Lust und Liebe sind die Fittiche zu grossen Taten. - Johann Wolfgang von Goethe",
        "Lust verkürzt den Weg. - William Shakespeare",
        "Leben ist das, was passiert, während du fleissig dabei bist, andere Pläne zu schmieden. - John Lennon",
        "Die grössten Schwierigkeiten liegen da, wo wir sie suchen. - Johann Wolfgang von Goethe",
        "Der stärkste Trieb in der menschlichen Natur ist der Wunsch, bedeutend zu sein. - John Dewey",
        "Man liebt das, wofür man sich müht, und man müht sich für das, was man liebt. - Erich Fromm",
        "Das Geheimnis des ausserordentlichen Menschen ist in den meisten Fällen nichts als Konsequenz. - Buddha",
        "Nichts spornt mich mehr an als die drei Worte:>>DAS GEHT NICHT<<. Wenn ich das höre, tue ich alles, um das unmögliche möglich zu machen. - Harald Zindl",
        "Ohne Emotionen kann man Dunkelheit nicht in Licht und Apathie nicht in Bewegung verwandeln. - Carl Gustav Jung",
        "Ich will nicht Geld machen. Ich will wundervoll sein. - Marilyn Monroe",
        "Die einzige Möglichkeit, Menschen zu motivieren, ist die Kommunikation. - Lee Iacocca",
        "Die Fähigkeit, das Wort >>Nein<< auszusprechen, ist der beste Schritt zur Freiheit. - Nicolas Chamfort",
        "Chef ist nicht der, der etwas tut, sondern der das verlangen weckt, etwas zu tun. - Edgar Pisani",
        "Ich betrachte meine Fähigkeit, die Menschen zu begeistern, als meinen grössten Vorteil. - Charles M. Schwab",
        "Man muss mit den richtigen Leuten zusammenarbeiten, sie achten und motivieren. Dauerhafter Erfolg ist nur im Team möglich. - Klaus Steilmann",
        "Die Basis einer gesunden Ordnung ist ein grosser Papierkorb. - Kurt Tucholsky",
        "Erfolg verändert den Menschen nicht. Er entlarvt ihn. - Max Frisch",
        "Leute mit Mut und Charakter sind anderen Leuten immer sehr unheimlich. - Hermann Hesse",
        "Eure Liebe macht mich stark. Euer Hass macht mich unbesiegbar. - Cristiano Ronaldo",
        "Die beiden wichtigsten Tage in deinem Leben sind der Tag, an dem du geboren wurdest, und der Tag an dem du herausfindest warum. - Bodo Schäfer"
    ]
        //All Authors. Important: Needs to be in order. Index is the same as Quotes.
    
    //Function to set a Notification
    func setNewNotification() {
        //Set a random Number with stringAuthors.count as the maximum number
        let randomNumber = Int(arc4random() % UInt32(stringQuotes.count))

        //Create the notification
        let content = UNMutableNotificationContent()
        content.title = "MB Motivations"
        UserDefaults.standard.set("\(stringQuotes[randomNumber])", forKey: "UserDefaultQuoteString")
        content.body = UserDefaults.standard.object(forKey: "UserDefaultQuoteString") as! String
        content.categoryIdentifier = "category"
        //Set the time to fire the notification. use date.something. In this case, it fires at 7 o'clock
        var date = DateComponents()
        date.hour = 7
        //date.second = 5
        //if you need to debug - date.second = 5
        
        //Set the trigger with the date defined earlier
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        
        //Create the actual request to fire at trigger time with the content 'content'.
        let request = UNNotificationRequest(
            identifier: "identifier",
            content: content,
            trigger: trigger
        )
        
        //Fire the Notification
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        QuoteLabel.text = UserDefaults.standard.object(forKey: "UserDefaultQuoteString") as! String
    }
    
    //Create Variables for the timer functions
    weak var timer: Timer?
    var timerDispatchSourceTimer : DispatchSourceTimer?
    
    func startTimer() {
        if #available(iOS 10.0, *) {
            //Run the Timer every hour to randomly change the output of the messages. should be set to a maximum of
            //23hours and 59 minutes as it should change at least once a day.
            //if you need to debug - timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            timer = Timer.scheduledTimer(withTimeInterval: 3600, repeats: false) { [weak self] _ in
                //Run the setNewNotification Function
                self?.setNewNotification()
            }
            
        } else {
            // Fallback on earlier versions of iOS
            //Run the Timer every hour to randomly change the output of the messages. should be set to a maximum of
            //23hours and 59 minutes as it should change at least once a day.
            timerDispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
            timerDispatchSourceTimer?.scheduleRepeating(deadline: .now(), interval: .seconds(3600))
            //if you need to debug - timerDispatchSourceTimer?.scheduleRepeating(deadline: .now(), interval: .seconds(60))
            timerDispatchSourceTimer?.setEventHandler{
                //Run the setNewNotification Function
                self.setNewNotification()
                
            }
            timerDispatchSourceTimer?.resume()
        }
    }
    
    func stopTimer() {
        //For stopping the Timer
        timer?.invalidate()
        timerDispatchSourceTimer?.cancel()
    }

    @IBAction func UISwitch(_ sender: UISwitch) {
        if UISwitch.isOn == true {
            //Run this content if the Switch is set 'on'.
            UserDefaults.standard.set(sender.isOn, forKey: "SwitchState")
            setNewNotification()
            startTimer()
        }
        else{
            //Remove all created Notifications and stop the timer.
            stopTimer()
            UserDefaults.standard.set(sender.isOn, forKey: "SwitchState")
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        QuoteLabel.text = UserDefaults.standard.object(forKey: "UserDefaultQuoteString") as! String
        UISwitch.isOn = UserDefaults.standard.bool(forKey: "SwitchState")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override open var shouldAutorotate: Bool{
        return false
    }
    
    func updateUI() {
        UISwitch.setOn(true, animated: false)
        if UISwitch.isOn == true {
            //Run this content if the Switch is set 'on'.
            setNewNotification()
            startTimer()
            QuoteLabel.text = UserDefaults.standard.object(forKey: "UserDefaultQuoteString") as! String
        }
        else{
            //Remove all created Notifications and stop the timer.
            stopTimer()
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            
        }
    }
    
}
