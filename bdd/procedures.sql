CREATE PROCEDURE get_player(prm_id int)
BEGIN
	if prm_id is not null
		select JOU_NAME,JOU_IMG,JOU_MAIL,JOU_XP,JOU_ROLE from JOUEUR
		where JOU_ID = prm_id;
end;
