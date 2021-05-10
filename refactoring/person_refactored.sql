CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    email_address TEXT,
    company INTEGER,
    FOREIGN KEY(company) REFERENCES company(id)
);

CREATE TABLE company (
    id INTEGER PRIMARY KEY,
    company_name TEXT,
    company_address TEXT,
    company_tel_no TEXT
);
