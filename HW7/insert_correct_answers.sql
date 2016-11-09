INSERT INTO correct_answers
SELECT
  a.question_id question_id,
  a.post_id answer_id,
  qp.user_id question_user_id,
  ap.user_id answer_user_id,
  qt.tag_id tag_id,
  qc.id question_calendar_id,
  ac.id answer_calendar_id
FROM
  answer a,
  question q,
  post qp,
  post ap,
  question_tag qt,
  calendar qc,
  calendar ac
WHERE
  a.accepted = 1 AND
  a.post_id = ap.id AND
  q.post_id = qp.id AND
  a.question_id = q.id AND
  qp.id = q.post_id AND
  ap.id = a.post_id AND
  q.id = qt.question_id AND
  qc.fulldate = DATE(qp.created_timestamp) AND
  ac.fulldate = DATE(ap.created_timestamp)
