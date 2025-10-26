CREATE TABLE person_discounts (
    id BIGINT PRIMARY KEY,
    person_id BIGINT NOT NULL,
    pizzeria_id BIGINT NOT NULL,
    discount NUMERIC,
    CONSTRAINT fk_person_discounts_person_id Foreign Key (person_id) REFERENCES person (id),
    CONSTRAINT fk_person_discounts_pizzeria_id Foreign Key (pizzeria_id) REFERENCES pizzeria (id)
)