<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package Nisarg
 */

?>

	</div><!-- #content -->
	
	<footer id="colophon" class="site-footer" role="contentinfo">
		<div class="row site-info">
			<?php echo '&copy; '.date("Y"); ?> 
			<span class="sep"> | </span>
			<?php printf( esc_html__( 'Proudly Powered by ','nisarg')); ?>
			<a href="<?php echo esc_url( __( 'https://wordpress.org/', 'nisarg' ) ); ?>">WordPress</a>
			<span class="sep"> | </span>

			<?php 
			$nisarg_theme_author_str =  '<a href="'.esc_url('http://www.falgunidesai.com/').'" rel="designer">Falguni Desai</a>'; 
			printf( esc_html__( 'Theme: %1$s by %2$s.', 'nisarg' ), 'Nisarg',$nisarg_theme_author_str); 
			?>

		</div><!-- .site-info -->
	</footer><!-- #colophon -->
</div><!-- #page -->
<?php wp_footer(); ?>
</body>
</html>
