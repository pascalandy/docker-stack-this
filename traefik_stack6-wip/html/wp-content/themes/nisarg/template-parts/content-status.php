<?php
/**
 * Template part for displaying posts.
 *
 * @package Nisarg
 */

?>
<article id="post-<?php the_ID(); ?>" <?php post_class('post-content'); ?>>
			
	<?php nisarg_featured_image_disaplay(); ?>
	<header class="entry-header">
		<span class="screen-reader-text"><?php the_title();?></span>
	    <div class="entry-meta">
				<h5 class="entry-date"><?php nisarg_posted_on(); ?></h5>
		</div><!-- .entry-meta -->
	</header>
    
	<div class="entry-content">
		<?php the_content('...<p class="read-more"><a class="btn btn-default" href="'. esc_url(get_permalink( get_the_ID() )) . '">' . __(' Read More', 'nisarg') . '<span class="screen-reader-text"> '. __(' Read More', 'nisarg').'</span></a></p>'); ?>
		<?php
			wp_link_pages( array(
				'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'nisarg' ),
				'after'  => '</div>',
			) );
		?>
	</div><!-- .entry-content -->
	
	<footer class="entry-footer">
		<?php nisarg_entry_footer(); ?>
	</footer><!-- .entry-footer -->
</article><!-- #post -->
