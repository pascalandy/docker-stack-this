<?php
/**
 * Nisarg Theme Customizer
 *
 * @package Nisarg
 */

/**
 * Add postMessage support for site title and description for the Theme Customizer.
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function nisarg_customize_register( $wp_customize ) {

	//get the current color value for accent color
	$color_scheme = nisarg_get_color_scheme();
	//get the default color for current color scheme
	$current_color_scheme = nisarg_current_color_scheme_default_color();

	$wp_customize->get_setting( 'blogname' )->transport         = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport  = 'postMessage';
	$wp_customize->get_setting( 'header_textcolor' )->transport = 'postMessage';

	//Header Background Color setting
	$wp_customize->add_setting( 'header_bg_color', array(
		'default'           => '#b0bec5',
		'sanitize_callback' => 'sanitize_hex_color',
		'transport'         => 'postMessage',
	) );

	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, 'header_bg_color', array(
		'label'       => __( 'Header Background Color', 'nisarg' ),
		'description' => __( 'Applied to header background.', 'nisarg' ),
		'section'     => 'colors',
		'settings'    => 'header_bg_color',
	) ) );


	$wp_customize->add_section(
	    'accent_color_option',
	    array(
	        'title'     => __('Accent Color','nisarg'),
	        'priority'  => 200
	    )
	);

	// Add color scheme setting and control.
	$wp_customize->add_setting( 'color_scheme', array(
		'default'           => 'default',
		'sanitize_callback' => 'nisarg_sanitize_color_scheme',
		'transport'         => 'postMessage',
	) );

	$wp_customize->add_control( 'color_scheme', array(
		'label'    => __( 'Accent Color Name', 'nisarg' ),
		'section'  => 'accent_color_option',
		'type'     => 'select',
		'choices'  => nisarg_get_color_scheme_choices(),
		'priority' => 3,
	) );

	// Add custom accent color.

	$wp_customize->add_setting( 'accent_color', array(
		'default'           => $current_color_scheme[0],
		'sanitize_callback' => 'sanitize_hex_color',
		'transport'         => 'postMessage',
	) );

	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, 'accent_color', array(
		'label'       => __( 'Accent Color', 'nisarg' ),
		'description' => __( 'Applied to highlight elements.', 'nisarg' ),
		'section'     => 'accent_color_option',
		'settings'    => 'accent_color',
	) ) );

	//Add section for post option
	$wp_customize->add_section(
	    'post_options',
	    array(
	        'title'     => __('Post Options','nisarg'),
	        'priority'  => 300
	    )
	);

	$wp_customize->add_setting('post_display_option', array(
        'default'        => 'post-excerpt',
        'sanitize_callback' => 'nisarg_sanitize_post_display_option',
		'transport'         => 'refresh'
    ));
 
    $wp_customize->add_control('post_display_types', array(
        'label'      => __('How would you like to dipaly a post on post listing page?', 'nisarg'),
        'section'    => 'post_options',
        'settings'   => 'post_display_option',
        'type'       => 'radio',
        'choices'    => array(
            'post-excerpt' => __('Post excerpt','nisarg'),
            'full-post' => __('Full post','nisarg'),            
        ),
    ));
	
}
add_action( 'customize_register', 'nisarg_customize_register' );

/**
 * Register color schemes for Nisarg.
 *
 * @return array An associative array of color scheme options.
 */
function nisarg_get_color_schemes() {
	return apply_filters( 'nisarg_color_schemes', array(
		'default' => array(
			'label'  => __( 'Default', 'nisarg' ),
			'colors' => array(
				'#009688',			
			),
		),
		'pink'    => array(
			'label'  => __( 'Pink', 'nisarg' ),
			'colors' => array(
				'#FF4081',				
			),
		),
		'orange'  => array(
			'label'  => __( 'Orange', 'nisarg' ),
			'colors' => array(
				'#FF5722',
			),
		),
		'green'    => array(
			'label'  => __( 'Green', 'nisarg' ),
			'colors' => array(
				'#8BC34A',
			),
		),
		'red'    => array(
			'label'  => __( 'Red', 'nisarg' ),
			'colors' => array(
				'#FF5252',
			),
		),
		'yellow'    => array(
			'label'  => __( 'yellow', 'nisarg' ),
			'colors' => array(
				'#FFC107',
			),
		),
		'blue'   => array(
			'label'  => __( 'Blue', 'nisarg' ),
			'colors' => array(
				'#03A9F4',
			),
		),
	) );
}

