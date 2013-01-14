CREATE OR REPLACE FUNCTION popular_directories()
	RETURNS SETOF directories AS
	$procedure$
        BEGIN
            RETURN QUERY EXECUTE 'SELECT * FROM directories WHERE directory_rating(directories.id) > 0 ORDER BY directory_rating(directories.id) DESC';
        END;
	$procedure$
	LANGUAGE plpgsql;
