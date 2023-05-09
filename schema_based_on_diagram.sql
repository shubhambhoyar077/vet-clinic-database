CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status varchar(250),
    PRIMARY KEY(id),
    CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patient(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(250),
  name VARCHAR(250),
  PRIMARY KEY(id)
);

-- many-to-many table btw medical-histories and trearments
CREATE TABLE trearment_histories (
  medical_histoy__id INT,
  treatment_id INT,
  PRIMARY KEY (medical_histoy__id, treatment_id),
  CONSTRAINT fk_medical_histoy FOREIGN KEY(medical_histoy__id) REFERENCES medical_histories(id),
  CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);