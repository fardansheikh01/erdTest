# schema for client onboarding system DATABASE


CREATE TABLE customers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name varchar,
    email varchar,
    status varchar,
    created_at DEFAULT CURRENT_TIMESTAMP,
    updated_at DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE csr(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name varchar,
    created_at DEFAULT CURRENT_TIMESTAMP,
    updated_at DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE task(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name varchar,
    customer_id INTEGER,
    assigned_to INTEGER, -- CSR id
    status varchar,
    task_type_id INTEGER,
    created_at DEFAULT CURRENT_TIMESTAMP,
    updated_at DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (assigned_to) REFERENCES csr(id),
    FOREIGN KEY (task_type_id) REFERENCES task_type(id)
)

CREATE TABLE task_type(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name varchar,
    created_at DEFAULT CURRENT_TIMESTAMP,
    updated_at DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE slots(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    csr_id INTEGER,
    task_type_id INTEGER,
    available_slots INTEGER DEFAULT 5,
    created_at DEFAULT CURRENT_TIMESTAMP,
    updated_at DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (csr_id) REFERENCES csr(id),
    FOREIGN KEY (task_type_id) REFERENCES task_type(id)
    UNIQUE (csr_id, task_type_id)
)

