use std::cmp;

fn solve(d:u64, m:u64) -> u64 {
    let mut res = 1; 
    let mut k   = 1;  
    while k <= d {
        res = (res * (cmp::min(2 * k - 1,d) - k + 2)).rem_euclid(m);
        k   *= 2 ;
    }
    (res - 1 + m).rem_euclid(m)  
}


fn main() {
    let cin = std::io::stdin();
    let mut s = String::new();
    cin.read_line(&mut s).unwrap();
    let values = s
        .split_whitespace()
        .map(|x| x.parse::<u64>())
        .collect::<Result<Vec<u64>, _>>()
        .unwrap();
    assert!(values.len() == 2);
    let d = values[0];
    let m = values[1];
    println!("d = {}, m = {}", d, m);

//    let d = 860004020;
//    let m = 340873756; 

    println!("solution = {}", solve(d,m));

}
