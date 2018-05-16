DBHOST := "127.0.0.1"
DBPORT := "3306"
DBUSER := "core"
DBPASS := "core"
DB := "core_world"

export:

	mysqldump \
		-h${DBHOST} -P${DBPORT} \
		-u${DBUSER} -p${DBPASS} \
		${DB} \
		locales_area locales_broadcast_text locales_creature \
		locales_gameobject locales_gossip_menu_option \
		locales_item locales_page_text locales_points_of_interest \
		locales_quest > ./sql/world_locales.sql

	mysql \
		-h${DBHOST} -P${DBPORT} \
		-u${DBUSER} -p${DBPASS} \
		${DB} \
		-e "DROP TABLE locales_area, \
			locales_broadcast_text, locales_creature, \
			locales_gameobject, locales_gossip_menu_option, \
			locales_item, locales_page_text, locales_points_of_interest, \
			locales_quest"

	mysqldump \
		-h${DBHOST} -P${DBPORT} \
		-u${DBUSER} -p${DBPASS} \
		${DB} > ./sql/world_full.sql
