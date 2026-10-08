# PL/SQL Assignment Reflection: GOTO Statements & Functions

**Student Repository:** `plsql-goto-functions-20252IMA226-ruth`  
**Database Environment:** Oracle SQL*Plus  

---

## 1. Executive Summary
This project demonstrates key PL/SQL programming constructs in Oracle Database, focusing on:
- Control structures using `GOTO` statements and labels.
- Modular database programming using PL/SQL stored functions.
- Formatted output rendering in SQL*Plus environments.

---

## 2. GOTO Statements Evaluation
### Key Findings:
1. **Use Cases**: `GOTO` can simplify control flow jumps in specialized state machines or unrecoverable error routines.
2. **Drawbacks**: Unchecked usage leads to "spaghetti code," making code hard to trace and maintain.
3. **Restricted Scope**: Oracle PL/SQL forbids jumping into an `IF` statement block or loop from outside (`PLS-00375`).
4. **Best Practice**: `IF-ELSIF-ELSE` and `CASE` structures provide cleaner, more maintainable code without labels.

---

## 3. Modular Programming with Functions
### Implementation Highlights:
- **`fn_annual_salary`**: Computes annualized earnings with `NULL` protection.
- **`fn_years_of_service`**: Calculates tenure using `MONTHS_BETWEEN`.
- **`fn_calculate_tax`**: Applies tiered income tax brackets (`10%`, `18%`, `25%`).
- **`fn_dept_name`**: Resolves department IDs with `NO_DATA_FOUND` exception handling.
- **`fn_validate_payroll`**: Enforces organizational salary boundary checks.

---

## 4. SQL*Plus Output & Formatting
Formatting commands were applied to ensure clean tabular output:
```sql
SET LINESIZE 200;
SET PAGESIZE 50;
COLUMN employee_name FORMAT A20 HEADING "Employee Name";
COLUMN monthly_salary FORMAT $99,990.00 HEADING "Monthly";
