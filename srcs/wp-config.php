<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'Artist' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
 define('AUTH_KEY',         'YRpq42?jn<kc)N|zU[|NFk8vF(wwWW|Q^+ yxI8TrjHkH]w.~3H=6+2?B>t2Eb0V');
 define('SECURE_AUTH_KEY',  '+}~|[=WFXpmf8>EC8ftikv)&S)Vo0 #lz?)X#2eep~v?^17l+i4q?B81dvi!+a?Y');
 define('LOGGED_IN_KEY',    'W]6%i5fiQ$rfc+2*oQAW&tEtx@nHc,rDJ~P~}FFu9dRCa3y0{5;Of-F&-%Ne*z$g');
 define('NONCE_KEY',        'S?Ekf] -;x3raP.Hsl4)Y|aPjr8 Ep*8IJm.>Xyx},~Cs)hBJV6t;wvjQci( V~q');
 define('AUTH_SALT',        '+X69i-La+DsP8YV6aL/*7%Ae-+Lq?1pQG_tVKun?b[x%S%ttMokMl[MRH}$m1BNO');
 define('SECURE_AUTH_SALT', 'g|+_}2:kQyk|z[L5PzM6YA_1|mt#)xhW{/n<5iK<XFjHLns$_#m&&t|FLP[y!2JS');
 define('LOGGED_IN_SALT',   'Y;ET*UM&k/]vYrPy5(Zq|G=|Xo+LY5x?n-y|yy:.;yc>23b[K{FUO)9f<lZ4cud_');
 define('NONCE_SALT',       'gm+t+<BQ`~2CHgCDC$/-u$5?j A#ig+>q!c5HcASbEvHgebPxh&0FoO}VG*Vb Uw');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
