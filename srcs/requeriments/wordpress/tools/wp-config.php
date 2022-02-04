<?php
	// ** MySQL settings - You can get this info from your web host ** //
	/** The name of the database for WordPress */

	define('DB_NAME', 'db_name');

	/** MySQL database username */
	define('DB_USER', 'db_user');

	/** MySQL database password */
	define('DB_PASSWORD', 'db_password');

	/** MySQL hostname */
	define('DB_HOST', 'mariadb');

	/** Database Charset to use in creating database tables. */
	define('DB_CHARSET', 'utf8');

	/** The Database Collate type. Don't change this if in doubt. */
	define('DB_COLLATE', '');

	define('AUTH_KEY',		'put your unique phrase here');
	define('SECURE_AUTH_KEY',	'put your unique phrase here');
	define('LOGGED_IN_KEY',		'put your unique phrase here');
	define('NONCE_KEY',		'put your unique phrase here');
	define('AUTH_SALT',		'put your unique phrase here');
	define('SECURE_AUTH_SALT',	'put your unique phrase here');
	define('LOGGED_IN_SALT',	'put your unique phrase here');
	define('NONCE_SALT',		'put your unique phrase here');

	define('WP_DEBUG', true);

	define('WP_DEBUG_LOG', true);

	$table_prefix  = 'wp_';

	/** Absolute path to the WordPress directory. */
	if ( !defined('ABSPATH') )
	        define('ABSPATH', dirname(__FILE__) . '/');
	
	/** Sets up WordPress vars and included files. */
	require_once(ABSPATH . 'wp-settings.php');


	/* That's all, stop editing! Happy blogging. */
