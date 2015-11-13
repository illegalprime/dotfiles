
pub trait I3 {
    fn name() -> &str;

    fn instance() -> Option<&str>;

    fn text() -> &str;

    #[inline]
    fn color() -> Option<u32> {
        None
    }
}
