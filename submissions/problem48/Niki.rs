use std::cmp;
use std::fs::File;
use std::io::{BufRead, BufReader};
use num_integer;

fn pow(a:usize,x:usize,m:usize) -> usize{
  let mut res = 1; 
  for i in 1..(x+1){
      res = (res * a).rem_euclid(m);
  }
  res 
}

fn combinations (n:usize,m:usize) -> usize{
    // C(2n, n)
    let mut u = 1; 
    let mut d = 1; 
    for i in 1..(n+1){
        u = (u * (n+i)).rem_euclid(m); 
    } 
    for i in 1..(n+1){
        d = (d * i).rem_euclid(m);
    }
    let inv= pow(d,(m-2),m);
    (u* inv).rem_euclid(m)
}
fn main() {
    let filename = "input.txt";
    // Open the file in read-only mode (ignoring errors).
    let file = File::open(filename).unwrap();
    let mut reader = BufReader::new(file); // .lines();

    // Parse n 
    //let cin = std::io::stdin();
    let mut s = String::new();
    reader.read_line(&mut s).unwrap();
    let values = s
        .split_whitespace()
        .map(|x| x.parse::<usize>())
        .collect::<Result<Vec<usize>, _>>()
        .unwrap();
    // println!("res = {}", values.len());
    assert!(values.len() == 1);
    let n = values[0];

    // Parse array 
    let mut sa = String::new();
    reader.read_line(&mut sa).unwrap();
    let mut a = sa
        .split_whitespace()
        .map(|x| x.parse::<usize>())
        .collect::<Result<Vec<usize>, _>>()
        .unwrap();
    assert!(a.len() == 2 * n);

    // compute sorted "sum"
    a.sort(); 
    let m : usize = 998244353; 
    let mut sum :usize = 0; 
    for i in 0..n{
        sum = (sum + a[i+n] - a[i]).rem_euclid(m);
        // println!("sum = {} a[i] = {}", sum, a[i]);
    }

    // take combinations
//    let cc = num_integer::binomial(2*n,n);
    let cc = combinations(n,m);
    let res = (sum * cc).rem_euclid(m); 
    println!("cc = {}, res = {}", cc, res);
}
