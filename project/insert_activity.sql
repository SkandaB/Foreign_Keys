INSERT INTO activity
SELECT
  c.id calendar_id,
  p.user_id user_id,
  p.id post_id,
  qt.tag_id tag_id
FROM
  question q,
  question_tag qt,
  post p,
  answer a,
  calendar c
WHERE
  a.post_id = p.id AND
  a.question_id = q.id AND
  q.id = qt.question_id AND
  c.fulldate = DATE(p.created_timestamp)
UNION
  SELECT
  c.id calendar_id,
  p.user_id user_id,
  p.id post_id,
  qt.tag_id tag_id
  FROM
  question q,
  question_tag qt,
  post p,
  calendar c
  WHERE
  q.post_id = p.id AND
  q.id = qt.question_id AND
  c.fulldate = DATE(p.created_timestamp)