if(!function_exists('nisarg_current_color_scheme_default_color')):
/**
 * Get the default hex color value for current color scheme
 *
 *
 * @return array An associative array of current color scheme hex values.
 */
function nisarg_current_color_scheme_default_color(){
	$color_scheme_option = get_theme_mod( 'color_scheme', 'default' );
	
	$color_schemes       = nisarg_get_color_schemes();

	if ( array_key_exists( $color_scheme_option, $color_schemes ) ) {
		return $color_schemes[ $color_scheme_option ]['colors'];
	}

	return $color_schemes['default']['colors'];
}
endif; //nisarg_current_color_scheme_default_color

if ( ! function_exists( 'nisarg_get_color_scheme' ) ) :
/**
 * Get the current Nisarg color scheme.
 *
 *
 * @return array An associative array of currently set color hex values.
 */
function nisarg_get_color_scheme() {
	$color_scheme_option = get_theme_mod( 'color_scheme', 'default' );
	$accent_color = get_theme_mod('accent_color','#009688');
	$color_schemes       = nisarg_get_color_schemes();

	if ( array_key_exists( $color_scheme_option, $color_schemes ) ) {
		$color_schemes[ $color_scheme_option ]['colors'] = array($accent_color);
		return $color_schemes[ $color_scheme_option ]['colors'];
	}

	return $color_schemes['default']['colors'];
}
endif; // nisarg_get_color_scheme

if ( ! function_exists( 'nisarg_get_color_scheme_choices' ) ) :
/**
 * Returns an array of color scheme choices registered for Nisarg.
 *
 *
 * @return array Array of color schemes.
 */
function nisarg_get_color_scheme_choices() {
	$color_schemes                = nisarg_get_color_schemes();
	$color_scheme_control_options = array();

	foreach ( $color_schemes as $color_scheme => $value ) {
		$color_scheme_control_options[ $color_scheme ] = $value['label'];
	}

	return $color_scheme_control_options;
}
endif; // nisarg_get_color_scheme_choices

if ( ! function_exists( 'nisarg_sanitize_color_scheme' ) ) :
/**
 * Sanitization callback for color schemes.
 *
 *
 * @param string $value Color scheme name value.
 * @return string Color scheme name.
 */
function nisarg_sanitize_color_scheme( $value ) {
	$color_schemes = nisarg_get_color_scheme_choices();

	if ( ! array_key_exists( $value, $color_schemes ) ) {
		$value = 'default';
	}

	return $value;
}
endif; // nisarg_sanitize_color_scheme

if ( ! function_exists( 'nisarg_sanitize_post_display_option' ) ) :
/**
 * Sanitization callback for post display option.
 *
 *
 * @param string $value post display style.
 * @return string post display style.
 */

function nisarg_sanitize_post_display_option( $value ) {
    if ( ! in_array( $value, array( 'post-excerpt', 'full-post' ) ) )
        $value = 'post-excerpt';
 	
    return $value;
}
endif; // nisarg_sanitize_post_display_option
/**
 * Enqueues front-end CSS for color scheme.
 *
 *
 * @see wp_add_inline_style()
 */
function nisarg_color_scheme_css() {
	$color_scheme_option = get_theme_mod( 'color_scheme', 'default' );
	
	$color_scheme = nisarg_get_color_scheme();

	$color = array(
	'accent_color'            => $color_scheme[0],
	);

	$color_scheme_css = nisarg_get_color_scheme_css( $color);

	wp_add_inline_style( 'nisarg-style', $color_scheme_css );
}
add_action( 'wp_enqueue_scripts', 'nisarg_color_scheme_css' );

/**
 * Returns CSS for the color schemes.
 *
 * @param array $colors Color scheme colors.
 * @return string Color scheme CSS.
 */
