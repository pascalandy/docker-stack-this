<?php
/**
 * Jetpack Compatibility File
 * See: https://jetpack.me/
 *
 * @package Nisarg
 */

/**
 * Add theme support for Infinite Scroll.
 * See: https://jetpack.me/support/infinite-scroll/
 */
function nisarg_jetpack_setup() {
	add_theme_support( 'infinite-scroll', array(
		'container' => 'main',
		'render'    => 'nisarg_infinite_scroll_render',
		'footer'    => 'page',
	) );
} // end function nisarg_jetpack_setup
add_action( 'after_setup_theme', 'nisarg_jetpack_setup' );

/**
 * Custom render function for Infinite Scroll.
 */
function nisarg_infinite_scroll_render() {
	while ( have_posts() ) {
		the_post();
		get_template_part( 'template-parts/content', get_post_format() );
	}
} // end function nisarg_infinite_scroll_render
