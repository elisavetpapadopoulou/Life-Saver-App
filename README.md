Η εφαρμογή Life-Saver είναι πιστή στις αρχικές προδιαγραφές και το πρωτότυπο του Figma, διατηρώντας τον πρώτο άξονα όπως ήταν και την χρήση των Bluetooth (settings/Bluetooth) και AR.
Αφαιρέσαμε την χρήση των Neural Networks όπως μας επισημάνθηκε κατά την αξιολόγηση της πρώτης φάσης, καθως δεν υπήρχαν προεκπαιδευμένα μοντέλα και αντικαταστήσαμε στον τρίτο άξονα το GPS με τη δυνατότητα για κλήσεις. 

Το αρχείο debug-apk βρίσκεται μέσα στον φάκελο my_flutter_project, στο μονοπάτι build/app/outputs/flutter-apk/app-debug.apk

Για την εγκατάσταση της εφαρμογής πρέπει να γίνει clone το git repo της εφαρμογής, είτε μέσω της εφαρμογής GitHub desktop, είτε μέσω terminal με την εντολή
git clone https://github.com/elisavetpapadopoulou/Life-Saver-App/tree/main
στο directory που επιθυμούμε να εγκαταστήσουμε τη βάση.

Για την εγκατάσταση της βάσης στον υπολογιστή μας χρειαζόμαστε έναν 
sql server, εμείς χρησιμοποιήσαμε mysql μέσω xampp. Στο τερματικό πρέπει να τρέξουμε τις εντολές:
SOURCE my_flutter_project/Delete_database.sql;
SOURCE my_flutter_project/lifesaver_create_database.sql;

Για να τρέξουμε την εφαρμογή πρέπει να έχουμε python και flutter, καθώς και να κάνουμε pip install mysql-connector-python (για τη σύνδεση με τη βάση).

Τέλος, τρέχουμε τις ακόλουθες εντολές:
flutter pub get 
python database_connection.py
python api.py 
και τέλος το αρχείο main.dart

H εφαρμογή τώρα είναι διαθέσιμη στην android συσκευή μας (για να λειτουργούν όλα σωστά πρέπει να μπορεί να έχει δυνατότητα για κλήσεις και σύνδεσης στο Βluetooth).
