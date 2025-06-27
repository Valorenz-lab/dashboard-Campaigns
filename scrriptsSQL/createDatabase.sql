CREATE TABLE customer (
    idCustomer integer PRIMARY KEY,
    firstName  VARCHAR(100),
    lastName VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    creditworthiness NUMERIC(10,2),
    isCustomer BOOLEAN DEFAULT FALSE
);

CREATE TABLE advertisingCampaign (
    idCampaign SERIAL PRIMARY KEY,
    nameCampaign VARCHAR(100),
    motiveCampaign TEXT,
    campaignDescription TEXT,
    dateLaunch DATE DEFAULT CURRENT_DATE
);

CREATE TABLE customerCampaign (
    idCampaignAssignment SERIAL PRIMARY KEY,
    idCampaign INT REFERENCES customer(idCampaign),
    idCustomer INT REFERENCES advertisingCampaign(idCustomer),
    dateAssignment TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE contact (
    idContact SERIAL PRIMARY KEY,
    idCampaignAssignment INT REFERENCES advertisingCampaign(idCampaignAssignment),
    dateContact TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    chanel VARCHAR(50),
    messageContact TEXT,
);

CREATE TABLE contactState (
    idContactState SERIAL PRIMARY KEY,
    idContact INT REFERENCES contact(idContact)
    nameState VARCHAR(100) UNIQUE,
    replyDate DATE,
    reason TEXT
);



