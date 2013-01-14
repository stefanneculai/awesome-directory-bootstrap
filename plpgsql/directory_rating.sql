CREATE OR REPLACE FUNCTION directory_rating(dir_id integer)
	RETURNS float AS
	$function$
	    DECLARE
            dir_rating float;
            entry_no float;
	    BEGIN
            SELECT SUM(rate), COUNT(*) INTO dir_rating, entry_no
            FROM entries
            LEFT JOIN contents ON entries.id = contents.contentable_id AND contents.contentable_type = 'Entry'
            LEFT JOIN ratings ON contents.id = ratings.content_id
            LEFT JOIN mappings ON mappings.child_id = contents.id
            LEFT JOIN contents as dir_contents ON mappings.parent_id = dir_contents.id AND dir_contents.contentable_type = 'Directory'
            LEFT JOIN directories ON dir_contents.contentable_id = directories.id
            WHERE directories.id = dir_id AND ratings.rate > 0
            GROUP BY dir_contents.contentable_id;

            RETURN dir_rating/entry_no;
	    END;
	$function$
    LANGUAGE plpgsql;