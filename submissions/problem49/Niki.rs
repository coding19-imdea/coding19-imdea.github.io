use std::fs::File;
use std::io::{BufRead, BufReader};
use std::collections::HashSet;


fn modpow(base : usize, exp : usize, m : usize) -> usize {
    let mut k = 1;
    let mut j = 0;
    while j < exp {
      k = (k * base).rem_euclid(m);
      j += 1;
    }
    k
}

fn main() {
      let filename = "input.txt";

      let file = File::open(filename).unwrap();
      let mut reader = BufReader::new(file); // .lines();
  
      // Parse n m
      let mut s = String::new();
      reader.read_line(&mut s).unwrap();
      let values = s
          .split_whitespace()
          .map(|x| x.parse::<usize>())
          .collect::<Result<Vec<usize>, _>>()
          .unwrap();
      assert!(values.len() == 2);
      let n = values[0];
      let m = values[1];
      // println!("n = {}, m = {}", n, m);

      let mut edges = Vec::new();
      for i in 2..(m+2) {
        let mut sa = String::new();
        reader.read_line(&mut sa).unwrap();
        let read = sa
            .split_whitespace()
            .map(|x| x.parse::<usize>())
            .collect::<Result<Vec<usize>, _>>()
            .unwrap();
        // println!("read = ({}, {})" , read[0], read[2]);
        edges.push((read[0], read[1]));
  
      }
      assert!(edges.len() == m);

      let modulo = 998244353;

      // Find Conneted Components 
      let mut ccnum = 0;
      let mut cc = Vec::new();
      for i in 0..n+1 {
        cc.push(None);
      }
      for (u,v) in edges.iter(){
        match (cc[*u], cc[*v]){
          (None,None) => {
            ccnum +=1 ;
            cc[*u] = Some(ccnum);
            cc[*v] = Some(ccnum);
            // println!("New CC: edge = ({}, {}) cc = {}" , u,v, ccnum);
          }
          (Some(i),Some(j)) => {
            if i == j {
            //  println!("Already: edge = ({}, {}) cc = {}" , u,v, i);
            } else {
              let imin = if i <= j {i} else {j};
              let imax = if i >= j {i} else {j};

              //Update CC 
              for ii in 1..n+1 {
                match cc[ii] {
                  None => {}
                  Some(jj) => if jj == imax {cc[ii] = Some(imin);}
                }
              }
              for ii in 0..n+1 {
                match cc[ii] {
                  None => {}
                  Some(jj) => if jj >= imax {cc[ii] = Some(jj-1);}
                }
              }
              ccnum -=1 ;
              //println!("Merged CC: edge = ({}, {}) cc = {} {}" , u,v, imin, imax);
            }
          }
          (Some(i),None) => {
            cc[*v] = Some(i);
            // println!("Add1: edge = ({}, {}) cc = {}" , u,v, i);
          }
          (None,Some(i)) => {
            cc[*u] = Some(i);
            // println!("Add2: edge = ({}, {}) cc = {}" , u,v, i);
          }
        }
      }
      
     let res :usize = modpow(2,ccnum,modulo);
      println!("result = {}" , res.rem_euclid(modulo));
}
