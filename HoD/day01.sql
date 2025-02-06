-- First try:
--
-- SELECT
--   customerid,
--   name,
--   phone
-- FROM
--   customers
--  WHERE length(replace(substr(name, instr(name, ' ')), ' ', '')) = 10
--    AND NOT phone LIKE '%0%'
--    AND NOT phone LIKE '%1%';

-- Answer:
--
SELECT
  name,
  replace(
    replace(
      replace(
        replace(
          replace(
            replace(
              replace(
                replace(
                  replace(
                    replace(
                      replace(
                        replace(
                          replace(
                            replace(
                              replace(
                                replace(
                                  replace(
                                    replace(
                                      replace(
                                        replace(
                                          replace(
                                            replace(
                                              replace(
                                                replace(
                                                  replace(
                                                    replace(
                                                      replace(lower(substr(name, instr(name, ' ') + 1)), ' ', ''), 'a', '2'), 'b', '2'), 'c', '2'), 'd', '3'), 'e', '3'), 'f', '3'), 'g', '4'), 'h', '4'), 'i', '4'), 'j', '5'), 'k', '5'), 'l', '5'), 'm', '6'), 'n', '6'), 'o', '6'), 'p', '7'), 'q', '7'), 'r', '7'), 's', '7'), 't', '8'), 'u', '8'), 'v', '8'), 'w', '9'), 'x', '9'), 'y', '9'), 'z', '9') AS name_as_phone,
  replace(phone, '-', '') as numbers_only_phone,
  phone
  FROM customers
 WHERE name_as_phone = numbers_only_phone;