function nisarg_get_color_scheme_css( $colors ) {
	$colors = wp_parse_args( $colors, array(
		'accent_color'            => '',
	) );

	$css = <<<CSS
	/* Color Scheme */

	/* Accent Color */

	a:active,
	a:hover,
	a:focus {
	    color: {$colors['accent_color']};
	}

	.navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
		color: {$colors['accent_color']};
	}

	
	.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus {
		color: {$colors['accent_color']};			
	}

	@media (min-width: 768px){
		.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus {
			border-top: 4px solid {$colors['accent_color']};
		}		
	}

	.dropdown-menu > .active > a, .dropdown-menu > .active > a:hover, .dropdown-menu > .active > a:focus {	    
	    background-color: {$colors['accent_color']};
	}


	.navbar-default .navbar-nav > .open > a, .navbar-default .navbar-nav > .open > a:hover, .navbar-default .navbar-nav > .open > a:focus {
		color: {$colors['accent_color']};
	}

	.navbar-default .navbar-nav > li > .dropdown-menu > li > a:hover,
	.navbar-default .navbar-nav > li > .dropdown-menu > li > a:focus {
		color: #fff;
		background-color: {$colors['accent_color']};
	}

	.navbar-default .navbar-nav .open .dropdown-menu > .active > a, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
		background-color: #fff;
		color: {$colors['accent_color']};
	}

	@media (max-width: 767px) {
		.navbar-default .navbar-nav .open .dropdown-menu > li > a:hover {
			background-color: {$colors['accent_color']};
			color: #fff;
		}
	}

	.sticky-post{
	    background: {$colors['accent_color']};
	    color:white;
	}
	
	.entry-title a:hover,
	.entry-title a:focus{
	    color: {$colors['accent_color']};
	}

	.entry-header .entry-meta::after{
	    background: {$colors['accent_color']};
	}

	.fa {
		color: {$colors['accent_color']};
	}

	.btn-default{
		border-bottom: 1px solid {$colors['accent_color']};
	}

	.btn-default:hover, .btn-default:focus{
	    border-bottom: 1px solid {$colors['accent_color']};
	    background-color: {$colors['accent_color']};
	}

	.nav-previous:hover, .nav-next:hover{
	    border: 1px solid {$colors['accent_color']};
	    background-color: {$colors['accent_color']};
	}

	.next-post a:hover,.prev-post a:hover{
	    color: {$colors['accent_color']};
	}

	.posts-navigation .next-post a:hover .fa, .posts-navigation .prev-post a:hover .fa{
	    color: {$colors['accent_color']};
	}


	#secondary .widget-title::after{
		background-color: {$colors['accent_color']};
	    content: "";
	    position: absolute;
	    width: 50px;
	    display: block;
	    height: 4px;    
	    bottom: -15px;
	}

	#secondary .widget a:hover,
	#secondary .widget a:focus{
		color: {$colors['accent_color']};
	}

	#secondary .widget_calendar tbody a {
	    background-color: {$colors['accent_color']};
	    color: #fff;
	    padding: 0.2em;
	}

	#secondary .widget_calendar tbody a:hover{
	    background-color: {$colors['accent_color']};
	    color: #fff;
	    padding: 0.2em;
	}	

CSS;

	return $css;
}

if(! function_exists('nisarg_header_bg_color_css' ) ):
/**
* Set the header background color 
*/
function nisarg_header_bg_color_css(){

?>

<style type="text/css">
        .site-header { background: <?php echo get_theme_mod( 'header_bg_color'); ?>; }
</style>

<?php }

add_action( 'wp_head', 'nisarg_header_bg_color_css' );

endif;

/**
 * Binds JS listener to make Customizer color_scheme control.
 *
 * Passes color scheme data as colorScheme global.
 *
 */
function nisarg_customize_control_js() {
	wp_enqueue_script( 'color-scheme-control', get_template_directory_uri() . '/js/color-scheme-control.js', array( 'customize-controls', 'iris', 'underscore', 'wp-util' ), '20141216', true );
	wp_localize_script( 'color-scheme-control', 'colorScheme', nisarg_get_color_schemes() );
}
add_action( 'customize_controls_enqueue_scripts', 'nisarg_customize_control_js' );


/**
 * Binds JS handlers to make Theme Customizer preview reload changes asynchronously.
 */
function nisarg_customize_preview_js() {
	wp_enqueue_script( 'nisarg_customizer', get_template_directory_uri() . '/js/customizer.js', array( 'customize-preview' ), '20130508', true );
}
add_action( 'customize_preview_init', 'nisarg_customize_preview_js' );

/**
 * Output an Underscore template for generating CSS for the color scheme.
 *
 * The template generates the css dynamically for instant display in the Customizer
 * preview.
 *
 */
function nisarg_color_scheme_css_template() {
	$colors = array(
		'accent_color'            => '{{ data.accent_color }}',
	);
	?>
	<script type="text/html" id="tmpl-nisarg-color-scheme">
		<?php echo nisarg_get_color_scheme_css( $colors ); ?>
	</script>
	<?php
}
add_action( 'customize_controls_print_footer_scripts', 'nisarg_color_scheme_css_template' );
