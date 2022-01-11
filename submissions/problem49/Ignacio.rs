use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;



fn main() {
    let mut left: Vec<usize> = vec![];
    let mut right: Vec<usize> = vec![];
    if let Ok(lines) = read_lines("49.txt"){
	for line in lines{
	   if let line_string = line {
                let stringc = line_string.unwrap();
		let pair_string: Vec<&str>=stringc.split(" ").collect();
		left.push(pair_string[0].parse::<usize>().unwrap());
		right.push(pair_string[1].parse::<usize>().unwrap());	
            }

	}
   }
   let number_nodes=left.remove(0);
   let _=right.remove(0);
   let mut neighbours: Vec<Vec<usize>> = vec![vec![];number_nodes+1];
   for i in 0..left.len(){
      neighbours[left[i]].push(right[i]);
      neighbours[right[i]].push(left[i]);
   }

   let result=modular_exp(2,count_connected_components(left, neighbours), 998244353);
   println!("{}",result);
}


fn count_connected_components(left:Vec<usize>, neighbours:Vec<Vec<usize>>) -> usize {
        let mut count: usize = 0;    
        let mut current_component: Vec<usize> = vec![];
	let mut remaining_nodes = left.clone();
	    

	while remaining_nodes.len()!=0{
	    let mut i=0;
            current_component.push(remaining_nodes[0]);
	    while i<current_component.len(){
	        for x in &neighbours[current_component[i]]{
			if !current_component.contains(x){			
				current_component.push(*x);
			}		
		}
	    	i+=1;
	    }
	    count+=1;
	    //println!("{:?}",current_component);
	    remaining_nodes.retain(|&value| !current_component.contains(&value));
	    current_component.clear();
	}
        count
}

fn modular_exp(mut base:usize, mut exp:usize, modulus:usize)->usize{
	let mut result=1;
	while exp>0{
		if exp%2!=0{
			result=result*base;
			result=result%modulus;
		}
		exp=exp/2;
		base=base*base;
		base=base%modulus;
	}
	result
} 


fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}







