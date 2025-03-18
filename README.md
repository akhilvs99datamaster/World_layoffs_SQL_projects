# 📊 SQL Project: Data Cleaning and EDA on Global Layoffs  

## 🌟 Project Overview  
Conducted comprehensive data cleaning and exploratory data analysis (EDA) on a global layoffs dataset using SQL. Transformed raw, messy data into a structured, analysis-ready format to uncover key workforce trends across industries and regions.

---

## 🛠️ Key Steps & Achievements  

### 🔹 Data Cleaning  
- ✅ **Imported and validated** a layoffs dataset (~500+ rows) into **MySQL**.  
- ✅ **Handled missing values**, inconsistent formatting, and **removed duplicates** for better data integrity.  
- ✅ **Standardized date formats** (`%m/%d/%Y` → `YYYY-MM-DD`) and corrected erroneous entries.  
- ✅ **Ensured numeric columns** (e.g., `total_laid_off`) were cleanly parsed and aggregated.  

---

### 🔹 Exploratory Data Analysis (EDA)  
- 📌 **Extracted key insights** like total layoffs per **year**, **company**, **country**, and **industry**.  
- 📌 **Implemented window functions** (`DENSE_RANK()`, `ROW_NUMBER()`) to rank companies by layoffs within each year.  
- 📌 **Used aggregate functions** (`SUM()`, `AVG()`, `COUNT()`) to analyze trends over time.  
- 📌 **Built subqueries and UNIONs** to combine and compare datasets, identifying top-affected companies and regions.  

---

### 🔹 Insights & Findings  
- 🔍 **Discovered year-over-year layoff trends** and pinpointed peak periods.  
- 🔍 **Ranked companies by layoffs per year**, efficiently handling ties with `DENSE_RANK()`.  
- 🔍 **Unveiled country-specific patterns** — highlighting regions most impacted by workforce reductions.  

---

## 🧠 Tech Stack  
- **SQL (MySQL)**  
- **Data Cleaning**  
- **Window Functions**  
- **Aggregate Queries**  
- **Joins & Subqueries**  

---

⭐ **Future Enhancements:**  
- Add **visualizations** using Python (Matplotlib/Seaborn).  
- Create **interactive dashboards** with **Power BI/Tableau**.  
- Build a **rolling table** for **real-time updates**.  

---

💪 **Project Status:** Complete ✅  

