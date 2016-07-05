# Our Spaces
<p align="center">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/assets/app_icon/iTunesArtwork@2x@2x.png" alt="alt text" width="25%" >
</p>



###What is this app?

Our Spaces (known in development as Vulnerable Spaces) is an iOS application created to help environmental studies major, Sarah King gather data for her senior thesis. The application allows users to record locations on Vassar campus that they feel are significant to them. The app presents a Google Maps view, where users can submit their current location or scroll around the map to submit a different location on Vassar's campus. Our Spaces also uses Location Services so that the map moves dynamically with the student. When a user submits a location, the program associates a randomly generated ID with the user and the location, the userID, and the time submitted are saved on a server using Parse. Parse is closing in January 2017, but as the app has already served its purpose there are no plans to update it.




###Screenshots:

<p align="center">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/Instruction1.png" alt="alt text" width="200px" height="350px">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/Instruction2.png" alt="alt text" width="200px" height="350px">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/Instruction4.jpg" alt="alt text" width="200px" height="350px">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/Screen1.jpg" alt="alt text" width="200px" height="350px">
</p>
<p align="center">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/Screen2.png" alt="alt text" width="200px" height="350px">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/Screen3.jpg" alt="alt text" width="200px" height="350px">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/Screen4.png" alt="alt text" width="200px" height="350px">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/Screen5.png" alt="alt text" width="200px" height="350px">
</p>


###How was the data used?
From May 13-23 in the former Vassar College bookstore, The Climate of Vulnerable Spaces exhibition presented the pieced and sewn Narrative Bodies Quilt on a dorm-room bed with large scale prints of maps displaying the data collected from the application. These images, the quilt and the space itself each offer various dimensions to the story of Vassar. Each mode of vulnerability exposed within a narrative built for and by the student body. Post-it notes and pens enabled those experiencing the exhibit to share what narratives being in the exhibit prompted.    
**- paraphrased from Sarah King's thesis which can be read in its entirety [here](https://drive.google.com/a/vassar.edu/file/d/0B_ufrkcJcTNVZTU2eVhFSTA3YkE/view)**

<p align="center">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/display2.JPG" alt="alt text" width="75%" >
</p>

<p align="center">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/display3.jpeg" alt="alt text" width="25%">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/display4.jpeg" alt="alt text" width="25%">
<img src="https://github.com/vcplusplus/vulnerable_spaces_ios/blob/master/images/display5.jpeg" alt="alt text" width="25%">

</p>


###Who worked on this?
[Gabriel Dell'Accio](https://github.com/GDell): Gabe worked on the backend, helping to setup the location data model and integrate the app with Parse. All while learning Swift and iOS development for the first time.

[Kathryn Hodge](https://github.com/blondiebytes):
For Vulnerable Spaces, I mainly worked on the front end. I helped configure the Google Maps View with the Server API key and worked on the code that allowed a user’s pins to be placed in their appropriate locations on the view. I also added UIAlertControllers to allow users to see that their location had been submitted as well as an undo button that not only removed the pin, but also the location from the database. The biggest programming challenge was probably messing around with auto-constraints to get the center pin, buttons, and placed pins exactly how we wanted. This project was so much fun and I can’t wait to create more with VC++!

[Annie Hsu](https://github.com/orgs/vcplusplus/people/annieboboh): Annie also worked on the backend, helping to setup the location data model and integrate the app with Parse.  All while learning Swift and iOS development for the first time.

Sarah King: All text within the application was written by Sarah.

[Jayce Rudig-Leathers](https://github.com/jayce-leathers): I designed the application including creation of all UI assets, as well as helping to polish the UI implementation. Gabe and Annie worked under my mentorship to assist George in setting up the Parse database. I integrated George's' backend work and Kathryn's work on the map UI. Sarah and I collaborated to distribute the application to Vassar students using Beta by Crashlytics. We had to use this ad-hoc method of app distribution as Vassar College does not provide VC++ with a full Apple Developer Account capable of submitting apps to the app store. 

[George Witteman](https://github.com/georgewitteman): George oversaw creation of the Parse database integration with Gabe and Annie. He also helped under looming deadlines to troubleshoot multiple UI problems. 

