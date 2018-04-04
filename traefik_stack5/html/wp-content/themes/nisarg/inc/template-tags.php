<?php
/**
 * Custom template tags for this theme.
 *
 * Eventually, some of the functionality here could be replaced by core features.
 *
 * @package Nisarg
 */


if ( ! function_exists( 'nisarg_posts_navigation' ) ) :
/**
 * Display navigation to next/previous set of posts when applicable.
 *
 * @todo Remove this function when WordPress 4.3 is released.
 */
function nisarg_posts_navigation() {
	// Don't print empty markup if there's only one page.
	if ( $GLOBALS['wp_query']->max_num_pages < 2 ) {
		return;
	}
	?>
	<nav class="navigation posts-navigation" role="navigation">
		<h2 class="screen-reader-text"><?php esc_html_e( 'Posts navigation', 'nisarg' ); ?></h2>
		<div class="nav-links">

			<div class="row">
				<?php if ( get_previous_posts_link() ) { ?>
				<div class="col-md-6 next-post">
				<?php previous_posts_link('<i class="fa fa-angle-double-left"></i>
'. __( 'NEWER POSTS', 'nisarg' ) ); ?>
				</div>
				<?php } else {
					echo '<div class="col-md-6">';
					echo '<p> </p>';
					echo '</div>';
				} ?>			
			
				<?php if ( get_next_posts_link() ) { ?>	
				<div class="col-md-6 prev-post">		
				<?php next_posts_link( __( 'OLDER POST', 'nisarg' ).'<i class="fa fa-angle-double-right"></i>' ); ?>
				</div>
				<?php }	else{
					echo '<div class="col-md-6">';
					echo '<p> </p>';
					echo '</div>';
				} ?>
				</div>		
		</div><!-- .nav-links -->
	</nav><!-- .navigation -->
	<?php
}
endif;

if ( ! function_exists( 'nisarg_post_navigation' ) ) :
/**
 * Display navigation to next/previous post when applicable.
 *
 * @todo Remove this function when WordPress 4.3 is released.
 */
function nisarg_post_navigation() {
	// Don't print empty markup if there's nowhere to navigate.
	$previous = ( is_attachment() ) ? get_post( get_post()->post_parent ) : get_adjacent_post( false, '', true );
	$next     = get_adjacent_post( false, '', false );

	if ( ! $next && ! $previous ) {
		return;
	}
	?>
	<nav class="navigation" role="navigation">
		<h2 class="screen-reader-text"><?php esc_html_e( 'Post navigation', 'nisarg' ); ?></h2>
		<div class="nav-links">
			<div class="row">
			<!-- Get Next Post -->
			
			<?php
				$next_post = get_next_post();
				if ( is_a( $next_post , 'WP_Post' ) ) { 
			?>
			<div class="col-md-6 next-post">
			<a class="" href="<?php echo esc_url(get_permalink( $next_post->ID )); ?>"><span class="next-prev-text"><i class="fa fa-angle-left"></i>
 <?php _e(' NEXT','nisarg'); ?></span><br><?php if(get_the_title( $next_post->ID ) != ''){echo get_the_title( $next_post->ID );} else {  _e('Next Post','nisarg'); }?></a>
			</div>
			<?php } 
			 else { 
				echo '<div class="col-md-6">';
				echo '<p> </p>';
				echo '</div>';
			} ?>
			
			<!-- Get Previous Post -->
			
			<?php
				$prev_post = get_previous_post();
				if (!empty( $prev_post )){
			?>
				<div class="col-md-6 prev-post">
				<a class="" href="<?php echo esc_url(get_permalink( $prev_post->ID )); ?>"><span class="next-prev-text"><?php _e('PREVIOUS ','nisarg'); ?><i class="fa fa-angle-right"></i>
</span><br><?php if(get_the_title( $prev_post->ID ) != ''){echo get_the_title( $prev_post->ID );} else { _e('Previous Post','nisarg'); }?></a>
				</div>
			<?php } 
			 else { 
				echo '<div class="col-md-6">';
				echo '<p> </p>';
				echo '</div>';
			} ?>
			
			</div>
		</div><!-- .nav-links -->
	</nav><!-- .navigation-->
	<?php
}
endif;

if ( ! function_exists( 'nisarg_posted_on' ) ) :
/**
 * Prints HTML with meta information for the current post-date/time and author.
 */
function nisarg_posted_on() {

$viewbyauthor_text = __( 'View all posts by', 'nisarg' ).' %s';

$entry_meta = '<i class="fa fa-calendar-o"></i> <a href="%1$s" title="%2$s" rel="bookmark"><time class="entry-date" datetime="%3$s" pubdate>%4$s </time></a><span class="byline"><span class="sep"></span><i class="fa fa-user"></i>
<span class="author vcard"><a class="url fn n" href="%5$s" title="%6$s" rel="author">%7$s</a></span></span>';

	$entry_meta = sprintf($entry_meta,
		esc_url( get_permalink() ),
        esc_attr( get_the_time() ),
        esc_attr( get_the_date( 'c' ) ),
        esc_html( get_the_date() ),
        esc_url( get_author_posts_url( get_the_author_meta( 'ID' ) ) ),
        esc_attr( sprintf( $viewbyauthor_text, get_the_author() ) ),
        esc_html( get_the_author() ));

    print $entry_meta;

	if(comments_open()){	
		printf(' <i class="fa fa-comments-o"></i><span class="screen-reader-text">%1$s </span> ',_x( 'Comments', 'Used before post author name.', 'nisarg' ));
		comments_popup_link( __('0 Comment','nisarg'), __('1 comment','nisarg'), __('% comments','nisarg'), 'comments-link', '');
	}
}
endif;

if ( ! function_exists( 'nisarg_entry_footer' ) ) :
/**
 * Prints HTML with meta information for the categories, tags and comments.
 */
function nisarg_entry_footer() {

	if(is_single())
		echo '<hr>';
	
 	if(!is_home() && !is_search() && !is_archive()){
			
			if ( 'post' == get_post_type() ) {
				/* translators: used between list items, there is a space after the comma */
				$categories_list = get_the_category_list( esc_html__( ', ', 'nisarg' ) );
				echo '<div class="row">';
				if ( $categories_list && nisarg_categorized_blog() ) {
					printf( '<div class="col-md-6 cattegories"><span class="cat-links"><i class="fa fa-folder-open"></i>
		 ' . esc_html__( '%1$s', 'nisarg' ) . '</span></div>', $categories_list ); // WPCS: XSS OK.
				}
				else{
					echo '<div class="col-md-6 cattegories"><span class="cat-links"><i class="fa fa-folder-open"></i></span></div>'; 
				}

				
				$tags_list = get_the_tag_list( '', esc_html__( ', ', 'nisarg' ) );
				if ( $tags_list ) {
					printf( '<div class="col-md-6 tags"><span class="tags-links"><i class="fa fa-tags"></i>' . esc_html__( ' %1$s', 'nisarg' ) . '</span></div>', $tags_list ); // WPCS: XSS OK.
				}
				
				echo '</div>';
			}
	}
	
	edit_post_link( esc_html__( 'Edit This Post', 'nisarg' ), '<br><span>', '</span>' );
		
}
endif;


/**
 * Returns true if a blog has more than 1 category.
 *
 * @return bool
 */
function nisarg_categorized_blog() {
	if ( false === ( $all_the_cool_cats = get_transient( 'nisarg_categories' ) ) ) {
		// Create an array of all the categories that are attached to posts.
		$all_the_cool_cats = get_categories( array(
			'fields'     => 'ids',
			'hide_empty' => 1,

			// We only need to know if there is more than one category.
			'number'     => 2,
		) );

		// Count the number of categories that are attached to the posts.
		$all_the_cool_cats = count( $all_the_cool_cats );

		set_transient( 'nisarg_categories', $all_the_cool_cats );
	}

	if ( $all_the_cool_cats > 1 ) {
		// This blog has more than 1 category so nisarg_categorized_blog should return true.
		return true;
	} else {
		// This blog has only 1 category so nisarg_categorized_blog should return false.
		return false;
	}
}

/**
*  Display featured image of the post
**/

function nisarg_featured_image_disaplay(){
	if ( has_post_thumbnail() && ! post_password_required() && ! is_attachment() ) {  // check if the post has a Post Thumbnail assigned to it. 
        echo '<div class="featured-image">';
            the_post_thumbnail('nisarg-full-width');
        echo '</div>';
    } 
}

/**
 * Flush out the transients used in nisarg_categorized_blog.
 */
function nisarg_category_transient_flusher() {
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
		return;
	}
	// Like, beat it. Dig?
	delete_transient( 'nisarg_categories' );
}
add_action( 'edit_category', 'nisarg_category_transient_flusher' );
add_action( 'save_post',     'nisarg_category_transient_flusher' );
