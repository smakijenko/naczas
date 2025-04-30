👋 Hi!

🚌🚊 I’d like to show you my new SwiftUI app called naCzas?. It’s a simple and helpful app that shows the current schedules and live locations of Warsaw buses and trams, all on a map.

The app uses data from the "Otwarte dane po warszawsku" API, which gives access to public transport information. This data is managed by several backend managers that make sure everything works smoothly. If something goes wrong, the app shows a clear system alert to inform the user.

Some data can also be saved locally using SwiftData, so the app works faster and gives a better experience. The user interface is clean and easy to use, making it a comfortable app for everyday use.

🟥 Here is a link to the youtube video, that shows how the app looks like: https://youtube.com/shorts/xtMHYzin2Mk

👉 To improve user experience while loading the data I used: https://github.com/markiv/SwiftUI-Shimmer

🔥 Interesting features that are implemented into the app:

◻️ Main view, that consists of:

▫️ City picker - feature for future development

▫️ Search bar - for easier lines searching

▫️ Transport type tab bar - for choosing transport type

▫️ Lines grid - feature that shows available lines (green) or currently offline ones (red)

![ezgif com-optimize](https://github.com/user-attachments/assets/6c5e667f-7414-411b-a059-b5be92fdc646)

◻️ Line stops view, includes all stops for chosen line, distinguishing between permanent and on-demand stops. Additionally, if data is available, on right side user sees time to closest departure.

![ezgif com-optimize](https://github.com/user-attachments/assets/cb7e952c-837c-41fe-a346-d8e25f5b386b)

◻️ Schedule view, that consists of ll available lines from stop bar, to see all departures also for other lines and departures list with indicators of when the departure will take place.

![ezgif com-optimize](https://github.com/user-attachments/assets/3dc89889-83b6-45bf-b01f-e8925e2079af)

◻️ Map view, where the user can see stops on their locations and if available, buses or trams sheduled for chosen stop.

![beznazwy-ezgif com-optimize](https://github.com/user-attachments/assets/f9ec4d95-c5cd-4c75-bf6f-7da42de5ee80)
