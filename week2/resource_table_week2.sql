
CREATE TABLE ResourceTable (
  resNo   CHAR(8)       NOT NULL,
  resName VARCHAR(40)   NOT NULL,
  rate    DECIMAL(8, 2) NOT NULL,
  CONSTRAINT PK_resTbl PRIMARY KEY (resNo)
);