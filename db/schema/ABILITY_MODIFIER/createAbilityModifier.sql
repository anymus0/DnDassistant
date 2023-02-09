CREATE TABLE ABILITY_MODIFIER (
  ID NUMBER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
  ABILITY_SCORE NUMBER NOT NULL,
  ABILITY_MODIFIER_POINTS NUMBER NOT NULL,
  CONSTRAINT ABILITY_MODIFIER_PK PRIMARY KEY (ID),
  CONSTRAINT ABILITY_SCORE_MIN_MAX CHECK (ABILITY_SCORE >= 1 AND ABILITY_SCORE <= 30),
  CONSTRAINT ABILITY_MODIFIER_MIN_MAX CHECK (ABILITY_MODIFIER_POINTS >= -5 AND ABILITY_MODIFIER_POINTS <= 10)
);