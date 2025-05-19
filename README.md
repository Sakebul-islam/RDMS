# RDMS

# 🔑 RDBMS Key Types with Example, Table & Explanation

আমরা নিচের Key গুলো নিয়ে আলোচনা করবো:

1. Primary Key
2. Candidate Key
3. Alternate Key
4. Composite Key
5. Foreign Key
6. Super Key
7. Unique Key

---

## 📋 Example Student Table

| StudentID | Email           | PassportNo | Name  | CourseID |
| --------- | --------------- | ---------- | ----- | -------- |
| 101       | rahim@gmail.com | P123       | Rahim | CSE101   |
| 102       | karim@gmail.com | P456       | Karim | CSE101   |
| 103       | laila@gmail.com | P789       | Laila | CSE102   |

---

## 1️⃣ Primary Key

**সংজ্ঞা:** এমন একটি কলাম (বা কলামগুলোর সংমিশ্রণ) যা প্রতিটি রেকর্ডকে ইউনিক করে। এটাতে null বা duplicate মান থাকতে পারে না।

- ✅ উদাহরণ: `StudentID`
- 📌 ব্যাখ্যা: `StudentID` সবসময় ইউনিক এবং null নয়।

---

## 2️⃣ Candidate Key

**সংজ্ঞা:** এমন সব কলাম যেগুলো প্রতিটি রেকর্ডকে ইউনিক করে এবং যেগুলো থেকে Primary Key নির্বাচিত হতে পারে।

- ✅ উদাহরণ: `StudentID`, `Email`, `PassportNo`
- 📌 ব্যাখ্যা: এই তিনটি দিয়েই রেকর্ডকে আলাদা চেনা যায়।

---

## 3️⃣ Alternate Key

**সংজ্ঞা:** Candidate Key গুলোর মধ্যে যেগুলো Primary Key হিসেবে ব্যবহৃত হয়নি।

- ✅ উদাহরণ: `Email`, `PassportNo` (যদি `StudentID` Primary হয়)
- 📌 ব্যাখ্যা: Alternate Key মানে অন্য সম্ভাব্য ইউনিক কোলাম যা Primary করা হয়নি।

---

## 4️⃣ Composite Key

**সংজ্ঞা:** একাধিক কলাম একসাথে মিলে ইউনিক আইডেন্টিফায়ার তৈরি করে।

### 🎓 Enrollment Table Example:

| StudentID | CourseID | Grade |
| --------- | -------- | ----- |
| 101       | CSE101   | A     |
| 102       | CSE101   | B     |
| 101       | CSE102   | A-    |

- ✅ উদাহরণ: `StudentID + CourseID`
- 📌 ব্যাখ্যা: এককভাবে Student বা CourseID ইউনিক নয়, কিন্তু একসাথে ইউনিক।

---

## 5️⃣ Foreign Key

**সংজ্ঞা:** এমন একটি কলাম যা অন্য টেবিলের Primary Key কে রেফার করে।

### 🎓 Course Table Example:

| CourseID | CourseName |
| -------- | ---------- |
| CSE101   | Web Dev    |
| CSE102   | DBMS       |

- ✅ উদাহরণ: Student টেবিলের `CourseID` → Course টেবিলের Primary Key
- 📌 ব্যাখ্যা: এটি দুটি টেবিলের মধ্যে সম্পর্ক তৈরি করে।

---

## 6️⃣ Super Key

**সংজ্ঞা:** যেকোনো কলাম বা কলামের সেট যা একটি রেকর্ডকে ইউনিক করে, তবে অতিরিক্ত কলাম থাকতে পারে।

- ✅ উদাহরণ: `StudentID`, `StudentID + Name`, `Email`
- 📌 ব্যাখ্যা: Super Key = Candidate Key + অতিরিক্ত কলাম হতে পারে।

---

## 7️⃣ Unique Key

**সংজ্ঞা:** একটি কলাম যেটা ইউনিক হতে হবে, তবে null একবার থাকতে পারে।

- ✅ উদাহরণ: `Email`
- 📌 ব্যাখ্যা: Unique constraint null একবার মেনে নেয়।

---

## 🔄 Summary Table

| Key Type      | Uniqueness | Null Allowed? | Multiple Allowed? | Example                    |
| ------------- | ---------- | ------------- | ----------------- | -------------------------- |
| Primary Key   | ✅ Yes     | ❌ No         | ❌ No             | StudentID                  |
| Candidate Key | ✅ Yes     | ❌ No         | ✅ Yes            | Email, PassportNo          |
| Alternate Key | ✅ Yes     | ❌ No         | ✅ Yes            | Email (if not Primary)     |
| Composite Key | ✅ Yes     | ❌ No         | ✅ Yes            | StudentID + CourseID       |
| Foreign Key   | 🚫 No      | ✅ Yes        | ✅ Yes            | CourseID from Course Table |
| Super Key     | ✅ Yes     | ❌ No         | ✅ Yes            | StudentID + Name           |
| Unique Key    | ✅ Yes     | ✅ Yes (1x)   | ✅ Yes            | Email                      |

---
