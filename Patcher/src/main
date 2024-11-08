use std::fs;
use std::path::PathBuf;
use std::time::Instant;
use clap::Parser;
use winreg::{enums::HKEY_CLASSES_ROOT, RegKey};

#[rustfmt::skip]
const SIGNATURE: &[u8] = &[
    0x48, 0x81, 0xEC, 0x40, 0x03, 0x00, 0x00, 0x84, 0xD2, 0x74, 0x05, 0xE8
];

#[rustfmt::skip]
const PATCH: &[u8] = &[
    0x48, 0x81, 0xEC, 0x40, 0x03, 0x00, 0x00, 0x84, 0xD2, 0x90, 0x90, 0xE8
];

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
struct Cli {
    input: Option<PathBuf>,
    output: Option<PathBuf>,
}

fn patch(input: &PathBuf, output: &PathBuf) {
    let mut binary = fs::read(input).expect("Not read input file");
    let offset = binary
        .windows(SIGNATURE.len())
        .position(|window| window == SIGNATURE)
        .expect("Not found");
    binary[offset..offset+PATCH.len()].copy_from_slice(PATCH);
    fs::write(output, binary).expect("Cant overwrite");
}

fn main() {
    let Cli { input,output } = Cli::parse();

    #[rustfmt::skip]
    let input = input.unwrap_or_else(|| {
        let path: String = RegKey::predef(HKEY_CLASSES_ROOT)
            .open_subkey("roblox-studio").unwrap()
            .open_subkey("DefaultIcon").unwrap()
            .get_value("").unwrap();

        PathBuf::from(path)
    });

    let output = output.unwrap_or_else(|| input.clone());
    let now = Instant::now();
    patch(&input, &output);
    println!("Patched {:?}.", now.elapsed());
}
