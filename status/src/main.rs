extern crate notify_rust;

mod watchers;

use notify_rust::Notification;

fn main() {
    let minutes = 5;
	Notification::new()
		.summary("Low Battery")
		.body(&format!("Your battery doesn't have enough calcium! Updoot now or face Mr. Skeltal in {} minutes!", minutes))
		.icon("battery")
		.show()
        .unwrap();
}

struct Battery {
    path: String,
}
