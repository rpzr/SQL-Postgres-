SELECT pizzeria.name, pizzeria.rating FROM pizzeria
WHERE pizzeria.rating BETWEEN 3.5 AND 5.0
ORDER BY pizzeria.rating;

SELECT pizzeria.name, pizzeria.rating FROM pizzeria
WHERE pizzeria.rating >= '3.5' and pizzeria.rating <= '5.0'
ORDER BY pizzeria.rating;