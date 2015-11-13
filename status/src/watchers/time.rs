extern crate chrono;

use self::chrono::UTC;
use super::Update;

pub struct Time {
    epoch: i64,
}

impl Update for Time {
    fn update(&mut self) {
        self.epoch = UTC::now().timestamp();
    }
}
