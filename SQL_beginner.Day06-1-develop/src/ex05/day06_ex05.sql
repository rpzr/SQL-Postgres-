COMMENT ON TABLE person_discounts IS 'Таблица со скидками для конкретных заказчиков в конкретных пиццериях';

COMMENT ON COLUMN person_discounts.person_id IS 'ID заказчиков';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID пиццерий';

COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах';