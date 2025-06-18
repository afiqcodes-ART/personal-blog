# Clinic Management System

A complete JSP-based Clinic Management System designed to streamline clinic operations such as patient registration, appointment handling, staff management, treatment records, and payment processing.

---

## 🧩 Modules / Features

### 👤 Login System
- `Login.jsp` – Login interface
- `loginDisplayMenu.jsp` – Dynamic menu based on user roles (Doctor, Clerk, Pharmacist)

### 👩‍💼 Clerk Module
- `clerkMenu.jsp` – Clerk dashboard
- `clerkRegisterForm.jsp` / `clerkRegisterInsert.jsp` – Register new clerk
- `clerkProfileUpdate.jsp` / `clerkProfileUpdateProcess.jsp` – Update clerk info
- `clerkChangePassword.jsp` / `clerkChangePasswordProcess.jsp` – Change password

### 👩‍⚕️ Doctor Module
- `doctorMenu.jsp` – Doctor dashboard
- `doctorRegisterForm.jsp` / `doctorRegisterInsert.jsp` – Register doctor
- `doctorProfileUpdate.jsp` – Profile update
- `doctorChangePassword.jsp` / `doctorChangePasswordProcess.jsp` – Password update

### 🧑‍🔬 Pharmacist Module
- `pharmacistMenu.jsp` – Pharmacist dashboard
- `pharmacistRegisterForm.jsp` / `pharmacistRegisterInsert.jsp` – Register pharmacist
- `pharmacistProfileUpdate.jsp` / `pharmacistProfileUpdateProcess.jsp` – Profile management
- `pharmacistChangePassword.jsp` / `pharmacistChangePasswordProcess.jsp` – Password change

### 🧾 Patient Module
- `addNewPatient.jsp` / `addNewPatientProcess.jsp` – Register patient
- `updatePatient.jsp` – Edit patient info
- `deletePatient.jsp` – Remove patient
- `patientReport.jsp` – View patient reports

### 💊 Medicine Management
- `medicineRegisterForm.jsp` / `medicineRegisterInsert.jsp` – Add new medicines
- `updateMedicine.jsp` / `updateMedicineProcess.jsp` – Update medicine info
- `deleteMedicine.jsp` – Delete medicine
- `medicineDispensingReportByPatient.jsp`
- `medicineReportByCategory.jsp`

### 🧪 Treatment & Records
- `registerPatientTreatmentForm.jsp` / `registerPatientTreatmentProcess.jsp`
- `treatmentAndDispenceMedication.jsp`
- `displayDetailTreatmentAndPayment.jsp`
- `treatmentReportByDate.jsp` / `treatmentReportByPatient.jsp`

### 💳 Payment System
- `addPayment.jsp` / `addNewPaymentProcess.jsp`
- `paymentReportByDate.jsp`

### 📡 Database Connection
- `connectionDB.jsp` – Manages database connectivity

---

## 🛠️ Technologies Used
- Java Server Pages (JSP)
- HTML/CSS (UI design)
- JavaScript (Client-side interaction)
- JDBC + MySQL (Database handling)

---

## 🚀 How to Run
1. Open your project in **Apache Tomcat** or another compatible Java EE server
2. Make sure **MySQL** is running and the database is imported
3. Access the app via: `http://localhost:8080/clinic-management-system/Login.jsp`
4. Download or clone this repository:
   https://github.com/afiqcodes-ART/personal-blog
   
   
---



## 📂 Folder Structure Suggestion

Although all your `.jsp` files are currently in one place, here’s how to improve it for clarity:

